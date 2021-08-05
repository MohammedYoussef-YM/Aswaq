import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/rideshare/data/model/address_model.dart';
import 'package:flutter_ui_kit/rideshare/utility/strings.dart';

class RideShareHomeRepo {
  List<AddressModel> getAllAddressList = [
    AddressModel(iconData: Icons.home_outlined, name: Strings.home, address: Strings.address_one),
    AddressModel(iconData: Icons.home_repair_service, name: Strings.workshop_1, address: Strings.address_two),
    AddressModel(iconData: Icons.home_repair_service, name: Strings.workshop_2, address: Strings.address_three),
  ];
}
