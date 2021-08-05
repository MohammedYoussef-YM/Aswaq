import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/data/model/course.dart';
import 'package:flutter_ui_kit/academy/data/model/wishlist_model.dart';
import 'package:flutter_ui_kit/academy/data/repository/wish_list_repo.dart';

class AcademyWishListProvider extends ChangeNotifier {
  AcademyWishListRepo wishListRepo;

  AcademyWishListProvider({@required this.wishListRepo});

  List<WishListModel> _wishLists = [];
  List<bool> _isCheckedList = [];
  List<Course> _allCardList = [];

  List<Course> get allCardList => _allCardList;

  List<WishListModel> get wishLists => _wishLists;

  List<bool> get isCheckedList => _isCheckedList;

  // ignore: non_constant_identifier_names
  void AddedCard(Course course) {
    _allCardList.add(course);
    notifyListeners();
  }

  changeSelectCard(int index) async {
    _allCardList[index].isSelect = !_allCardList[index].isSelect;
    notifyListeners();
  }

  void getWishLists() {
    if (_wishLists.length == 0) {
      _wishLists.clear();
      _isCheckedList.clear();
      _wishLists.addAll(wishListRepo.getWishLists());
      _wishLists.forEach((wishlist) => _isCheckedList.add(false));
      _isCheckedList[0] = true;
      notifyListeners();
    }
  }

  void getCardLists() {
    if (_allCardList.length == 0) {
      _allCardList.clear();
      _allCardList.addAll(wishListRepo.getAllCartLists());
      _isCheckedList[0] = true;
      notifyListeners();
    }
  }

  void toggleCheck(int index) {
    _isCheckedList[index] = !_isCheckedList[index];
    notifyListeners();
  }
}
