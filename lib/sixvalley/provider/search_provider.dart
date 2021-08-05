import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/repository/search_repo.dart';

class SixSearchProvider with ChangeNotifier {
  final SixSearchRepo searchRepo;
  SixSearchProvider({@required this.searchRepo});

  int _filterIndex = 0;
  List<String> _historyList = [];

  int get filterIndex => _filterIndex;
  List<String> get historyList => _historyList;

  void setFilterIndex(int index) {
    _filterIndex = index;
    notifyListeners();
  }

  void sortSearchList(double startingPrice, double endingPrice) {
    if (_filterIndex == 0) {
      _searchProductList.clear();
      _searchProductList.addAll(_filterProductList);
    } else if (_filterIndex == 1) {
      _searchProductList.clear();
      if(startingPrice > 0 && endingPrice > startingPrice) {
        _searchProductList.addAll(_filterProductList.where((product) =>
        (double.parse(product.unitPrice)) > startingPrice && (double.parse(product.unitPrice)) < endingPrice).toList());
      }else {
        _searchProductList.addAll(_filterProductList);
      }
      _searchProductList.sort((a, b) => a.name.compareTo(b.name));
    } else if (_filterIndex == 2) {
      _searchProductList.clear();
      if(startingPrice > 0 && endingPrice > startingPrice) {
        _searchProductList.addAll(_filterProductList.where((product) =>
        (double.parse(product.unitPrice)) > startingPrice && (double.parse(product.unitPrice)) < endingPrice).toList());
      }else {
        _searchProductList.addAll(_filterProductList);
      }
      _searchProductList.sort((a, b) => a.name.compareTo(b.name));
      Iterable iterable = _searchProductList.reversed;
      _searchProductList = iterable.toList();
    } else if (_filterIndex == 3) {
      _searchProductList.clear();
      if(startingPrice > 0 && endingPrice > startingPrice) {
        _searchProductList.addAll(_filterProductList.where((product) =>
        (double.parse(product.unitPrice)) > startingPrice && (double.parse(product.unitPrice)) < endingPrice).toList());
      }else {
        _searchProductList.addAll(_filterProductList);
      }
      _searchProductList.sort((a, b) => double.parse(a.unitPrice).compareTo(double.parse(b.unitPrice)));
    } else if (_filterIndex == 4) {
      _searchProductList.clear();
      if(startingPrice > 0 && endingPrice > startingPrice) {
        _searchProductList.addAll(_filterProductList.where((product) =>
        (double.parse(product.unitPrice)) > startingPrice && (double.parse(product.unitPrice)) < endingPrice).toList());
      }else {
        _searchProductList.addAll(_filterProductList);
      }
      _searchProductList.sort((a, b) => a.unitPrice.compareTo(b.unitPrice));
      Iterable iterable = _searchProductList.reversed;
      _searchProductList = iterable.toList();
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

    if (query.isEmpty) {
      _searchProductList = [];
    } else {
      _searchProductList = [];
      _searchProductList.addAll(searchRepo.getSearchProductList());
      _filterProductList = [];
      _filterProductList.addAll(searchRepo.getSearchProductList());
    }
    notifyListeners();
  }

  // for save home address
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
}
