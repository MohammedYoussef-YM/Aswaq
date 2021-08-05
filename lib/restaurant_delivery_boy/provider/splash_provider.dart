import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/model/response/config_model.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/repository/splash_repo.dart';

class RestaurantDeliveryBoySplashProvider extends ChangeNotifier {
  final RestaurantDeliveryBoySplashRepo splashRepo;

  RestaurantDeliveryBoySplashProvider({@required this.splashRepo});

  ConfigModel _configModel;
  BaseUrls _baseUrls;

  ConfigModel get configModel => _configModel;

  BaseUrls get baseUrls => _baseUrls;


  Future<bool> initSharedData() {
    return splashRepo.initSharedData();
  }

  Future<bool> removeSharedData() {
    return splashRepo.removeSharedData();
  }
}
