import 'package:flutter/foundation.dart';

class ProductProvider with ChangeNotifier {
  int _imageSliderIndex = 0;

  int get imageSliderIndex => _imageSliderIndex;

  setImageSliderIndex(int value) {
    _imageSliderIndex = value;
    notifyListeners();
  }

  bool _isOpenAddToCart = false;

  bool get isOpenAddToCart => _isOpenAddToCart;


  toggolAddToCard() {
    _isOpenAddToCart = !_isOpenAddToCart;
    notifyListeners();
  }


  int _countProduct = 0;

  int get countProduct => _countProduct;

  incrementCountProduct() {
    _countProduct++;
    notifyListeners();
  }

  setCounter(int count) {
    _countProduct = count;
    notifyListeners();
  }
  decrementCountProduct() {
    if(_countProduct>0){
      _countProduct--;
      notifyListeners();
    }

  }
}
