import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/model/response/order_details_model.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/model/response/order_model.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/repository/order_repo.dart';

class RestaurantDeliveryBoyOrderProvider with ChangeNotifier {
  final RestaurantDeliveryBoyOrderRepo orderRepo;

  RestaurantDeliveryBoyOrderProvider({@required this.orderRepo});

  // get all current order
  List<OrderModel> _currentOrders = [];
  List<OrderModel> _currentOrdersReverse = [];

  List<OrderModel> get currentOrders => _currentOrders;

  void getAllOrders() async {
    ApiResponse apiResponse = await orderRepo.getAllOrders();
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _currentOrders = [];
      _currentOrdersReverse = [];
      apiResponse.response.data.forEach((order) {
        OrderModel orderModel = order;
        _currentOrdersReverse.add(orderModel);
      });
      _currentOrders = new List.from(_currentOrdersReverse.reversed);
    } else {
      print(apiResponse.error.toString());
    }
    notifyListeners();
  }



  // get order details
  OrderDetailsModel _orderDetailsModel = OrderDetailsModel();

  OrderDetailsModel get orderDetailsModel => _orderDetailsModel;
  List<OrderDetailsModel> _orderDetails;

  List<OrderDetailsModel> get orderDetails => _orderDetails;

  Future<List<OrderDetailsModel>> getOrderDetails({String orderID}) async {
    _orderDetails = null;
    ApiResponse apiResponse = await orderRepo.getOrderDetails();
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _orderDetails = [];
      _orderDetails = apiResponse.response.data;
    } else {
      print(apiResponse.error.errors[0].message);
    }
    notifyListeners();
    return _orderDetails;
  }

  // get all order history

  List<OrderModel> get allOrderHistory => _currentOrders;

  Future<List<OrderModel>> getOrderHistory() async {
    ApiResponse apiResponse = await orderRepo.getAllOrders();
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _currentOrders = [];
      _currentOrders = apiResponse.response.data;
    } else {
      print(apiResponse.error.errors[0].message);
    }
    notifyListeners();
    return _currentOrders;
  }

  // update Order Status
  updateOrderStatus({String status, int index}) {
    _currentOrders[index].orderStatus = status;
    notifyListeners();
  }

  removeOrder({int index,String id}) {
    // OrderModel orderModel;
    // _currentOrders.forEach((order) {
    //   if(order.id.toString() == id) {
    //     orderModel = order;
    //   }
    // });
    // _currentOrders.remove(orderModel);

    _currentOrders.removeAt(index);
    notifyListeners();
  }

  Future<List<OrderModel>> refresh() async {
    getAllOrders();
    Timer(Duration(seconds: 5), () {});
    return getOrderHistory();
  }
}
