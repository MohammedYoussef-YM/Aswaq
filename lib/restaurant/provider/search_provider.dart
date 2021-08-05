import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/restaurant/data/repository/search_repo.dart';

class RestSearchProvider with ChangeNotifier {
  final RestSearchRepo searchRepo;

  RestSearchProvider({@required this.searchRepo});

  int _filterIndex = 0;
  List<String> _historyList = [];

  int get filterIndex => _filterIndex;

  List<String> get historyList => _historyList;

  void setFilterIndex(int index) {
    _filterIndex = index;
    notifyListeners();
  }

  void sortSearchList(int filterIndex, {double startingPrice, double endingPrice, int selectCategoryIndex, double ratingValue}) {
    _filterIndex = filterIndex;
    _searchProductList.clear();
    print(_filterIndex);
    print(ratingValue);
    if (_filterIndex == 0) {
      _searchProductList.addAll(_filterProductList
          .where((product) => (double.parse(product.price)) > startingPrice && (double.parse(product.price)) < endingPrice)
          .toList());
    } else if (_filterIndex == 1) {
      _searchProductList.addAll(_filterProductList.where((product) => (int.parse(product.categoryIds[0].id)) == selectCategoryIndex).toList());
    } else if (_filterIndex == 2) {
      _searchProductList.addAll(_filterProductList.where((product) => (double.parse(product.rating[0].average)) == ratingValue).toList());
    } else if (_filterIndex == 3) {
      _searchProductList.addAll(_filterProductList
          .where((product) =>
              (double.parse(product.price)) > startingPrice &&
              (double.parse(product.price)) < endingPrice &&
              int.parse(product.categoryIds[0].id) == selectCategoryIndex)
          .toList());
    } else if (_filterIndex == 4) {
      _searchProductList.addAll(_filterProductList
          .where((product) =>
              (double.parse(product.price)) > startingPrice &&
              (double.parse(product.price)) < endingPrice &&
              int.parse(product.categoryIds[0].id) == selectCategoryIndex &&
              (double.parse(product.rating[0].average)) == ratingValue)
          .toList());
    }

    notifyListeners();
  }

  List<Product> _searchProductList;
  List<Product> _filterProductList;
  bool _isClear = true;
  String _searchText = '';

  List<Product> get searchProductList => _searchProductList;

  List<Product> get filterProductList => _filterProductList;

  bool get isClear => _isClear;

  String get searchText => _searchText;

  void setSearchText(String text) {
    _searchText = text;
    notifyListeners();
  }

  void cleanSearchProduct() {
    _searchProductList = [];
    _isClear = true;
    _searchText = '';
    notifyListeners();
  }

  void searchProduct(String query) async {
    _searchText = query;
    _isClear = false;
    _searchProductList = null;
    _filterProductList = null;
    notifyListeners();

    ApiResponse apiResponse = await searchRepo.getSearchProductList(query);
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      if (query.isEmpty) {
        _searchProductList = [];
      } else {
        _searchProductList = [];
        _searchProductList.addAll(apiResponse.response.data);
        _filterProductList = [];
        _filterProductList.addAll(apiResponse.response.data);
      }
      notifyListeners();
    } else {
      print(apiResponse.error.toString());
    }
  }

  void initHistoryList() {
    _historyList = searchRepo.getSearchAddress();
    notifyListeners();
  }

  void saveSearchAddress(String searchAddress) async {
    searchRepo.saveSearchAddress(searchAddress);
    if (!_historyList.contains(searchAddress)) {
      _historyList.add(searchAddress);
    }
    notifyListeners();
  }

  void clearSearchAddress() async {
    searchRepo.clearSearchAddress();
    _historyList.clear();
    notifyListeners();
  }

  int _rating = -1;

  int get rating => _rating;

  void setRating(int rate) {
    _rating = rate;
    notifyListeners();
  }
}
