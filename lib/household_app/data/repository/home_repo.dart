import 'package:flutter_ui_kit/household_app/data/model/offer_model.dart';
import 'package:flutter_ui_kit/household_app/data/model/service_model.dart';
import 'package:flutter_ui_kit/household_app/utility/images.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';

class HouseHomeRepo {

  List<OfferModel> getOffers() {
    List<OfferModel> offerList = [
      OfferModel(Images.window_cleaning, Strings.best_offer, Strings.service_in_town),
      OfferModel(Images.clean, Strings.floor_cleaning, Strings.service_in_town),
      OfferModel(Images.window_cleaning, Strings.best_offer, Strings.service_in_town),
    ];
    return offerList;
  }

  List<ServiceModel> getServices() {
    List<ServiceModel> serviceList = [
      ServiceModel(Images.painting_roller, Strings.painting),
      ServiceModel(Images.cleaning, Strings.cleaning),
      ServiceModel(Images.air_conditioner, Strings.ac_repair),
      ServiceModel(Images.electric_plug, Strings.electricity),
      ServiceModel(Images.gas, Strings.gas),
      ServiceModel(Images.wifi, Strings.wifi),
      ServiceModel(Images.painting_roller, Strings.painting),
      ServiceModel(Images.cleaning, Strings.cleaning),
      ServiceModel(Images.air_conditioner, Strings.ac_repair),
      ServiceModel(Images.electric_plug, Strings.electricity),
      ServiceModel(Images.gas, Strings.gas),
      ServiceModel(Images.wifi, Strings.wifi),
    ];
    return serviceList;
  }
}