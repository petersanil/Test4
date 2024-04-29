import 'package:aquaventure/localization/app_localization.dart';
import 'package:flutter/material.dart';

String getTranslated(String key, BuildContext context) {
  return AppLocalization.of(context).translate(key);
}