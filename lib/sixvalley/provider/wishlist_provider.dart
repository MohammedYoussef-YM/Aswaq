import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/repository/wishlist_repo.dart';

class SixWishListProvider extends ChangeNotifier {
  final SixWishListRepo wishListRepo;
  SixWishListProvider({@required this.wishListRepo});

  bool _wish = false;
  String _searchText = "";

  bool get isWish => _wish;
  String get searchText => _searchText;

  clearSearchText() {
    _searchText = '';
    notifyListeners();
  }

  List<Product> _wishList = [];
  List<Product> _allWishList = [];

  List<Product> get wishList => _wishList;
  List<Product> get allWishList => _allWishList;

  void searchWishList(String query) async {
    _wishList = [];
    _searchText = query;

    if (query.isNotEmpty) {
      List<Product> products = _allWishList.where((product) {
        return product.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      _wishList.addAll(products);
    } else {
      _wishList.addAll(_allWishList);
    }
    notifyListeners();
  }

  void addWishList(Product product, {Function feedbackMessage}) async {
    String message = 'successful';
    _wishList.add(product);
    _allWishList.add(product);
    feedbackMessage(message);
    _wish = true;
    notifyListeners();
  }

  void removeWishList(Product product, {int index, Function feedbackMessage}) {
    String message = 'successful';
    if(feedbackMessage != null){
      feedbackMessage(message);
    }
    _wishList.remove(product);
    _allWishList.remove(product);
    _wish = false;
    notifyListeners();
  }

  void checkWishList(String productId) {
    List<String> productIdList = [];
    _allWishList.forEach((wishList) {
      productIdList.add(wishList.id.toString());
    });
    productIdList.contains(productId) ? _wish = true : _wish = false;
    notifyListeners();
  }
}
