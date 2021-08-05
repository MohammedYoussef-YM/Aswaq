import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/restaurant/data/repository/product_repo.dart';
import 'package:flutter_ui_kit/restaurant/data/repository/wishlist_repo.dart';

class RestWishListProvider extends ChangeNotifier {
  final RestWishListRepo wishListRepo;
  final RestProductRepo productRepo;
  RestWishListProvider({@required this.wishListRepo, @required this.productRepo});

  List<Product> _wishList;
  List<int> _wishIdList = [];

  List<Product> get wishList => _wishList;
  List<int> get wishIdList => _wishIdList;

  void addToWishList(Product product, Function feedbackMessage) async {
    feedbackMessage('Successful');
    _wishList.add(product);
    _wishIdList.add(product.id);
    notifyListeners();
  }

  void removeFromWishList(Product product, Function feedbackMessage) async {
    feedbackMessage('Successful');
    int _idIndex = _wishIdList.indexOf(product.id);
    _wishIdList.removeAt(_idIndex);
    _wishList.removeAt(_idIndex);
    notifyListeners();
  }

  void clearWishList() {
    _wishList = null;
    _wishIdList = [];
  }

  Future<void> initWishList() async {
    ApiResponse apiResponse = await wishListRepo.getWishList();
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _wishList = [];
      _wishIdList = [];
      notifyListeners();
      apiResponse.response.data.forEach((wishList) async {
        ApiResponse productResponse = await productRepo.searchProduct(wishList.productId);
        if (productResponse.response != null && productResponse.response.statusCode == 200) {
          Product _product = productResponse.response.data;
          _wishList.add(_product);
          _wishIdList.add(_product.id);
          notifyListeners();
        } else {
          print(apiResponse.error.toString());
        }
      });
    } else {
      print(apiResponse.error.toString());
    }
  }
}
