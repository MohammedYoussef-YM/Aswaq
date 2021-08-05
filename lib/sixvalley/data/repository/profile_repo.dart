
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/address_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/user_info_model.dart';
import 'package:flutter_ui_kit/sixvalley/utill/app_constants.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SixProfileRepo {
  final SharedPreferences sharedPreferences;
  SixProfileRepo({@required this.sharedPreferences});

  List<String> getAddressTypeList() {
    List<String> addressTypeList = [
      'Select Address type',
      'Home',
      'Office',
      'Other',
    ];
    return addressTypeList;
  }

  UserInfoModel getUserInfo() {
    UserInfoModel userInfoModel = UserInfoModel(id: 1, name: 'John Doe', fName: 'John', lName: 'Doe', phone: '+886737663', email: 'johndoe@gmail.com', image: Images.person);
    return userInfoModel;
  }

  List<AddressModel> getAllAddress() {
    List<AddressModel> addressList = [
      AddressModel(id: 1, customerId: '1', contactPersonName: 'John Doe', addressType: 'Home', address: 'Dhaka, Bangladesh'),
    ];
    return addressList;
  }

  // for save home address
  Future<void> saveHomeAddress(String homeAddress) async {
    try {
      await sharedPreferences.setString(SixAppConstants.HOME_ADDRESS, homeAddress);
    } catch (e) {
      throw e;
    }
  }

  String getHomeAddress() {
    return sharedPreferences.getString(SixAppConstants.HOME_ADDRESS) ?? "";
  }

  Future<bool> clearHomeAddress() async {
    return sharedPreferences.remove(SixAppConstants.HOME_ADDRESS);
  }

  // for save office address
  Future<void> saveOfficeAddress(String officeAddress) async {
    try {
      await sharedPreferences.setString(SixAppConstants.OFFICE_ADDRESS, officeAddress);
    } catch (e) {
      throw e;
    }
  }

  String getOfficeAddress() {
    return sharedPreferences.getString(SixAppConstants.OFFICE_ADDRESS) ?? "";
  }

  Future<bool> clearOfficeAddress() async {
    return sharedPreferences.remove(SixAppConstants.OFFICE_ADDRESS);
  }
}
