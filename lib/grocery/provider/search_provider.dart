import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/grocery/data/models/product.dart';
import 'package:flutter_ui_kit/grocery/data/repository/home_repo.dart';
import 'package:flutter_ui_kit/grocery/data/repository/search_repo.dart';

class SearchProvider with ChangeNotifier {
  final SearchRepo searchRepo;
  final HomeRepo homeRepo;

  SearchProvider({this.searchRepo, @required this.homeRepo});

  String _dropdownInitializeValueValue = '';

  String get dropdownInitializeValue => _dropdownInitializeValueValue;

  updateDropDownValue(String value) {
    _dropdownInitializeValueValue = value;
    notifyListeners();
  }

  List<String> _getAllSearchCategory = [];

  List<String> get getAllSearchCategory => _getAllSearchCategory;

  List<GroceryProduct> _products = [];

  List<GroceryProduct> get products => _products;

  searchProduct(String query) {
    if (query.isEmpty) {
      _products.clear();
      _products = homeRepo.getAllPopularItems;
      notifyListeners();
    } else {
      _products = [];
      homeRepo.getAllPopularItems.forEach((product) async {
        if (product.name.toLowerCase().contains(query.toLowerCase())) {
          _products.add(product);
        }
      });
      notifyListeners();
    }
  }

  initializeProducts() {
    if (_products.length == 0) {
      _products.clear();
      _products = homeRepo.getAllPopularItems;
      notifyListeners();
    }
  }

  initalizeAllSearchCategory() {
    if (_getAllSearchCategory.length == 0) {
      _getAllSearchCategory.clear();
      _getAllSearchCategory = searchRepo.getAllSearchCategory;
      _dropdownInitializeValueValue = searchRepo.getAllSearchCategory[0];
      notifyListeners();
    }
  }
}
