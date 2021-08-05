import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/restaurant/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/userinfo_model.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestProfileRepo{
  final SharedPreferences sharedPreferences;
  RestProfileRepo({@required this.sharedPreferences});

  Future<ApiResponse> getAddressTypeList() async {
    try {
      List<String> addressTypeList = [
        'Select Address type',
        'Home',
        'Office',
        'Other',
      ];
      Response response = Response(requestOptions: RequestOptions(path: ''), data: addressTypeList, statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getUserInfo() async {
    try {
      UserInfoModel _userInfo = UserInfoModel(id: 1, fName: 'John', lName: 'Doe', image: Images.user, phone: '12345678', email: 'john@email.com', isPhoneVerified: '1');
      final response = Response(requestOptions: RequestOptions(path: ''), data: _userInfo, statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


}