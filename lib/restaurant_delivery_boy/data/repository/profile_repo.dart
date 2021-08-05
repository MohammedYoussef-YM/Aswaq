import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/model/response/userinfo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantDeliveryBoyProfileRepo {
  final SharedPreferences sharedPreferences;

  RestaurantDeliveryBoyProfileRepo({ @required this.sharedPreferences});

  Future<ApiResponse> getUserInfo() async {
    try {
      UserInfoModel _userInfo = UserInfoModel(id: 1, fName: 'John', lName: 'Doe', image: Images.user, phone: '12345678', email: 'john@email.com',);
      final response = Response(requestOptions: RequestOptions(path: ''), data: _userInfo, statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
