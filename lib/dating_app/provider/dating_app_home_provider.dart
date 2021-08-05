import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/dating_app/data/models/dating_model.dart';
import 'package:flutter_ui_kit/dating_app/data/repository/dating_app_home_repo.dart';

class DatingAppHomeProvider with ChangeNotifier {
  final DatingAppHomeRepo homeRepo;

  DatingAppHomeProvider({this.homeRepo});

  // for home screen
  List<DatingModel> _getAllDatingModels = [];

  List<DatingModel> get getAllDatingModels => _getAllDatingModels;

  initializeDatingData() {
    if (_getAllDatingModels.length == 0) {
      _getAllDatingModels.clear();
      _getAllDatingModels = homeRepo.getAllDatingData;
      notifyListeners();
    }
  }

  // for location
  List<String> _getAllLocation = [];

  List<String> get getAllLocation => _getAllLocation;
  String _initializeLocation = '';

  String get initializeLocation => _initializeLocation;
  int _selectLocationIndex = -1;

  int get selectLocationIndex => _selectLocationIndex;

  initializeLocationData() {
    if (_getAllLocation.length == 0) {
      _getAllLocation.clear();
      _initializeLocation=homeRepo.getAllLocation[4];
      _getAllLocation = homeRepo.getAllLocation;
      notifyListeners();
    }
  }

  changeLocation(int index){
    _initializeLocation=homeRepo.getAllLocation[index];
    _selectLocationIndex=index;
    notifyListeners();
  }
}
