import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/category_model.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/restaurant/data/repository/category_repo.dart';

class RestCategoryProvider extends ChangeNotifier {
  final RestCategoryRepo categoryRepo;

  RestCategoryProvider({@required this.categoryRepo});

  List<CategoryModel> _categoryList;
  List<CategoryModel> _subCategoryList = [];
  List<Product> _categoryProductList = [];

  List<CategoryModel> get categoryList => _categoryList;
  List<CategoryModel> get subCategoryList => _subCategoryList;
  List<Product> get categoryProductList => _categoryProductList;

  void getCategoryList(BuildContext context) async {
    ApiResponse apiResponse = await categoryRepo.getCategoryList();
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _categoryList = [];
      apiResponse.response.data.forEach((category) => _categoryList.add(category));
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(apiResponse.error.toString())));
    }
  }

  void getSubCategoryList(BuildContext context, String parentID) async {
    ApiResponse apiResponse = await categoryRepo.getSubCategoryList(parentID);
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _subCategoryList.clear();
      apiResponse.response.data.forEach((category) => _subCategoryList.add(category));
      getCategoryProductList(context, _subCategoryList[0].id.toString());
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(apiResponse.error.toString())));
    }
  }

  void getCategoryProductList(BuildContext context, String categoryID) async {
    ApiResponse apiResponse = await categoryRepo.getCategoryProductList(categoryID);
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _categoryProductList.clear();
      apiResponse.response.data.forEach((category) => _categoryProductList.add(category));
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(apiResponse.error.toString())));
    }
  }

  int _selectCategory = -1;

  int get selectCategory => _selectCategory;

  updateSelectCategory(int index) {
    _selectCategory = index;
    notifyListeners();
  }
}
