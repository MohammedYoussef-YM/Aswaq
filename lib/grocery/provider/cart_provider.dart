import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/grocery/data/models/product.dart';
import 'package:flutter_ui_kit/grocery/data/repository/cart_repo.dart';

class CartProvider with ChangeNotifier {
  final CartRepo cartRepo;

  CartProvider({this.cartRepo});

  List<GroceryProduct> _singleItems = [];
  List<GroceryProduct> get singleItems => _singleItems;
  List<GroceryProduct> _getFreshSaladItems = [];
  List<GroceryProduct> get getFreshSaladItems => _getFreshSaladItems;

  incrementSingleItem(int index) {
    _singleItems[index].count++;
    notifyListeners();
  }

  decrementSingleItem(int index) {
    if (_singleItems[index].count > 0) {
      _singleItems[index].count--;
      notifyListeners();
    }
  }

  iniatializeSingleItems() {
    if (_singleItems.length == 0) {
      _singleItems.clear();
      _singleItems = cartRepo.getAllSingleItems;
      notifyListeners();
    }
  }
  iniatializeFreshSaladItems() {
    if (_getFreshSaladItems.length == 0) {
      _getFreshSaladItems.clear();
      _getFreshSaladItems = cartRepo.getFreshSaladPastaProducts;
      notifyListeners();
    }
  }
}
