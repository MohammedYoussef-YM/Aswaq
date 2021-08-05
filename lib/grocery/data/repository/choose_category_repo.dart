import 'package:flutter_ui_kit/grocery/data/models/choose_category_model.dart';
import 'package:flutter_ui_kit/grocery/utility/images.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';

class ChooseCategoryRepo {
  List<ChooseCategoryModel> getChooseCategoryList = [
    ChooseCategoryModel(imageUrl: Images.fruit, name: Strings.fruits, isSelect: false),
    ChooseCategoryModel(imageUrl: Images.healthy, name: Strings.healthy, isSelect: false),
    ChooseCategoryModel(imageUrl: Images.meat, name: Strings.meat, isSelect: false),
    ChooseCategoryModel(imageUrl: Images.snack, name: Strings.snack, isSelect: false),
    ChooseCategoryModel(imageUrl: Images.vagetable, name: Strings.vegetable, isSelect: false),
    ChooseCategoryModel(imageUrl: Images.fish, name: Strings.fish, isSelect: false),
    ChooseCategoryModel(imageUrl: Images.drink, name: Strings.drink, isSelect: false),
    ChooseCategoryModel(imageUrl: Images.nut, name: Strings.nuts, isSelect: false),
    ChooseCategoryModel(imageUrl: Images.medicine, name: Strings.medicine, isSelect: false),
  ];
}
