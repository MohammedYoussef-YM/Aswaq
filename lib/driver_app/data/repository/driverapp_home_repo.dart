import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/rideshare/data/model/address_model.dart';
import 'package:flutter_ui_kit/rideshare/utility/strings.dart';

class DriverAppHomeRepo {
  List<AddressModel> getAllAddressList = [
    AddressModel(iconData: Icons.home_outlined, name: Strings.home, address: Strings.address_one, latitude: 23.8103, longitude: 90.4125),
    AddressModel(iconData: Icons.home_repair_service, name: Strings.workshop_1, address: Strings.address_two, latitude: 21.3891, longitude: 39.8579),
    AddressModel(
        iconData: Icons.home_repair_service, name: Strings.workshop_2, address: Strings.address_three, latitude: 24.0178, longitude: 90.4182),
  ];
}
