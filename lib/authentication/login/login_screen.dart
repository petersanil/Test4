import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aquaventure/constants/app_constants.dart';
import 'package:aquaventure/constants/app_colors.dart';
import 'package:aquaventure/core/app_exceptions.dart';
import 'package:aquaventure/core/custom_widgets/custom_logo_app_bar.dart';
import 'package:aquaventure/core/custom_widgets/custom_solid_buttom.dart';
import 'package:aquaventure/core/custom_widgets/custom_text_form_field.dart';
import 'package:aquaventure/core/mixins/image_utils.dart';
import 'package:aquaventure/core/mixins/user_profile.dart';
import 'package:aquaventure/models/ModelProvider.dart';
import 'package:aquaventure/models/Profiles.dart';
import 'package:aquaventure/nfcband/nfc_wirstband_link_screen.dart';
import 'package:aquaventure/sharedprefrence/sharedprefrences.dart';
import 'package:aquaventure/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const
  LoginScreen({Key? key}) :super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends
State<LoginScreen> with UserProfileMixin, ImageUtils {
  final _formKey = GlobalKey<FormState>();
  bool loader = false;

  bool rememberMe = false;

  bool hidePassword = true;

  bool validEmail = false;

  bool validPassword = false;

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void
  initState() {
    super.initState();
    userController.text = "sanil.speter@ust.com";
    passwordController.text = "";
    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) {
      getEmail();
      initTimer();

    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: CustomLogoAppBar(title:
          'Staff Login',
          ),
          backgroundColor: Colors.
          white,
          body: Form(key:
          _formKey, child: (
              loginForm()
          ))
      );
  }

  Widget loginForm() {
    return Column(children: [
      Expanded(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            const SizedBox(
              // height: MediaQuery.of(context).size.height * 0.15,
              height: 10,
            ),
            CustomTextFormField(
              controller: userController,
              hint: "Enter User ID",
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.disabled,


            ),

            CustomTextFormField(

                controller: passwordController,
                hint: "Enter Password",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                obscureText: true,
                autovalidateMode: AutovalidateMode.disabled,
                validator: (val) => val!.isEmpty ? 'password is required' : null,
                // onChanged: (val) {
                //   setState(() => passwordController.text = val);
                // }


                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      validPassword = false;
                    });
                  } else {
                    setState(() {
                      validPassword = true;
                    });
                  }
                }


              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please enter your password';
              //   } else if (!Helper.isvalidPassword(value)) {
              //     return "Please enter a valid password";
              //   }
              //   return null;
              // }

            ),
            const Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 80,right: 15,left: 15),
        width: double.infinity,
        child: CustomSolidButton(
          padding: EdgeInsets.all(10),
          buttonColor:
          validPassword ? AppColors.PRIMARY_COLOR : AppColors.DIVIDER_COLOR,
          borderColor:
          validPassword ? AppColors.PRIMARY_COLOR : AppColors.DIVIDER_COLOR,
          loading: loader,
          onTap: validPassword
              ? () async {
            if (!loader && _formKey.currentState!.validate()) {
              if (await Helper.checkConnectivity()) {
                _signIn();
              } else {
                Helper.showSnackbar(
                    context: context,
                    message: AppConstants.NO_INTERNET_CONNECTION);
              }
            }
          } :  null

          // onTap: () async {
          //         if (!loader && _formKey.currentState!.validate()) {
          //           if (await Helper.checkConnectivity()) {
          //
          //             print("login");
          //             //login(userController.text.toString(), passwordController.text.toString());
          //           } else {
          //             Helper.showSnackbar(
          //                 context: context,
          //                 message: AppConstants.NO_INTERNET_CONNECTION);
          //           }
          //         }
          //       }
          ,
          child: const Text(
            "LOGIN",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: AppConstants.AVERTAPE_FONT,
                fontSize: 16,
                letterSpacing: 1.5),
          ),
        ),
      ),
    ]);


  }

  _signIn() async
  {
    try {
      setState(() {
        loader = true;
      });
      SignInResult res = await
      Amplify.Auth.signIn(
        username: userController.text.trim(),
        password: passwordController.text.trim(),
      );

/* SignInResult res = await Amplify.Auth.signIn(

username: userController.text.trim(),

// password: passwordController.text.trim(),

options: const SignInOptions(

pluginOptions: CognitoSignInPluginOptions(

authFlowType: AuthenticationFlowType.customAuthWithoutSrp)));*/

      if (res.isSignedIn) {
        final
        currentUser = await
        Amplify.Auth.getCurrentUser();
        Profiles? profile = await
        getUserProfile(currentUser.userId);
        if (profile != null) {
          String imageUrl = '';
          if
          (profile.profile_pic != null && profile.profile_pic!.isNotEmpty) {
            imageUrl = await getDownloadUrl(
                key: profile.profile_pic!,
                accessLevel: StorageAccessLevel.protected
            );
            Helper.printLog("Download image : $imageUrl ");
          }
          saveUserDetails(
              emailId: userController.text,
              userId: currentUser.userId,
              imageUrl: imageUrl,
              profile: profile,
              rememberMe: rememberMe
          );
          saveCompleteProfileStatus(status: true);
          navigateToHomePage();
        }
        else {
          /// It means complete profile is pending
          saveUserDetails(
              userId: currentUser.userId,
              emailId: userController.text
          );
//navigateToCompleteAccount();

          navigateToHomePage();

// Helper.showSnackbar(

// context: context, message: AppConstants.USER_DETAILS_FAILED);
        }

        /// It means otp verification is pending
      }
    } on ResourceNotFoundException catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      Helper.printLog(e.toString());
      await Helper.signOutUser();
      Helper.showSnackbar(
          context: context, message: AppConstants.USER_NOT_FOUND);
    } on InvalidStateException catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      Helper.printLog(e.toString());
      await Helper.signOutUser();
      Helper.showSnackbar(context: context, message: e.message);
    } on UserNotConfirmedException catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      Helper.printLog(e.toString());
      Helper.showSnackbar(context: context, message: e.message);
    } on ApiException catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      Helper.printLog(e.toString());
      Helper.showSnackbar(context: context, message: e.message);
    } on UserNotFoundException catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      Helper.printLog(e.toString());
      Helper.showSnackbar(context: context, message: e.message!);
    } on AuthException catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      Helper.printLog(e.toString());
      Helper.showSnackbar(context: context, message: e.message);
    } on AppException catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      Helper.printLog(e.toString());
      Helper.showSnackbar(context: context, message: e.message);
    } catch (e, stacktrace) {
      Helper.captureException(e, stacktrace);
      Helper.printLog(e.toString());
      Helper.showSnackbar(
          context: context, message: AppConstants.SOMETHING_WENT_WRONG);
    }
    setState(() {
      loader = false;
    });
  }

  void saveCompleteProfileStatus({required bool status}) {
    SharedprefUtils.setBool(AppConstants.completedProfile, status);
  }

  void navigateToHomePage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NfcLinkScreen()));
  }
  initTimer() {


    Timer(const Duration(seconds: 2), () {
      /// Get user login status
      bool isLoggedIn = SharedprefUtils.getBool(AppConstants.loggedIn);
      if (isLoggedIn) {
        setState(() {
          loader = true;
          navigateToHomePage();
        });

        /// Check user filled the profile or not
      } else {
        loginForm();

      }
    });
  }

  void getEmail() {
    if (SharedprefUtils.getBool(AppConstants.rememberMe)) {
      userController.text = SharedprefUtils.getString(AppConstants.emailId);
      setState(() {
        rememberMe = true;
        validPassword = true;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}