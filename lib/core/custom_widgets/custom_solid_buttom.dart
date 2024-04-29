import 'package:aquaventure/constants/app_colors.dart';
import 'package:aquaventure/core/custom_widgets/custom_loader.dart';
import 'package:flutter/material.dart';

class CustomSolidButton extends StatefulWidget {
  Text child;
  Color borderColor;
  Color shadowColor;
  Color buttonColor;
  Color textColor;
  bool loading;
  Function()? onTap;
  double? width;
  double? height;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;

  CustomSolidButton({Key? key,
    required this.child,
    this.borderColor = AppColors.PRIMARY_COLOR,
    this.shadowColor = Colors.lightBlueAccent,
    this.buttonColor = Colors.white,
    this.textColor = AppColors.PRIMARY_COLOR,
    this.loading = false,
    this.width,
    this.height,
    this.padding,
    this.margin,
    required this.onTap})
      : super(key: key);

  @override
  State<CustomSolidButton> createState() => _CustomSolidButtonState();
}

class _CustomSolidButtonState extends State<CustomSolidButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      decoration: BoxDecoration(
        border: Border.all(color: widget.borderColor),
        borderRadius: const BorderRadius.all(Radius.circular(9.0)),
        color: widget.buttonColor,
      ),
      child: widget.loading
          ? CustomCircleLoader()
          : MaterialButton(
        onPressed: widget.onTap,
        child: widget.child,
      ),
//                        showInSnackBar("Login button pressed")),
    );
  }
}
