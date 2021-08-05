import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/localization/app_localization.dart';

String getTranslated(String key, BuildContext context) {
  return RestAppLocalization.of(context).translate(key);
}