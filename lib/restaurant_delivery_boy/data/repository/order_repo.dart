import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/model/response/order_details_model.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/model/response/order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantDeliveryBoyOrderRepo {
  final SharedPreferences sharedPreferences;

  RestaurantDeliveryBoyOrderRepo({@required this.sharedPreferences});

  Future<ApiResponse> getAllOrders() async {
    try {
      List<OrderModel> _orderList = [
        OrderModel(
          id: 10222,
          userId: '1',
          deliveryAddressId: '1',
          orderAmount: '500',
          couponDiscountTitle: '',
          couponDiscountAmount: '10',
          paymentStatus: 'unpaid',
          deliveryManId: '1',
          orderStatus: 'processing',
          totalTaxAmount: '20',
          updatedAt: '2021-01-02T06:11:23.000000Z',
          deliveryAddress: DeliveryAddress(
              id: 1,
              addressType: 'Home',
              contactPersonName: '0121212',
              address: 'Basilla Road Dhaka District BD',
              latitude: '23.73903511350425',
              longitude: '90.341184027493',
              createdAt: '2021-01-30T07:07:05.000000Z',
              updatedAt: '2021-01-30T07:07:05.000000Z',
              userId: '10',
              contactPersonNumber: 'Nipon Roy'),
        ),
        OrderModel(
          id: 100138,
          userId: '2',
          deliveryAddressId: '1',
          orderAmount: '643',
          couponDiscountTitle: '',
          couponDiscountAmount: '10',
          paymentStatus: 'unpaid',
          deliveryManId: '1',
          orderStatus: 'out_for_delivery',
          totalTaxAmount: '20',
          updatedAt: '2021-01-02T06:11:23.000000Z',
          deliveryAddress: DeliveryAddress(
              id: 1,
              addressType: 'Home',
              contactPersonName: '0121212',
              address: 'Dhaka,Bangladesh',
              latitude: '23.73903511350425',
              longitude: '90.341184027493',
              createdAt: '2021-01-30T07:07:05.000000Z',
              updatedAt: '2021-01-30T07:07:05.000000Z',
              userId: '10',
              contactPersonNumber: 'Nipon Roy'),
        ),
        OrderModel(
          id: 123231,
          userId: '1',
          deliveryAddressId: '1',
          orderAmount: '500',
          couponDiscountTitle: '',
          couponDiscountAmount: '10',
          paymentStatus: 'unpaid',
          deliveryManId: '1',
          orderStatus: 'processing',
          totalTaxAmount: '20',
          updatedAt: '2021-01-02T06:11:23.000000Z',
          deliveryAddress: DeliveryAddress(
              id: 1,
              addressType: 'Home',
              contactPersonName: '0121212',
              address: 'Barisal,Bangladesh',
              latitude: '23.73903511350425',
              longitude: '90.341184027493',
              createdAt: '2021-01-30T07:07:05.000000Z',
              updatedAt: '2021-01-30T07:07:05.000000Z',
              userId: '10',
              contactPersonNumber: 'Nipon Roy'),
        ),
        OrderModel(
          id: 121101,
          userId: '2',
          deliveryAddressId: '1',
          orderAmount: '643',
          couponDiscountTitle: '',
          couponDiscountAmount: '10',
          paymentStatus: 'unpaid',
          deliveryManId: '1',
          orderStatus: 'out_for_delivery',
          totalTaxAmount: '20',
          updatedAt: '2021-01-02T06:11:23.000000Z',
          deliveryAddress: DeliveryAddress(
              id: 1,
              addressType: 'Home',
              contactPersonName: '0121212',
              address: 'Basilla Road Dhaka District BD',
              latitude: '23.73903511350425',
              longitude: '90.341184027493',
              createdAt: '2021-01-30T07:07:05.000000Z',
              updatedAt: '2021-01-30T07:07:05.000000Z',
              userId: '10',
              contactPersonNumber: 'Nipon Roy'),
        ),
      ];
      final response = Response(requestOptions: RequestOptions(path: ''), data: _orderList, statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getOrderDetails({String orderID}) async {
    try {
      List<OrderDetailsModel> _orderDetailsList = [
        OrderDetailsModel(
            id: 1,
            addOnIds: [1],
            productId: '1',
            price: '100',
            discountType: 'percent',
            discountOnProduct: '10',
            orderId: '100001',
            productDetails: ProductDetails(
                name: 'Product 1',
                id: 1,
                image: Images.product_1,
                discountType: 'percent',
                discount: '5',
                addOns: [AddOns(id: 1, name: 'Chese', price: '5'), AddOns(id: 2, name: 'Drinks', price: '5')],
                description: '* Rice',
                price: '100',
                //rating: [Rating(average: '4.5', productId: '1')],
                tax: '2',
                taxType: 'percent',
                choiceOptions: [],
                variations: []),
            quantity: '2',
            taxAmount: '20',
            variant: '',
            variation: '',
            createdAt: '2021-01-02T06:11:23.000000Z',
            updatedAt: '2021-01-02T06:11:23.000000Z'),
      ];
      final response = Response(requestOptions: RequestOptions(path: ''), data: _orderDetailsList, statusCode: 200);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}
