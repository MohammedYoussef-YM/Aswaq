import 'package:flutter/material.dart';

class HouseCartProvider extends ChangeNotifier {

  int _cartQty = 1;
  int _paymentIndex = 0;
  List<int> _cartQtyList = [1, 1];
  int get cartQty => _cartQty;
  int get paymentIndex => _paymentIndex;
  List<int> get cartQtyList => _cartQtyList;

  void setCartQuantity(bool isIncrement) {
    if(isIncrement) {
      _cartQty = _cartQty + 1;
    }else {
      if(_cartQty > 1) {
        _cartQty = _cartQty - 1;
      }
    }
    notifyListeners();
  }

  void setPaymentIndex(int index) {
    _paymentIndex = index;
    notifyListeners();
  }

  void setCartQty(int index, bool isIncrement) {
    if(isIncrement) {
      _cartQtyList[index] = _cartQtyList[index] + 1;
    }else {
      if(_cartQtyList[index] > 1) {
        _cartQtyList[index] = _cartQtyList[index] - 1;
      }
    }
    notifyListeners();
  }
}