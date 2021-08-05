import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/repository/product_repo.dart';

class SixProductProvider extends ChangeNotifier {
  final SixProductRepo productRepo;
  SixProductProvider({@required this.productRepo});

  // Latest products
  List<Product> _latestProductList = [];
  bool _firstLoading = true;

  List<Product> get latestProductList => _latestProductList;
  bool get firstLoading => _firstLoading;

  void initLatestProductList() async {
    _latestProductList = [];
    _latestProductList.addAll(productRepo.getLatestProductList());
    _firstLoading = false;
    notifyListeners();
  }

  void removeFirstLoading() {
    _firstLoading = true;
    notifyListeners();
  }

  // Seller products
  List<Product> _sellerAllProductList = [];
  List<Product> _sellerProductList = [];
  List<Product> get sellerProductList => _sellerProductList;

  void initSellerProductList() async {
    _firstLoading = false;
    _sellerProductList.addAll(productRepo.getSellerProductList());
    _sellerAllProductList.addAll(productRepo.getSellerProductList());
    notifyListeners();
  }

  void filterData(String newText) {
    _sellerProductList.clear();
    if(newText.isNotEmpty) {
      _sellerAllProductList.forEach((product) {
        if (product.name.toLowerCase().contains(newText.toLowerCase())) {
          _sellerProductList.add(product);
        }
      });
    }else {
      _sellerProductList.clear();
      _sellerProductList.addAll(_sellerAllProductList);
    }
    notifyListeners();
  }

  void clearSellerData() {
    _sellerProductList = [];
    notifyListeners();
  }

  // Brand and category products
  List<Product> _brandOrCategoryProductList = [];
  bool _hasData;

  List<Product> get brandOrCategoryProductList => _brandOrCategoryProductList;
  bool get hasData => _hasData;

  void initBrandOrCategoryProductList(bool isBrand, String id) async {
    _brandOrCategoryProductList.clear();
    _hasData = true;
    productRepo.getBrandOrCategoryProductList().forEach((product) => _brandOrCategoryProductList.add(product));
    _hasData = _brandOrCategoryProductList.length > 1;

    notifyListeners();
  }

  // Related products
  List<Product> _relatedProductList;
  List<Product> get relatedProductList => _relatedProductList;

  void initRelatedProductList() async {
    _firstLoading = false;
    _relatedProductList = [];
    productRepo.getRelatedProductList().forEach((product) => _relatedProductList.add(product));
    notifyListeners();
  }

  void removePrevRelatedProduct() {
    _relatedProductList = null;
    notifyListeners();
  }
}
