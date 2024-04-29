


import 'package:aquaventure/constants/app_colors.dart';
import 'package:aquaventure/constants/app_images.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  Function()? onTap;
   CustomBackButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? (){
        Navigator.of(context);
      },
        child: const Icon(Icons.arrow_back_ios, color: AppColors.PRIMARY_COLOR,));
  }
}
