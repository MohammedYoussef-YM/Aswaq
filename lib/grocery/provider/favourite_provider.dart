import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/grocery/data/models/product.dart';
import 'package:flutter_ui_kit/grocery/data/repository/favourite_repo.dart';

class FavouriteProvider with ChangeNotifier {
  final FavouriteRepo favouriteRepo;

  FavouriteProvider({@required this.favouriteRepo});

  List<GroceryProduct> _getAllFavouriteList=[];
  List<GroceryProduct> get getAllFavouriteList=>_getAllFavouriteList;

  changeFavouriteStatus(int index){
    for(int i=0;i<_getAllFavouriteList.length;i++){
      if(i==index){
        _getAllFavouriteList[index].isFabourite=!_getAllFavouriteList[index].isFabourite;
        notifyListeners();
      }
    }
  }

  initializeFavouriteList(){
    if(_getAllFavouriteList.length==0){
      _getAllFavouriteList.clear();
      _getAllFavouriteList=favouriteRepo.getFavouriteList;
      notifyListeners();
    }
  }
}
