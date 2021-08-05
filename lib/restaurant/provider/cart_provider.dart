import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/cart_model.dart';
import 'package:flutter_ui_kit/restaurant/data/repository/cart_repo.dart';

class RestCartProvider extends ChangeNotifier {
  final RestCartRepo cartRepo;
  RestCartProvider({@required this.cartRepo});

  List<CartModel> _cartList = [];
  double _amount = 0.0;

  List<CartModel> get cartList => _cartList;
  double get amount => _amount;

  void getCartData() {
    _cartList = [];
    _cartList.addAll(cartRepo.getCartList());
    _cartList.forEach((cart) {
      _amount = _amount + (double.parse(cart.price) * cart.quantity);
    });
  }

  void addToCart(CartModel cartModel) {
    _cartList.add(cartModel);
    cartRepo.addToCartList(_cartList);
    _amount = _amount + (double.parse(cartModel.price) * cartModel.quantity);
    notifyListeners();
  }

  void setQuantity(bool isIncrement, CartModel cart) {
    int index = _cartList.indexOf(cart);
    if (isIncrement) {
      _cartList[index].quantity = _cartList[index].quantity + 1;
      _amount = _amount + double.parse(_cartList[index].price);
    } else {
      _cartList[index].quantity = _cartList[index].quantity - 1;
      _amount = _amount - double.parse(_cartList[index].price);
    }
    cartRepo.addToCartList(_cartList);

    notifyListeners();
  }

  void removeFromCart(CartModel cart) {
    _cartList.remove(cart);
    _amount = _amount - (double.parse(cart.price) * cart.quantity);
    cartRepo.addToCartList(_cartList);
    notifyListeners();
  }

  void clearCartList() {
    _cartList = [];
    _amount = 0;
    cartRepo.addToCartList(_cartList);
    notifyListeners();
  }

  bool isExistInCart(int productID) {
    List<String> _idList = [];
    _cartList.forEach((cart) => _idList.add(cart.productId));
    return _idList.contains(productID.toString());
  }

}
