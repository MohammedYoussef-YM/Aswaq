import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantDeliveryBoySplashRepo {
  final SharedPreferences sharedPreferences;

  RestaurantDeliveryBoySplashRepo({@required this.sharedPreferences});


  Future<bool> initSharedData() {
    if (!sharedPreferences.containsKey(RestaurantDeliveryBoyAppConstants.THEME)) {
      return sharedPreferences.setBool(RestaurantDeliveryBoyAppConstants.THEME, false);
    }
    if (!sharedPreferences.containsKey(RestaurantDeliveryBoyAppConstants.COUNTRY_CODE)) {
      return sharedPreferences.setString(RestaurantDeliveryBoyAppConstants.COUNTRY_CODE, 'US');
    }
    if (!sharedPreferences.containsKey(RestaurantDeliveryBoyAppConstants.LANGUAGE_CODE)) {
      return sharedPreferences.setString(RestaurantDeliveryBoyAppConstants.LANGUAGE_CODE, 'en');
    }
    if (!sharedPreferences.containsKey(RestaurantDeliveryBoyAppConstants.CART_LIST)) {
      return sharedPreferences.setStringList(RestaurantDeliveryBoyAppConstants.CART_LIST, []);
    }
    return Future.value(true);
  }

  Future<bool> removeSharedData() {
    return sharedPreferences.clear();
  }
}
