import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/body/place_order_body.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/order_details_model.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/response_model.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/track_model.dart';
import 'package:flutter_ui_kit/restaurant/data/repository/order_repo.dart';

class RestOrderProvider extends ChangeNotifier {
  final RestOrderRepo orderRepo;
  RestOrderProvider({@required this.orderRepo});

  List<OrderModel> _runningOrderList;
  List<OrderModel> _historyOrderList;
  List<OrderDetailsModel> _orderDetails;
  int _paymentMethodIndex = 0;
  OrderModel _trackModel;
  ResponseModel _responseModel;
  int _addressIndex = 0;
  bool _isLoading = false;

  List<OrderModel> get runningOrderList => _runningOrderList;
  List<OrderModel> get historyOrderList => _historyOrderList;
  List<OrderDetailsModel> get orderDetails => _orderDetails;
  int get paymentMethodIndex => _paymentMethodIndex;
  OrderModel get trackModel => _trackModel;
  ResponseModel get responseModel => _responseModel;
  int get addressIndex => _addressIndex;
  bool get isLoading => _isLoading;

  void getOrderList() async {
    ApiResponse apiResponse = await orderRepo.getOrderList();
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _runningOrderList = [];
      _historyOrderList = [];
      apiResponse.response.data.forEach((order) {
        OrderModel orderModel = order;
        if(orderModel.orderStatus == 'pending' || orderModel.orderStatus == 'processing' || orderModel.orderStatus == 'out_for_delivery') {
          _runningOrderList.add(orderModel);
        }else if(orderModel.orderStatus == 'delivered') {
          _historyOrderList.add(orderModel);
        }
      });
    } else {
      print(apiResponse.error.errors[0].message);
    }
    notifyListeners();
  }

  Future<List<OrderDetailsModel>> getOrderDetails(String orderID) async {
    _orderDetails = null;
    _isLoading = true;
    ApiResponse apiResponse = await orderRepo.getOrderDetails(orderID);
    _isLoading = false;
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _orderDetails = [];
      apiResponse.response.data.forEach((orderDetail) => _orderDetails.add(orderDetail));
    } else {
      print(apiResponse.error.errors[0].message);
    }
    notifyListeners();
    return _orderDetails;
  }

  void setPaymentMethod(int index) {
    _paymentMethodIndex = index;
    notifyListeners();
  }

  Future<ResponseModel> trackOrder(String orderID) async {
    _trackModel = null;
    _responseModel = null;
    ApiResponse apiResponse = await orderRepo.trackOrder(orderID);
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _trackModel = apiResponse.response.data;
      _responseModel = ResponseModel(true, apiResponse.response.data.toString());
    } else {
      _responseModel = ResponseModel(false, apiResponse.error.errors[0].message);
    }
    notifyListeners();
    return _responseModel;
  }

  Future<void> placeOrder(PlaceOrderBody placeOrderBody, Function callback) async {
    _isLoading = true;
    notifyListeners();
    _isLoading = false;
    _addressIndex = 0;
    callback(true, 'Successful', '100002');
    print('-------- Order placed successfully 100002 ----------');
    notifyListeners();
  }

  void stopLoader() {
    _isLoading = false;
    notifyListeners();
  }

  void setAddressIndex(int index) {
    _addressIndex = index;
    if(index != 0) {
      notifyListeners();
    }
  }

  void cancelOrder(String orderID, Function callback) async {
    _isLoading = true;
    _isLoading = false;
    OrderModel orderModel;
    _runningOrderList.forEach((order) {
      if(order.id.toString() == orderID) {
        orderModel = order;
      }
    });
    _runningOrderList.remove(orderModel);
    callback('Successful', true, orderID);
    notifyListeners();
  }

}