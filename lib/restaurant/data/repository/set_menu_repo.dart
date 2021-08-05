import 'package:dio/dio.dart';
import 'package:flutter_ui_kit/restaurant/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';

class RestSetMenuRepo {

  Future<ApiResponse> getSetMenuList() async {
    try {
      List<Product> _setMenuList = [
        Product(name: 'Menu 1', id: 1, image: Images.menu_1, discountType: 'percent', discount: '5', addOns: [AddOns(id: 1, name: 'Chese', price: '5'), AddOns(id: 2, name: 'Drinks', price: '5')], description: '* Rice', price: '100', rating: [Rating(average: '4.5', productId: '1')], tax: '2', taxType: 'percent', choiceOptions: [], variations: []),
        Product(name: 'Menu 2', id: 2, image: Images.menu_2, discountType: 'percent', discount: '5', addOns: [AddOns(id: 1, name: 'Chese', price: '5'), AddOns(id: 2, name: 'Drinks', price: '5')], description: '* Rice', price: '150', rating: [Rating(average: '4.8', productId: '2')], tax: '20', taxType: 'amount', choiceOptions: [], variations: []),
        Product(name: 'Menu 3', id: 3, image: Images.menu_3, discountType: 'amount', discount: '50', addOns: [AddOns(id: 1, name: 'Chese', price: '5'), AddOns(id: 2, name: 'Drinks', price: '5')], description: '* Rice', price: '200', rating: [Rating(average: '3.5', productId: '3')], tax: '2', taxType: 'percent', choiceOptions: [], variations: []),
      ];
      final response = Response(requestOptions: RequestOptions(path: ''), data: _setMenuList, statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}