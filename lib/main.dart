import 'dart:async';

import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:aquaventure/authentication/login/login_screen.dart';
import 'package:aquaventure/constants/app_constants.dart';
import 'package:aquaventure/constants/app_colors.dart';
import 'package:aquaventure/core/app_exceptions.dart';
import 'package:aquaventure/core/custom_widgets/custom_loader.dart';
import 'package:aquaventure/localization/app_localization.dart';
import 'package:aquaventure/models/ModelProvider.dart';
import 'package:aquaventure/sharedprefrence/sharedprefrences.dart';
import 'package:aquaventure/utils/helper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// Amplify Flutter Packages
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:launchdarkly_flutter_client_sdk/launchdarkly_flutter_client_sdk.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

// Generated in previous step
import 'amplifyconfiguration.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();
  runApp(const MyApp());
}

Future<void> initializeApp() async {
  await initEnv();
  if (kReleaseMode) {
    //await initTalsec();
  }
  await initHydratedStorage();
  await initInAppWebView();
  await initSharedPrefs();
  await initSentry();
  await initLaunchDarkly();

  /// Should be initialized after Sharedprefrence initialization
  await setPreferredOrientation();
}

Future<void> initLaunchDarkly() async {
  LDConfig config = LDConfigBuilder(
          dotenv.env["LAUNCH_DARKLY_MOBILE_KEY"]!, AutoEnvAttributes.Enabled)
      .build();
  LDContextBuilder builder = LDContextBuilder();

  String userId = SharedprefUtils.getString(AppConstants.userId);
  String emailId = SharedprefUtils.getString(AppConstants.emailId);

  if (userId.isNotEmpty) builder.kind('user', userId);
  if (emailId.isNotEmpty) builder.kind("email", emailId);

  LDContext context = builder.build();

  await LDClient.start(config, context);
  await LDClient.startFuture();
}

Future<void> initEnv() async {
  await dotenv.load(fileName: ".env");
  if (dotenv.env['ENVIRONMENT'] == "PROD") {
    await dotenv.load(fileName: ".env_prod");
  } else {
    await dotenv.load(fileName: ".env_dev");
  }
}

Future<void> initHydratedStorage() async {
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
}

Future<void> initInAppWebView() async {
  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(false);
  }
}

Future<void> initSharedPrefs() async {
  await SharedprefUtils.init();
}






Future<void> initSentry() async {
  await SentryFlutter.init(
    (options) {
      options.dsn = dotenv.env["SENTRY_DSN_URL"];
      options.tracesSampleRate = 0.1;
      options.environment = dotenv.env["ENVIRONMENT"];
      options.debug = false;
    },
    appRunner: () => setPreferredOrientation().then((_) {
      String userId = SharedprefUtils.getString(AppConstants.userId);
      String emailId = SharedprefUtils.getString(AppConstants.emailId);
      Sentry.configureScope(
            (scope) => scope.setUser(SentryUser(id: userId, email: emailId)),
      );
      runApp(const MyApp());
    }),
  );
}

Future<void> setPreferredOrientation() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

/*Future<void> initTalsec() async {
  // create configuration for freeRASP
  final config = TalsecConfig(
    /// For Android
    androidConfig: AndroidConfig(
      packageName: dotenv.env["PACKAGE_NAME"]!,
      signingCertHashes: [
        dotenv.env["SIGNING_HASH1"]!,
        dotenv.env["SIGNING_HASH2"]!
      ],
    ),

    /// For iOS
    iosConfig: IOSConfig(
      bundleIds: [dotenv.env["PACKAGE_NAME"]!],
      teamId: dotenv.env["TEAM_ID"]!,
    ),
    watcherMail: dotenv.env["SUPPORT_EMAIL"]!,
    isProd: true,
  );

  // Setting up callbacks
  final callback = ThreatCallback(
    onAppIntegrity: () => exitUser("App integrity issue"),
    onObfuscationIssues: () => exitUser("Code not obfuscated"),
    onDebug: () => exitUser("App is in debug mode"),
    onDeviceBinding: () => exitUser("Talsec device binding"),
    onDeviceID: () => exitUser("Talsec device id"),
    onHooks: () => exitUser("Talsec hooks"),
    // onPasscode: () => exitUser("Talsec passcode not set"),
    onPrivilegedAccess: () => exitUser("Talsec Privileged access"),
    onSecureHardwareNotAvailable: () =>
        exitUser("Talsec Secure hardware not available"),
    // onSimulator: () => exitUser("Talsec Simulator"),
    // onUnofficialStore: () => exitUser("Unofficial store"),
  );

  // Attaching listener
  Talsec.instance.attachListener(callback);
  await Talsec.instance.start(config);
}*/

void exitUser(String message) {
  Helper.printLog("Talsec : $message");
  Helper.captureException(AppException(message: message), null);
  Helper.signOutUser();
  navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => ExitUserScreen()),
      (Route<dynamic> route) => false);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  initState() {
    super.initState();
    //navigateToAuthOptions();
    initializeNetworkListener();
    _configureAmplify();
  }


  navigateToAuthOptions() {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (_) => const LoginScreen()),
            (route) => false);
  }

  Future<void> _configureAmplify() async {
    try {
      //    final datastorePlugin = AmplifyDataStore(modelProvider: ModelProvider.instance);
      AmplifyAPI api = AmplifyAPI(modelProvider: ModelProvider.instance);
      AmplifyStorageS3 storage = AmplifyStorageS3();
      AmplifyAuthCognito auth = AmplifyAuthCognito();
      await Amplify.addPlugins([auth, api, storage]);
      await Amplify.configure(amplifyconfig);
    } on Exception catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      safePrint('An error occurred configuring Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atlantis Aquaband+',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldKey,
      theme: ThemeData(
        fontFamily: AppConstants.AVERTAPE_FONT,
        primaryColor: AppColors.PRIMARY_COLOR,
        useMaterial3: false
      ),
      home:  const LoaderOverlay(
        // overlayWidgetBuilder: (_){
        //   return Center(
        //     child: CustomCircleLoader(color: AppColors.PRIMARY_COLOR,),
        //   );
        // },
        overlayColor: AppColors.PRIMARY_COLOR,
          child: LoginScreen()),
      navigatorObservers: [
        SentryNavigatorObserver(),
      ],
    );
  }

  void initializeNetworkListener() {
    const snackBar = SnackBar(
      backgroundColor: AppColors.PRIMARY_COLOR,
      duration: Duration(days: 10),
      content: Text(
        AppConstants.NO_INTERNET_CONNECTION,
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      Helper.printLog(result.name);
      if (result == ConnectivityResult.none) {
        scaffoldKey.currentState?.showSnackBar(snackBar);
      } else {
        scaffoldKey.currentState?.clearSnackBars();
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }
}

class ExitUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                "Jailbreak Detected",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                  "Your phone appears to be jailbroken; for security reasons, access to Aquaband+ cannot be granted. Please use a secure device.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.TEXT_GREY_COLOR)),
            ),
          ],
        ),
      ),
    );
  }
}
