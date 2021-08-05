import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_kit/sixvalley/utill/app_constants.dart';

class SixAppLocalization {
  SixAppLocalization(this.locale);

  final Locale locale;

  static SixAppLocalization of(BuildContext context) {
    return Localizations.of<SixAppLocalization>(context, SixAppLocalization);
  }

  Map<String, String> _localizedValues;

  Future<void> load() async {
    String jsonStringValues = await rootBundle.loadString('assets/sixvalley/language/${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues = mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) {
    return _localizedValues[key];
  }

  static const LocalizationsDelegate<SixAppLocalization> delegate = _DemoLocalizationsDelegate();
}

class _DemoLocalizationsDelegate extends LocalizationsDelegate<SixAppLocalization> {
  const _DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    List<String> _languageString = [];
    SixAppConstants.languages.forEach((language) {
      _languageString.add(language.languageCode);
    });
    return _languageString.contains(locale.languageCode);
  }

  @override
  Future<SixAppLocalization> load(Locale locale) async {
    SixAppLocalization localization = new SixAppLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<SixAppLocalization> old) => false;
}
