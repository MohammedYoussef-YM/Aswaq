import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/body/order_place_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/cart_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/order_details.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/order_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/shipping_method_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/repository/order_repo.dart';

class SixOrderProvider with ChangeNotifier {
  final SixOrderRepo orderRepo;
  SixOrderProvider({@required this.orderRepo});

  List<OrderModel> _pendingList;
  List<OrderModel> _deliveredList;
  List<OrderModel> _canceledList;
  int _addressIndex;
  int _shippingIndex;
  bool _isLoading = false;
  List<ShippingMethodModel> _shippingList;
  int _paymentMethodIndex = 0;

  int get paymentMethodIndex => _paymentMethodIndex;
  List<OrderModel> get pendingList => _pendingList;
  List<OrderModel> get deliveredList => _deliveredList;
  List<OrderModel> get canceledList => _canceledList;
  int get addressIndex => _addressIndex;
  int get shippingIndex => _shippingIndex;
  bool get isLoading => _isLoading;
  List<ShippingMethodModel> get shippingList => _shippingList;

  void initOrderList() async {
    _pendingList = [];
    _deliveredList = [];
    _canceledList = [];
    orderRepo.getOrderList().forEach((order) {
      OrderModel orderModel = order;
      if (orderModel.orderStatus == 'pending') {
        _pendingList.add(orderModel);
      } else if (orderModel.orderStatus == 'delivered') {
        _deliveredList.add(orderModel);
      } else if (orderModel.orderStatus == 'cancelled') {
        _canceledList.add(orderModel);
      }
    });
    notifyListeners();
  }

  int _orderTypeIndex = 0;
  int get orderTypeIndex => _orderTypeIndex;

  void setIndex(int index) {
    _orderTypeIndex = index;
    notifyListeners();
  }

  List<OrderDetailsModel> _orderDetails;
  List<OrderDetailsModel> get orderDetails => _orderDetails;

  void getOrderDetails() async {
    _orderDetails = [];
    orderRepo.getOrderDetails().forEach((order) => _orderDetails.add(order));
    notifyListeners();
  }

  Future<void> placeOrder(OrderPlaceModel orderPlaceModel, Function callback, List<CartModel> cartList) async {
    _addressIndex = null;
    callback(true, 'Order placed successfully', cartList);
    notifyListeners();
  }

  void setAddressIndex(int index) {
    _addressIndex = index;
    notifyListeners();
  }

  void initShippingList() async {
    _shippingList = [];
    orderRepo.getShippingList().forEach((shippingMethod) => _shippingList.add(shippingMethod));
    notifyListeners();
  }

  void setSelectedShippingAddress(int index) {
    _shippingIndex = index;
    notifyListeners();
  }

  void stopLoader() {
    _isLoading = false;
    notifyListeners();
  }

}
