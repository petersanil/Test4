import 'package:aquaventure/constants/app_colors.dart';
import 'package:aquaventure/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  String? initialValue;
  String hint;
  bool enabled;
  bool readOnly;
  bool obscureText;
  Widget? suffix;
  Widget? suffixIcon;
  Widget? prefix;
  Widget? prefixIcon;
  TextCapitalization textCapitalization;
  TextInputAction textInputAction;
  TextInputType? keyboardType;
  TextEditingController? controller;
  Function(String)? onFieldSubmitted;
  String? Function(String?)? validator;
  Function(String)? onChanged;
  Function()? onTap;
  TextStyle hintStyle;
  TextStyle textStyle;
  TextAlign textAlign;
  bool autofocus;
  FocusNode? focusNode;
  List<TextInputFormatter>? inputFormatter;
  AutovalidateMode autovalidateMode;

  CustomTextFormField(
      {Key? key,
        required this.hint,
        this.initialValue,
        this.enabled = true,
        this.readOnly = false,
        this.obscureText = false,
        this.textCapitalization = TextCapitalization.none,
        this.suffixIcon,
        this.suffix,
        this.prefix,
        this.prefixIcon,
        this.keyboardType,
        this.controller,
        this.onFieldSubmitted,
        this.onChanged,
        this.validator,
        this.focusNode,
        this.autofocus = false,
        this.inputFormatter,
        this.textAlign = TextAlign.start,
        this.textInputAction = TextInputAction.done,
        this.hintStyle =
        const TextStyle(fontSize: 18.0, color: AppColors.TEXT_GREY_COLOR,
          fontFamily: AppConstants.AVERTAPE_FONT,fontWeight: FontWeight.normal,
        ),
        this.textStyle = const TextStyle(fontSize: 18.0, color: Colors.black,
          fontFamily: AppConstants.AVERTAPE_FONT,
        ),
        this.autovalidateMode = AutovalidateMode.disabled,
        this.onTap})
      : assert(initialValue == null || controller == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 70.0),
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        enabled: enabled,
        onTap: onTap,
        readOnly: readOnly,
        obscureText: obscureText,
        keyboardType: keyboardType,
        autovalidateMode: autovalidateMode,
        cursorColor: AppColors.PRIMARY_COLOR,
        cursorHeight: 20,
        autocorrect: false,
        textCapitalization: textCapitalization,
        textInputAction: TextInputAction.next,
        inputFormatters: inputFormatter,
        style: textStyle,
        autofocus: true,
        focusNode: focusNode,
        textAlign: textAlign,
        decoration: InputDecoration(
            prefixIconColor: AppColors.PRIMARY_COLOR,
            prefix: prefix,
            prefixIcon: prefixIcon,
            suffix: suffix,
            suffixIcon: suffixIcon,
            hintText: hint,
            hintStyle: hintStyle,
            isCollapsed: true,
            errorMaxLines: 3,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.SECONDARY_COLOR)),
            border: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.TEXT_GREY_COLOR))),
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
