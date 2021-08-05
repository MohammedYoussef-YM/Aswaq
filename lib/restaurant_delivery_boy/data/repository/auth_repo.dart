import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantDeliveryBoyAuthRepo {
  final SharedPreferences sharedPreferences;

  RestaurantDeliveryBoyAuthRepo({@required this.sharedPreferences});

  // for  user token

  String getUserToken() {
    return sharedPreferences.getString(RestaurantDeliveryBoyAppConstants.TOKEN) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(RestaurantDeliveryBoyAppConstants.TOKEN);
  }

  Future<bool> clearSharedData() async {
    return sharedPreferences.remove(RestaurantDeliveryBoyAppConstants.TOKEN);
    //return sharedPreferences.clear();
  }

  // for  Remember Email
  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(RestaurantDeliveryBoyAppConstants.USER_PASSWORD, password);
      await sharedPreferences.setString(RestaurantDeliveryBoyAppConstants.USER_EMAIL, number);
    } catch (e) {
      throw e;
    }
  }

  String getUserEmail() {
    return sharedPreferences.getString(RestaurantDeliveryBoyAppConstants.USER_EMAIL) ?? "";
  }

  String getUserPassword() {
    return sharedPreferences.getString(RestaurantDeliveryBoyAppConstants.USER_PASSWORD) ?? "";
  }

  Future<bool> clearUserNumberAndPassword() async {
    await sharedPreferences.remove(RestaurantDeliveryBoyAppConstants.USER_PASSWORD);
    return await sharedPreferences.remove(RestaurantDeliveryBoyAppConstants.USER_EMAIL);
  }
}
