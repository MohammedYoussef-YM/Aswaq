import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/model/response/language_model.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/app_constants.dart';

class RestaurantDeliveryBoyLanguageRepo {
  List<LanguageModel> getAllLanguages({BuildContext context}) {
    return RestaurantDeliveryBoyAppConstants.languages;
  }
}