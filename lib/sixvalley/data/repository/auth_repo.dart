import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SixAuthRepo {
  final SharedPreferences sharedPreferences;
  SixAuthRepo({@required this.sharedPreferences});


  // for  user token
  Future<void> saveUserToken(String token) async {
    try {
      await sharedPreferences.setString(SixAppConstants.TOKEN, token);
    } catch (e) {
      throw e;
    }
  }

  String getUserToken() {
    return sharedPreferences.getString(SixAppConstants.TOKEN) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(SixAppConstants.TOKEN);
  }

  Future<bool> clearSharedData() async {
    sharedPreferences.remove(SixAppConstants.CART_LIST);
    sharedPreferences.remove(SixAppConstants.CURRENCY);
    return sharedPreferences.remove(SixAppConstants.TOKEN);
  }


  // for  Remember Email
  Future<void> saveUserEmailAndPassword(String email, String password) async {
    try {
      await sharedPreferences.setString(SixAppConstants.USER_PASSWORD, password);
      await sharedPreferences.setString(SixAppConstants.USER_EMAIL, email);
    } catch (e) {
      throw e;
    }
  }

  String getUserEmail() {
    return sharedPreferences.getString(SixAppConstants.USER_EMAIL) ?? "";
  }

  String getUserPassword() {
    return sharedPreferences.getString(SixAppConstants.USER_PASSWORD) ?? "";
  }

  Future<bool> clearUserEmailAndPassword() async {
    await sharedPreferences.remove(SixAppConstants.USER_PASSWORD);
    return await sharedPreferences.remove(SixAppConstants.USER_EMAIL);
  }

}
