import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/grocery/data/models/category_model.dart';
import 'package:flutter_ui_kit/grocery/data/models/product.dart';
import 'package:flutter_ui_kit/grocery/data/repository/home_repo.dart';

class GroceryHomeProvider with ChangeNotifier{
  final HomeRepo homeRepo;
  GroceryHomeProvider({this.homeRepo});

  List<String> _bannerList=[];
  List<String> get bannerList=>_bannerList;

  List<CategoryModel> _categoryList=[];
  List<CategoryModel> get categoryList=>_categoryList;

  List<GroceryProduct> _likeProducts=[];
  List<GroceryProduct> get likeProducts=>_likeProducts;

  List<GroceryProduct> _popularProducts=[];
  List<GroceryProduct> get popularProducts=>_popularProducts;

  updateLikeFabouriteCondition(int index){
    for(int i=0;i<_likeProducts.length;i++){
      if(i==index){
        _likeProducts[index].isFabourite=!_likeProducts[index].isFabourite;
        notifyListeners();
      }
    }
  }

  int _bannerIndex=0;
  int get bannerIndex=>_bannerIndex;
  updateBannerIndex(int index){
    _bannerIndex=index;
    notifyListeners();
  }

  initializeBannerList(){
    if (_bannerList.length == 0) {
      _bannerList.clear();
      _bannerList = homeRepo.getAllSlider;
      notifyListeners();
    }
  }

  initializeCategoryList(){
    if (_categoryList.length == 0) {
      _categoryList.clear();
      _categoryList = homeRepo.getAllCategory;
      notifyListeners();
    }
  }
  initializeLikeProducts(){
    if (_likeProducts.length == 0) {
      _likeProducts.clear();
      _likeProducts = homeRepo.getAllLikeProduct;
      notifyListeners();
    }
  }
  initializePopularProducts(){
    if (_popularProducts.length == 0) {
      _popularProducts.clear();
      _popularProducts = homeRepo.getAllPopularItems;
      notifyListeners();
    }
  }
}