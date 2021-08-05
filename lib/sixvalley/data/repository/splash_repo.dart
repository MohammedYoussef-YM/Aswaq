import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/config_model.dart';
import 'package:flutter_ui_kit/sixvalley/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SixSplashRepo {
  final SharedPreferences sharedPreferences;
  SixSplashRepo({@required this.sharedPreferences});

  ConfigModel getConfig() {
    ConfigModel configModel = ConfigModel();
    configModel.currencyList = [];
    configModel.currencyList.add(CurrencyList(id: 1, name: 'USD', symbol: '\$',code: 'USD', exchangeRate: '1.00'));
    configModel.currencyList.add(CurrencyList(id: 2, name: 'BDT', symbol: '৳',code: 'BDT', exchangeRate: '84.00'));
    configModel.currencyList.add(CurrencyList(id: 3, name: 'Indian Rupi', symbol: '₹',code: 'Rupi', exchangeRate: '60.00'));
    return configModel;
  }

  List<String> getLanguageList() {
    List<String> languageList = ['English', 'Bengali', 'Hindi'];
    return languageList;
  }

  void initSharedData() async {
    if (!sharedPreferences.containsKey(SixAppConstants.CART_LIST)) {
      sharedPreferences.setStringList(SixAppConstants.CART_LIST, []);
    }
    if (!sharedPreferences.containsKey(SixAppConstants.SEARCH_ADDRESS)) {
      sharedPreferences.setStringList(SixAppConstants.SEARCH_ADDRESS, []);
    }
    if(!sharedPreferences.containsKey(SixAppConstants.CURRENCY)) {
      sharedPreferences.setString(SixAppConstants.CURRENCY, 'USD');
    }
  }

  String getCurrency() {
    return sharedPreferences.getString(SixAppConstants.CURRENCY) ?? 'USD';
  }

  void setCurrency(String currencyCode) {
    sharedPreferences.setString(SixAppConstants.CURRENCY, currencyCode);
  }

}
