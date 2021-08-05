import 'package:dio/dio.dart';
import 'package:flutter_ui_kit/restaurant/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/banner_model.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';

class RestBannerRepo {

  Future<ApiResponse> getBannerList() async {
    try {
      List<BannerModel> _bannerList = [
        BannerModel(image: Images.banner_1),
        BannerModel(image: Images.banner_2),
      ];
      final response = Response(requestOptions: RequestOptions(path: ''), data: _bannerList, statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}