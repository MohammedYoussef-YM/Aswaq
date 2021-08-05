import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/grocery/data/models/choose_category_model.dart';
import 'package:flutter_ui_kit/grocery/data/repository/choose_category_repo.dart';

class ChooseCategoryProvider with ChangeNotifier{
  final ChooseCategoryRepo categoryRepo;
  ChooseCategoryProvider({this.categoryRepo});

  List<ChooseCategoryModel> _chooseCategoryList=[];
  List<ChooseCategoryModel> get chooseCategoryList=>_chooseCategoryList;

  selectProduct(int index){
    for(int i=0;i<_chooseCategoryList.length;i++){
      if(i==index){
        _chooseCategoryList[index].isSelect=!_chooseCategoryList[index].isSelect;
        notifyListeners();
      }
    }
  }

  void initializeChooseCateoryList() {
    if (_chooseCategoryList.length == 0) {
      _chooseCategoryList.clear();
      _chooseCategoryList = categoryRepo.getChooseCategoryList;
      notifyListeners();
    }
  }

}