import 'dart:io';

import 'package:aquaventure/constants/app_colors.dart';
import 'package:aquaventure/core/custom_widgets/custom_solid_buttom.dart';
import 'package:flutter/material.dart';

mixin DirectionsMixin {
  showDirectionsOptions(BuildContext context,
      {required Function() selectedGoogleMap,
      required Function() selectedAppleMap,
      required Function() copyToClipboard}) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          // height: 280,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
            CustomSolidButton(
                  buttonColor: AppColors.PRIMARY_COLOR,
                  onTap: () async {
                    Navigator.pop(context);
                    selectedGoogleMap();
                  },
                  child: const Text(
                    "OPEN GOOGLE MAP",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontSize: 17),
                  )),
              const SizedBox(
                height: 10,
              ),
            if(Platform.isIOS)  CustomSolidButton(
                  buttonColor: AppColors.PRIMARY_COLOR,
                  onTap: () async {
                    Navigator.pop(context);
                    selectedAppleMap();
                  },
                  child: const Text(
                    "OPEN APPLE MAP",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontSize: 17),
                  )),
              if(Platform.isIOS)   const SizedBox(
                height: 10,
              ),
              CustomSolidButton(
                  buttonColor: AppColors.PRIMARY_COLOR,
                  onTap: () async {
                    Navigator.pop(context);
                    copyToClipboard();
                  },
                  child: const Text(
                    "COPY TO CLIPBOARD",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontSize: 17),
                  )),
              const SizedBox(
                height: 10,
              ),
              CustomSolidButton(
                  child: const Text(
                    "CANCEL",
                    style: TextStyle(
                        color: AppColors.PRIMARY_COLOR,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontSize: 17),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  })
            ],
          ),
        );
      },
      elevation: 20,
    );
  }
}
