import 'package:aquaventure/constants/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../buy_add_ons/screen/buy_addon_screen.dart';

class HomeItems extends StatelessWidget {
  final Color backgroundColor;
  final Image prefixIcon;
  final int linkedBandCount;
  final String title;
  final String subtitle;
  final Color? highlightColor;
  final BuildContext context;
  final Function()? onTap;

  const HomeItems(
      {Key? key,
        required this.backgroundColor,
        required this.prefixIcon,
        required this.title,
        required this.subtitle,
        this.linkedBandCount = 0,
        this.highlightColor,
        required this.context,
        this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        navigateToHomePage();
      },
      highlightColor: highlightColor,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            decoration: BoxDecoration(
                color: backgroundColor, borderRadius: BorderRadius.circular(9)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    prefixIcon,
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 3,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(subtitle,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (linkedBandCount != 0)
            highlight("${linkedBandCount.toString()} Band"),
        ],
      ),
    );
  }

  Widget highlight(String label){
    return Align(
        alignment: Alignment.topRight,
        child: Container(
            padding: const EdgeInsets.only(
                left: 5, right: 5, top: 5, bottom: 5),
            margin: const EdgeInsets.only(right: 15, top: 5),
            decoration: BoxDecoration(
                color: AppColors.SECONDARY_COLOR,
                borderRadius: BorderRadius.circular(5)),
            child: Text(
              label,
              style: const TextStyle(
                  color: Colors.white,fontSize: 10, fontWeight: FontWeight.normal),
            )));
  }

  LottieBuilder getIcon(String iconName) =>
      Lottie.asset(iconName, width: 14, height: 14);

  void navigateToHomePage() {
    Navigator.of(context).push(CupertinoPageRoute(
        builder: (_) => BuyAddOnScreen()));
  }

}
