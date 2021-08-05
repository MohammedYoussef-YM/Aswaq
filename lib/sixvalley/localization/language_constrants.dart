import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/localization/app_localization.dart';

String getTranslated(String key, BuildContext context) {
  return SixAppLocalization.of(context).translate(key);
}