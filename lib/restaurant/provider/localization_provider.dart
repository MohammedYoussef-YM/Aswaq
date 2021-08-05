import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestLocalizationProvider extends ChangeNotifier {
  final SharedPreferences sharedPreferences;

  RestLocalizationProvider({@required this.sharedPreferences}) {
    _loadCurrentLanguage();
  }

  Locale _locale = Locale('en', 'US');
  bool _isLtr = true;
  Locale get locale => _locale;
  bool get isLtr => _isLtr;

  void toggleLanguage(int statusCode) {
    if(statusCode==0){
      _locale = Locale('en', 'US');
      _isLtr = true;
    }else if(statusCode==1){
      _locale = Locale('ar', 'SA');
      _isLtr = false;
    }
    _saveLanguage(_locale);
    notifyListeners();
  }

  _loadCurrentLanguage() async {
    _locale = Locale(sharedPreferences.getString(RestAppConstants.LANGUAGE_CODE) ?? 'en',
        sharedPreferences.getString(RestAppConstants.COUNTRY_CODE) ?? 'US');
    _isLtr = _locale.languageCode == 'en';
    notifyListeners();
  }

  _saveLanguage(Locale locale) async {
    sharedPreferences.setString(RestAppConstants.LANGUAGE_CODE, locale.languageCode);
    sharedPreferences.setString(RestAppConstants.COUNTRY_CODE, locale.countryCode);
  }
}