import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_ui_kit/main/app.dart';
import 'package:flutter_ui_kit/restaurant/localization/app_localization.dart';
import 'package:flutter_ui_kit/restaurant/provider/localization_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/theme_provider.dart';
import 'package:flutter_ui_kit/restaurant/theme/dark_theme.dart';
import 'package:flutter_ui_kit/restaurant/theme/light_theme.dart';
import 'package:flutter_ui_kit/restaurant/utill/app_constants.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/localization/app_localization.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/localization_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/theme_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/theme/dark_theme.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/theme/light_theme.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/app_constants.dart';
import 'package:flutter_ui_kit/sixvalley/localization/app_localization.dart';
import 'package:flutter_ui_kit/sixvalley/provider/localization_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/theme_provider.dart';
import 'package:flutter_ui_kit/sixvalley/theme/dark_theme.dart';
import 'package:flutter_ui_kit/sixvalley/theme/light_theme.dart';
import 'package:flutter_ui_kit/sixvalley/utill/app_constants.dart';
import 'package:provider/provider.dart';

class MainProvider extends ChangeNotifier {
  ThemeData _themeData;
  Locale _locale;
  List<LocalizationsDelegate> _delegates;
  List<Locale> _supportedLocales = [Locale('en', 'US')];

  ThemeData get themeData => _themeData;

  int _appIndex=0;
  int get appIndex=> _appIndex;

  Locale get locale => _locale;

  List<LocalizationsDelegate> get delegates => _delegates;

  List<Locale> get supportedLocales => _supportedLocales;

  void setThemeAndLocale(App app, BuildContext context) {
    if (app == App.SIXVALLEY) {
      _themeData = Provider.of<SixThemeProvider>(context, listen: false).darkTheme ? sixDark : sixLight;
      _locale = Provider.of<SixLocalizationProvider>(context, listen: false).locale;
      _delegates = [
        SixAppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];
      _supportedLocales = [];
      SixAppConstants.languages.forEach((language) {
        _supportedLocales.add(Locale(language.languageCode, language.countryCode));
      });
    } else if (app == App.RESTAURANT) {
      _themeData = Provider.of<RestThemeProvider>(context, listen: false).darkTheme ? restDark : restLight;
      _locale = Provider.of<RestLocalizationProvider>(context, listen: false).locale;
      _delegates = [
        RestAppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];
      _supportedLocales = [];
      RestAppConstants.languages.forEach((language) {
        _supportedLocales.add(Locale(language.languageCode, language.countryCode));
      });
    } else if (app == App.RESTAURANT_DELIVERY_BOY) {
      _themeData = Provider.of<RestaurantDeliveryBoyThemeProvider>(context, listen: false).darkTheme
          ? restaurantdeliveryboydarktheme
          : restaurantdeliveryboylighttheme;
      _locale = Provider.of<RestaurantDeliveryBoyLocalizationProvider>(context, listen: false).locale;
      _delegates = [
        RestaurantDeliveryBoyAppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];
      _supportedLocales = [];
      RestaurantDeliveryBoyAppConstants.languages.forEach((language) {
        _supportedLocales.add(Locale(language.languageCode, language.countryCode));
      });
    } else {
      _themeData = null;
      _locale = null;
      _delegates = null;
      _supportedLocales = [Locale('en', 'US')];
    }
    notifyListeners();
  }

  void setIndex(int index){
    _appIndex=index;
    notifyListeners();
  }
}
