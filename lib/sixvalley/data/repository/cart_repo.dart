import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/cart_model.dart';
import 'package:flutter_ui_kit/sixvalley/utill/app_constants.dart';

class SixCartRepo{
  final SharedPreferences sharedPreferences;
  SixCartRepo({@required this.sharedPreferences});

  List<CartModel> getCartList() {
    List<String> carts = sharedPreferences.getStringList(SixAppConstants.CART_LIST);
    List<CartModel> cartList = [];
    carts.forEach((cart) => cartList.add(CartModel.fromJson(jsonDecode(cart))) );
    return cartList;
  }

  void addToCartList(List<CartModel> cartProductList) {
    List<String> carts = [];
    cartProductList.forEach((cartModel) => carts.add(jsonEncode(cartModel)) );
    sharedPreferences.setStringList(SixAppConstants.CART_LIST, carts);
  }

}