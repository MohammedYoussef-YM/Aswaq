
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/sixvalley/utill/app_constants.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SixSearchRepo {
  final SharedPreferences sharedPreferences;
  SixSearchRepo({@required this.sharedPreferences});

  List<Product> getSearchProductList() {
    List<Product> productList = [
      Product(1, 'admin', '1', 'Lamborghini', '', [], '', '', '1', '', [Images.white_car, Images.blue_car], Images.blue_car, '', '', '', '', [ProductColors(name: 'Black', code: '#000000')], '', [], [], [], '', '500', '450', '5', 'percent', '10', 'percent', '10', 'Tripod Projection Screen. This durable tripod projection screen from Apollo sets up in seconds. The screen is ideal for computer, video, slide and overhead projections. Keystone eliminator ends distortion problems which occur when screen and projector are on uneven planes, Flame-retardant, Matte white finish, Black 1-inch border, Easy-roll mechanism sets up quickly, Screen measures 70 inches long x 70 inches high, Origin- USA. No warranty', '', '', '', '', '', '', [Rating(average: '3.7')]),
      Product(2, 'seller', '2', 'Special Lounge', '', [], '', '', '1', '', [Images.lounge, Images.lounge_one, Images.lounge_two], Images.lounge_one, '', '', '', '', [ProductColors(name: 'Black', code: '#000000')], '', [], [], [], '', '500', '450', '5', 'percent', '10', 'percent', '10', 'Apollo 70, Tripod Projection Screen, This durable tripod projection screen from Apollo sets up in seconds. The screen is ideal for computer, video, slide and overhead projections. Keystone eliminator ends distortion problems which occur when screen and projector are on uneven planes, Flame-retardant, Matte white finish, Black 1-inch border, Easy-roll mechanism sets up quickly, Screen measures 70 inches long x 70 inches high, Origin- USA. No warranty', '', '', '', '', '', '', [Rating(average: '3.2')]),
    ];
    return productList;
  }

  // for save home address
  Future<void> saveSearchAddress(String searchAddress) async {
    try {
      List<String> searchKeywordList = sharedPreferences.getStringList(SixAppConstants.SEARCH_ADDRESS);
      if (!searchKeywordList.contains(searchAddress)) {
        searchKeywordList.add(searchAddress);
      }
      await sharedPreferences.setStringList(SixAppConstants.SEARCH_ADDRESS, searchKeywordList);
    } catch (e) {
      throw e;
    }
  }

  List<String> getSearchAddress() {
    return sharedPreferences.getStringList(SixAppConstants.SEARCH_ADDRESS) ?? [];
  }

  Future<bool> clearSearchAddress() async {
    return sharedPreferences.setStringList(SixAppConstants.SEARCH_ADDRESS, []);
  }
}
