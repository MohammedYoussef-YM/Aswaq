import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SixLocalizationProvider extends ChangeNotifier {
  final SharedPreferences sharedPreferences;

  SixLocalizationProvider({@required this.sharedPreferences}) {
    _loadCurrentLanguage();
  }

  Locale _locale = Locale('en', 'US');
  bool _isLtr = true;
  int _languageIndex;

  Locale get locale => _locale;
  bool get isLtr => _isLtr;
  int get languageIndex => _languageIndex;

  void setLanguage(Locale locale) {
    if(locale.languageCode == 'en'){
      _locale = Locale('en', 'US');
      _isLtr = true;
    }else {
      _locale = Locale('ar', 'SA');
      _isLtr = false;
    }
    SixAppConstants.languages.forEach((language) {
      if(language.languageCode == _locale.languageCode) {
        _languageIndex = SixAppConstants.languages.indexOf(language);
      }
    });

    _saveLanguage(_locale);
    notifyListeners();
  }

  _loadCurrentLanguage() async {
    _locale = Locale(sharedPreferences.getString(SixAppConstants.LANGUAGE_CODE) ?? 'en',
        sharedPreferences.getString(SixAppConstants.COUNTRY_CODE) ?? 'US');
    _isLtr = _locale.languageCode == 'en';
    SixAppConstants.languages.forEach((language) {
      if(language.languageCode == _locale.languageCode) {
        _languageIndex = SixAppConstants.languages.indexOf(language);
      }
    });
    notifyListeners();
  }

  _saveLanguage(Locale locale) async {
    sharedPreferences.setString(SixAppConstants.LANGUAGE_CODE, locale.languageCode);
    sharedPreferences.setString(SixAppConstants.COUNTRY_CODE, locale.countryCode);
  }
}