import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/cart_model.dart';
import 'package:flutter_ui_kit/restaurant/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestCartRepo{
  final SharedPreferences sharedPreferences;
  RestCartRepo({@required this.sharedPreferences});

  List<CartModel> getCartList() {
    List<String> carts = [];
    if(sharedPreferences.containsKey(RestAppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(RestAppConstants.CART_LIST);
    }
    List<CartModel> cartList = [];
    carts.forEach((cart) => cartList.add(CartModel.fromJson(jsonDecode(cart))) );
    return cartList;
  }

  void addToCartList(List<CartModel> cartProductList) {
    List<String> carts = [];
    cartProductList.forEach((cartModel) => carts.add(jsonEncode(cartModel)) );
    sharedPreferences.setStringList(RestAppConstants.CART_LIST, carts);
  }

}