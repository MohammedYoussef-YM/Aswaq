import 'package:dio/dio.dart';
import 'package:flutter_ui_kit/restaurant/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/wishlist_model.dart';

class RestWishListRepo {

  Future<ApiResponse> getWishList() async {
    try {
      List<WishListModel> _wishList = [
        WishListModel(id: 1, productId: '1', userId: '1'),
      ];
      final response = Response(requestOptions: RequestOptions(path: ''), data: _wishList, statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}
