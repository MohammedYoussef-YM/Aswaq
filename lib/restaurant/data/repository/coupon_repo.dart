import 'package:dio/dio.dart';
import 'package:flutter_ui_kit/restaurant/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/coupon_model.dart';

class RestCouponRepo {

  Future<ApiResponse> getCouponList() async {
    try {
      List<CouponModel> _couponList = [
        CouponModel(id: 1, discount: '5', title: 'New coupon', code: 'abcd', expireDate: '12/12/2021', minPurchase: '100', maxDiscount: '100'),
        CouponModel(id: 2, discount: '5', title: 'Winter coupon', code: 'xyz', expireDate: '12/12/2021', minPurchase: '100', maxDiscount: '100'),
      ];
      final response = Response(requestOptions: RequestOptions(path: ''), data: _couponList, statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}