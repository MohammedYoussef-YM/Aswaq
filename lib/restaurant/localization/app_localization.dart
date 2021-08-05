import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_kit/restaurant/utill/app_constants.dart';

class RestAppLocalization {
  RestAppLocalization(this.locale);

  final Locale locale;

  static RestAppLocalization of(BuildContext context) {
    return Localizations.of<RestAppLocalization>(context, RestAppLocalization);
  }

  Map<String, String> _localizedValues;

  Future<void> load() async {
    String jsonStringValues = await rootBundle.loadString('assets/restaurant/language/${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues = mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) {
    return _localizedValues[key];
  }

  static const LocalizationsDelegate<RestAppLocalization> delegate = _DemoLocalizationsDelegate();
}

class _DemoLocalizationsDelegate extends LocalizationsDelegate<RestAppLocalization> {
  const _DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    List<String> _languageString = [];
    RestAppConstants.languages.forEach((language) {
      _languageString.add(language.languageCode);
    });
    return _languageString.contains(locale.languageCode);
  }

  @override
  Future<RestAppLocalization> load(Locale locale) async {
    RestAppLocalization localization = new RestAppLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<RestAppLocalization> old) => false;
}
