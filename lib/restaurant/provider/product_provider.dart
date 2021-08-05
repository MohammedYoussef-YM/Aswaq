import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/restaurant/data/repository/product_repo.dart';

class RestProductProvider extends ChangeNotifier {
  final RestProductRepo productRepo;

  RestProductProvider({@required this.productRepo});

  // Latest products
  List<Product> _popularProductList;
  bool _isLoading = false;
  int _popularPageSize;
  List<String> _offsetList = [];
  List<int> _variationIndex;
  int _quantity = 1;
  List<int> _addOnIdList = [];
  List<AddOns> _addOnList = [];

  List<Product> get popularProductList => _popularProductList;
  bool get isLoading => _isLoading;
  int get popularPageSize => _popularPageSize;
  List<int> get variationIndex => _variationIndex;
  int get quantity => _quantity;
  List<int> get addOnIdList => _addOnIdList;
  List<AddOns> get addOnList => _addOnList;

  void getPopularProductList(BuildContext context, String offset) async {
    if (!_offsetList.contains(offset)) {
      _offsetList.add(offset);
      ApiResponse apiResponse = await productRepo.getPopularProductList(offset);
      if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
        if (offset == '1') {
          _popularProductList = [];
        }
        _popularProductList.addAll(apiResponse.response.data.products);
        _popularPageSize = apiResponse.response.data.totalSize;
        _isLoading = false;
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(apiResponse.error.toString())));
      }
    } else {
      _isLoading = false;
    }
  }

  void showBottomLoader() {
    _isLoading = true;
    notifyListeners();
  }

  void initData(Product product) {
    _variationIndex = [];
    product.choiceOptions.forEach((element) => _variationIndex.add(0));
    _quantity = 1;
    _addOnIdList = [];
    _addOnList = [];
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = _quantity + 1;
    } else {
      _quantity = _quantity - 1;
    }
    notifyListeners();
  }

  void setCartVariationIndex(int index, int i) {
    _variationIndex[index] = i;
    notifyListeners();
  }

  void addAddOn(bool isAdd, AddOns addOns) {
    if (isAdd) {
      _addOnIdList.add(addOns.id);
      _addOnList.add(addOns);
    } else {
      _addOnIdList.remove(addOns.id);
      _addOnList.remove(addOns);
    }
    notifyListeners();
  }

  int _rating = 0;
  int get rating => _rating;
  void setRating(int rate) {
    _rating = rate;
    notifyListeners();
  }


}
