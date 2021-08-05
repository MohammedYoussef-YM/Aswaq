import 'package:dio/dio.dart';
import 'package:flutter_ui_kit/restaurant/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';

class RestProductRepo {

  Future<ApiResponse> getPopularProductList(String offset) async {
    try {
      ProductModel _productModel = ProductModel(totalSize: 4, limit: '10', offset: '1', products: [
        Product(name: 'Product 1', id: 1, image: Images.product_1, discountType: 'percent', discount: '5', addOns: [AddOns(id: 1, name: 'Chese', price: '5'), AddOns(id: 2, name: 'Drinks', price: '5')], description: '* Rice', price: '100', rating: [Rating(average: '4.5', productId: '1')], tax: '2', taxType: 'percent', choiceOptions: [], variations: []),
        Product(name: 'Product 2', id: 2, image: Images.product_2, discountType: 'percent', discount: '5', addOns: [AddOns(id: 1, name: 'Chese', price: '5'), AddOns(id: 2, name: 'Drinks', price: '5')], description: '* Rice', price: '150', rating: [Rating(average: '4.8', productId: '2')], tax: '20', taxType: 'amount', choiceOptions: [], variations: []),
        Product(name: 'Product 3', id: 3, image: Images.product_3, discountType: 'amount', discount: '50', addOns: [AddOns(id: 1, name: 'Chese', price: '5'), AddOns(id: 2, name: 'Drinks', price: '5')], description: '* Rice', price: '200', rating: [Rating(average: '3.5', productId: '3')], tax: '2', taxType: 'percent', choiceOptions: [], variations: []),
        Product(name: 'Product 4', id: 4, image: Images.product_4, discountType: 'percent', discount: '5', addOns: [AddOns(id: 1, name: 'Chese', price: '5'), AddOns(id: 2, name: 'Drinks', price: '5')], description: '* Rice', price: '100', rating: [Rating(average: '2.5', productId: '4')], tax: '2', taxType: 'percent', choiceOptions: [], variations: []),
      ]);
      final response = Response(requestOptions: RequestOptions(path: ''), data: _productModel, statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> searchProduct(String productId) async {
    try {
      Product _product = Product(name: 'Product 1', id: 1, image: Images.product_1, discountType: 'percent', discount: '5', addOns: [AddOns(id: 1, name: 'Chese', price: '5'), AddOns(id: 2, name: 'Drinks', price: '5')], description: '* Rice', price: '100', rating: [Rating(average: '4.5', productId: '1')], tax: '2', taxType: 'percent', choiceOptions: [], variations: []);

      final response = Response(requestOptions: RequestOptions(path: ''), data: _product, statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
