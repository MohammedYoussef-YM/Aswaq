import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/config_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/repository/splash_repo.dart';

class SixSplashProvider extends ChangeNotifier {
  final SixSplashRepo splashRepo;
  SixSplashProvider({@required this.splashRepo});

  ConfigModel _configModel;
  CurrencyList _currency;
  List<String> _languageList;
  int _currencyIndex = 0;
  int _languageIndex = 0;
  bool _fromSetting = false;
  bool _firstTimeConnectionCheck = true;


  bool get firstTimeConnectionCheck => _firstTimeConnectionCheck;
  ConfigModel get configModel => _configModel;
  CurrencyList get currency => _currency;
  List<String> get languageList => _languageList;
  int get currencyIndex => _currencyIndex;
  int get languageIndex => _languageIndex;
  bool get fromSetting => _fromSetting;

  Future<bool> initConfig() {
    _configModel = splashRepo.getConfig();
    getCurrencyData(splashRepo.getCurrency());
    _languageList = splashRepo.getLanguageList();
    return Future.value(true);
  }

  void getCurrencyData(String currencyCode) {
    _configModel.currencyList.forEach((currency) {
      if(currencyCode == currency.code) {
        _currency = currency;
        _currencyIndex = _configModel.currencyList.indexOf(currency);
        return;
      }
    });
  }

  void setFirstTimeConnectionCheck(bool isChecked){
    _firstTimeConnectionCheck = isChecked;
  }
  void setCurrency(int index) {
    splashRepo.setCurrency(_configModel.currencyList[index].code);
    getCurrencyData(_configModel.currencyList[index].code);
    notifyListeners();
  }

  void initSharedPrefData() {
    splashRepo.initSharedData();
  }

  void setFromSetting(bool isSetting) {
    _fromSetting = isSetting;
  }
}
