import 'package:flutter/foundation.dart';

class HomeProvider with ChangeNotifier{

  int _count = 1;
  int _paymentIndex = 0;
  int _cardIndex = 0;
  int get count => _count;
  int get paymentIndex => _paymentIndex;
  int get cardIndex => _cardIndex;

  void setPaymentIndex(int index) {
    _paymentIndex = index;
    notifyListeners();
  }

  void setCardIndex(int index) {
    _cardIndex = index;
    notifyListeners();
  }

  incrementCounter(){
    _count++;
    notifyListeners();
  }
  decrementCounter(){
    if(_count>1)
      _count--;
    notifyListeners();
  }

  void setCounter(int value) {
    _count = value;
  }
}