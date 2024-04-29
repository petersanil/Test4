import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../constants/app_images.dart';
import 'items/home_items.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> carousalImages = [
    AppImages.HOME_CAROUSAL_5,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aquaventure Kiosk',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: scaffoldBody(),
    );
  }

  Widget scaffoldBody() {
    double carousalHeight = 200;
    return ListView(
      padding: const EdgeInsets.only(
        top: 0,
        bottom: 10,
      ),
      children: [
        Stack(
          children: [
            Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: false, aspectRatio: 1.9, viewportFraction: 1.0),
                  items: carousalImages.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          height: carousalHeight,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            child: Image.asset(
                              item,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20, top: 0, bottom: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Welcome to Aquaventure",
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: AppColors.TEXT_GREY_COLOR,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Guest",
                                  maxLines: 2,
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: AppColors.PRIMARY_COLOR,
                                      fontSize: 35,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: AppConstants.SKIA_FONT,
                                      fontWeight: FontWeight.w500),
                                ),
                              ]),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, bottom: 10),
                                child: Image.asset(AppImages.TRIDENT_ICON,
                                    width: 70, height: 70),
                              )),
                        ),
                      ]),
                ),
                /*SizedBox(
                  height: 5,
                ),*/
                Material(
                    child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: HomeItems(
                    backgroundColor: AppColors.RED_COLOR,
                    prefixIcon: Image.asset(
                      AppImages.LOCKER_PURCHASE_ICON,
                      width: 77,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                    title: "Locker Purchase",
                    subtitle: AppConstants.chooseLocker,
                    highlightColor: const Color(0xFFFF483E),
                    context: context,
                    onTap: () {},
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Positioned(
                right: MediaQuery.of(context).size.width * 0.02,
                top: carousalHeight * 0.1,
                child: GestureDetector(
                    onTap: () {},
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80)),
                      child: SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.asset(AppImages.close_Icon)),
                    ))),
          ],
        ),

        SizedBox(
          height: 50,
        ),

        //getBlocBuilder()
      ],
    );
  }

  LottieBuilder getIcon(String iconName) =>
      Lottie.asset(iconName, width: 50, height: 50);
}
