import 'package:flutter_ui_kit/rideshare/data/model/destination_model.dart';
import 'package:flutter_ui_kit/rideshare/utility/strings.dart';

class DestinationRepo {
  List<DestinationModel> getAllAddressList = [
    DestinationModel(imageUrl: 'assets/rideshare/images/car_left.png', title: Strings.mini_car, price: Strings.bdt_60),
    DestinationModel(imageUrl: 'assets/rideshare/images/scooter.png', title: Strings.moto, price: Strings.bdt_100),
    DestinationModel(imageUrl: 'assets/rideshare/images/car_right.png', title: Strings.mini_car, price: Strings.bdt_60),
  ];

  List<String> getAllTip = [
    Strings.digit_10,
    Strings.digit_15,
    Strings.digit_20,
  ];
}
