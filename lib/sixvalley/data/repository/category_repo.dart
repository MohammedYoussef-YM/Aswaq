import 'package:flutter_ui_kit/sixvalley/data/model/response/category.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';

class SixCategoryRepo {
  List<Category> getCategoryList() {
    List<Category> categoryList = [
      Category(id: 1, name: 'Accessories', icon: Images.category_one, subCategories: [SubCategory(name: 'Headphone', subSubCategories: [SubSubCategory(id: 1, name: 'Earphone', position: '1')])]),
      Category(id: 2, name: 'Vehicle', icon: Images.category_two, subCategories: []),
      Category(id: 3, name: 'Electronic Devices', icon: Images.category_three, subCategories: []),
      Category(id: 4, name: 'Electronic Accessories', icon: Images.category_four, subCategories: []),
      Category(id: 5, name: 'TV', icon: Images.category_five, subCategories: []),
      Category(id: 6, name: 'Health and Beauty', icon: Images.category_six, subCategories: []),
      Category(id: 7, name: 'Babies and toys', icon: Images.category_seven, subCategories: []),
      Category(id: 8, name: 'Groceries', icon: Images.category_eight, subCategories: []),
      Category(id: 1, name: 'Accessories', icon: Images.category_one, subCategories: [SubCategory(name: 'Headphone', subSubCategories: [SubSubCategory(id: 1, name: 'Earphone', position: '1')])]),
      Category(id: 2, name: 'Vehicle', icon: Images.category_three, subCategories: []),
      Category(id: 3, name: 'Electronic Devices', icon: Images.category_five, subCategories: []),
      Category(id: 4, name: 'Electronic Accessories', icon: Images.category_seven, subCategories: []),
      Category(id: 5, name: 'TV', icon: Images.category_eight, subCategories: []),
      Category(id: 6, name: 'Health and Beauty', icon: Images.category_one, subCategories: []),
      Category(id: 7, name: 'Babies and toys', icon: Images.category_two, subCategories: []),
      Category(id: 8, name: 'Groceries', icon: Images.category_four, subCategories: []),
    ];
    return categoryList;
  }
}