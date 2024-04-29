import 'package:aquaventure/constants/app_colors.dart';
import 'package:aquaventure/constants/app_constants.dart';
import 'package:aquaventure/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

AppBar CustomLogoAppBar(
    {required String title,
    Widget? leading,
    List<Widget>? actions,
    bool automaticallyImplyLeading = true}) {
  return AppBar(
    backgroundColor: Colors.white,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      // You can use this as well
      statusBarIconBrightness: Brightness.light,
      // OR Vice Versa for ThemeMode.dark
      statusBarBrightness: Brightness.light, // OR Vice Versa for ThemeMode.dark
    ),
    elevation: 0,
    toolbarHeight: 350,
    leading: leading,
    iconTheme: const IconThemeData(color: AppColors.PRIMARY_COLOR),
    automaticallyImplyLeading: automaticallyImplyLeading,
    centerTitle: true,
    title: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Lottie.asset(
          AppImages.APP_LOGO_JSON,
          width: 70,
          height: 70,
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
              fontFamily: AppConstants.SKIA_FONT,
              color: AppColors.PRIMARY_COLOR,
              fontWeight: FontWeight.normal,
              fontSize: 30),
        ),
      ],
    ),
    actions: actions,
  );
}
