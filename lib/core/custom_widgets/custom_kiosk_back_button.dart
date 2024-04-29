import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CustomKioskBackButton extends StatelessWidget {
  Function()? onTap;
  CustomKioskBackButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap ?? (){
          Navigator.of(context);
        },
        child: const Icon(Icons.arrow_back_ios, color: AppColors.PRIMARY_COLOR,));
  }
}