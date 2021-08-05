import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/app_constants.dart';

class RestaurantDeliveryBoyAppLocalization {
  RestaurantDeliveryBoyAppLocalization(this.locale);

  final Locale locale;

  static RestaurantDeliveryBoyAppLocalization of(BuildContext context) {
    return Localizations.of<RestaurantDeliveryBoyAppLocalization>(context, RestaurantDeliveryBoyAppLocalization);
  }

  Map<String, String> _localizedValues;

  Future<void> load() async {
    String jsonStringValues = await rootBundle.loadString('assets/language/${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues = mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) {
    return _localizedValues[key];
  }

  static const LocalizationsDelegate<RestaurantDeliveryBoyAppLocalization> delegate = _DemoLocalizationsDelegate();
}

class _DemoLocalizationsDelegate extends LocalizationsDelegate<RestaurantDeliveryBoyAppLocalization> {
  const _DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    List<String> _languageString = [];
    RestaurantDeliveryBoyAppConstants.languages.forEach((language) {
      _languageString.add(language.languageCode);
    });
    return _languageString.contains(locale.languageCode);
  }

  @override
  Future<RestaurantDeliveryBoyAppLocalization> load(Locale locale) async {
    RestaurantDeliveryBoyAppLocalization localization = new RestaurantDeliveryBoyAppLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<RestaurantDeliveryBoyAppLocalization> old) => false;
}
