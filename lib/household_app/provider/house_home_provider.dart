import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/data/repository/home_repo.dart';
import 'package:flutter_ui_kit/household_app/data/model/offer_model.dart';
import 'package:flutter_ui_kit/household_app/data/model/service_model.dart';

class HouseHomeProvider extends ChangeNotifier {
  final HouseHomeRepo homeRepo;
  HouseHomeProvider({@required this.homeRepo});

  List<OfferModel> _offerList = [];
  List<ServiceModel> _serviceList = [];
  List<OfferModel> get offerList => _offerList;
  List<ServiceModel> get serviceList => _serviceList;

  void getOffers() {
    _offerList = [];
    _offerList.addAll(homeRepo.getOffers());
  }

  void getServices() {
    _serviceList = [];
    _serviceList.addAll(homeRepo.getServices());
    notifyListeners();
  }

}