import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/category.dart';
import 'package:flutter_ui_kit/sixvalley/data/repository/category_repo.dart';

class SixCategoryProvider extends ChangeNotifier {
  final SixCategoryRepo categoryRepo;

  SixCategoryProvider({@required this.categoryRepo});

  List<Category> _categoryList = [];
  int _categorySelectedIndex;

  List<Category> get categoryList => _categoryList;

  int get categorySelectedIndex => _categorySelectedIndex;

  void initCategoryList() async {
    if (_categoryList.length == 0) {
      _categoryList.clear();
      categoryRepo.getCategoryList().forEach((category) => _categoryList.add(category));
      _categorySelectedIndex = 0;
      notifyListeners();
    }
  }

  void changeSelectedIndex(int selectedIndex) {
    _categorySelectedIndex = selectedIndex;
    notifyListeners();
  }
}
