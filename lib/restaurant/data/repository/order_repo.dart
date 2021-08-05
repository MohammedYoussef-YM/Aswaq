import 'package:dio/dio.dart';
import 'package:flutter_ui_kit/restaurant/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/order_details_model.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/track_model.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';

class RestOrderRepo {
  Future<ApiResponse> getOrderList() async {
    try {
      List<OrderModel> _orderList = [
        OrderModel(id: 1, userId: '1', deliveryAddressId: '1', orderAmount: '500', couponDiscountTitle: '', couponDiscountAmount: '10', addOnIds: [1], orderStatus: 'pending', totalTaxAmount: '20', updatedAt: '2021-01-02T06:11:23.000000Z', createdAt: '12/12/2020'),
        OrderModel(id: 2, userId: '1', deliveryAddressId: '1', orderAmount: '500', couponDiscountTitle: '', couponDiscountAmount: '10', addOnIds: [1], deliveryMan: DeliveryMan(id: 1, image: Images.user, fName: 'John', lName: 'Doe', phone: '12345678'), deliveryManId: '1', orderStatus: 'delivered', totalTaxAmount: '20', updatedAt: '2021-01-02', createdAt: '12/12/2020'),
      ];
      final response = Response(requestOptions: RequestOptions(path: ''), data: _orderList, statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getOrderDetails(String orderID) async {
    try {
      List<OrderDetailsModel> _orderDetailsList = [
        OrderDetailsModel(id: 1, addOnIds: [1], productId: '1', price: '100', discountType: 'percent', discountOnProduct: '10', orderId: '100001', productDetails: Product(name: 'Product 1', id: 1, image: Images.product_1, discountType: 'percent', discount: '5', addOns: [AddOns(id: 1, name: 'Chese', price: '5'), AddOns(id: 2, name: 'Drinks', price: '5')], description: '* Rice', price: '100', rating: [Rating(average: '4.5', productId: '1')], tax: '2', taxType: 'percent', choiceOptions: [], variations: []), quantity: '2', taxAmount: '20', variant: '', variation: '', createdAt: '2021-01-02T06:11:23.000000Z'),
      ];
      final response = Response(requestOptions: RequestOptions(path: ''), data: _orderDetailsList, statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> trackOrder(String orderID) async {
    try {
      OrderModel _orderModel = OrderModel(id: 1, userId: '1', deliveryAddressId: '1', orderAmount: '500', couponDiscountTitle: '', couponDiscountAmount: '10', addOnIds: [1], orderStatus: 'pending', totalTaxAmount: '20', updatedAt: '2021-01-02T06:11:23.000000Z');
      final response = Response(requestOptions: RequestOptions(path: ''), data: _orderModel, statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}