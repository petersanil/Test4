import 'package:aquaventure/constants/app_constants.dart';
import 'package:aquaventure/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar CustomAppBar(
    {required String title,
    Widget? leading,
    List<Widget>? actions,
      bool centerTitle = true,
      double? toolbarHeight,
      PreferredSizeWidget? bottomWidget,
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
    leading: leading,
    toolbarHeight: toolbarHeight,
    iconTheme: const IconThemeData(color: AppColors.PRIMARY_COLOR),
    automaticallyImplyLeading: automaticallyImplyLeading,
    centerTitle: centerTitle,
    title: Text(
      title,
      style: const TextStyle(
          color: AppColors.PRIMARY_COLOR,
          fontSize: 30,
          letterSpacing: 0.2,
          fontFamily: AppConstants.SKIA_FONT,
          fontWeight: FontWeight.bold),
    ),
    bottom: bottomWidget,
    actions: actions,
  );
}
