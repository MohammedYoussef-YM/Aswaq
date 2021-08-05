import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantDeliveryBoyLocalizationProvider extends ChangeNotifier {
  final SharedPreferences sharedPreferences;

  RestaurantDeliveryBoyLocalizationProvider({@required this.sharedPreferences}) {
    _loadCurrentLanguage();
  }

  Locale _locale = Locale('en', 'US');
  bool _isLtr = true;

  Locale get locale => _locale;

  bool get isLtr => _isLtr;

  void toggleLanguage({String languageCode = "en"}) {
    if (languageCode == "en") {
      _locale = Locale('en', 'US');
      _isLtr = true;
    } else if (languageCode == 'ar') {
      _locale = Locale('ar', 'SA');
      _isLtr = false;
    }

    _saveLanguage(_locale);
    notifyListeners();
  }

  _loadCurrentLanguage() async {
    _locale = Locale(sharedPreferences.getString(RestaurantDeliveryBoyAppConstants.LANGUAGE_CODE) ?? 'en',
        sharedPreferences.getString(RestaurantDeliveryBoyAppConstants.COUNTRY_CODE) ?? 'US');
    _isLtr = _locale.languageCode == 'en';
    notifyListeners();
  }

  _saveLanguage(Locale locale) async {
    sharedPreferences.setString(RestaurantDeliveryBoyAppConstants.LANGUAGE_CODE, locale.languageCode);
    sharedPreferences.setString(RestaurantDeliveryBoyAppConstants.COUNTRY_CODE, locale.countryCode);
  }
}
