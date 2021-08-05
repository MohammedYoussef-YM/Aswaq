import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/address_model.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestLocationRepo {
  final SharedPreferences sharedPreferences;
  RestLocationRepo({this.sharedPreferences});

  Future<ApiResponse> getAllAddress() async {
    try {
      List<AddressModel> _addressList = [
        AddressModel(id: 1, userId: '1', addressType: 'Home', address: 'London, USA', contactPersonName: 'John Doe', contactPersonNumber: '12345678', latitude: '1.0000', longitude: '2.0000'),
      ];
      final response = Response(requestOptions: RequestOptions(path: ''), data: _addressList,  statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  List<String> getAllAddressType({BuildContext context}) {
    return [
      getTranslated('home', context),
      getTranslated('workplace', context),
      getTranslated('other', context),
    ];
  }
}
