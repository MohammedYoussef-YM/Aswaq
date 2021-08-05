import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/localization/app_localization.dart';

String getTranslated(String key, BuildContext context) {
  return RestaurantDeliveryBoyAppLocalization.of(context).translate(key);
}