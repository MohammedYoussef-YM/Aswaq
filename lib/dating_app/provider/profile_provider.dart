import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/dating_app/data/repository/dating_app_profile_repo.dart';

class DatingAppProfileProvider with ChangeNotifier {
  final DatingAppProfileRepo profileRepo;

  DatingAppProfileProvider({this.profileRepo});

  List<String> _getAllUserImages = [];

  List<String> get getAllUserImages => _getAllUserImages;

  initializeAllProfileImage()async {
    if (_getAllUserImages.length == 0) {
      _getAllUserImages.clear();
      _getAllUserImages = profileRepo.getAllImages;
      notifyListeners();
    }
  }

  int _selectIndex = 0;

  int get selectIndex => _selectIndex;

  changeSelectIndex(int index) {
    _selectIndex = index;
    notifyListeners();
  }

  incrementSelectIndex(){
    if((_getAllUserImages.length-1)!=_selectIndex){
      _selectIndex++;
      notifyListeners();
    }
  }

  decrementSelectIndex(){
    if(_selectIndex>0){
      _selectIndex--;
      notifyListeners();
    }
  }
}
