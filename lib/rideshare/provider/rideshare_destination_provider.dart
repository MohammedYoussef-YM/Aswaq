import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/rideshare/data/model/destination_model.dart';
import 'package:flutter_ui_kit/rideshare/data/repository/destination_repo.dart';

class RideShareDestinationProvider with ChangeNotifier {
  final DestinationRepo destinationRepo;

  RideShareDestinationProvider({this.destinationRepo});

  List<DestinationModel> _destinations = [];
  List<String> _getAllTips = [];

  List<String> get getAllTips => _getAllTips;

  List<DestinationModel> get destinations => _destinations;

  int _selectIndex = 0;

  int get selectIndex => _selectIndex;

  changeSelectIndex(int index) {
    _selectIndex = index;
    notifyListeners();
  }

  initializeDestination() {
    if (_destinations.length == 0) {
      _destinations.clear();
      _destinations = destinationRepo.getAllAddressList;
      notifyListeners();
    }
  }

  initializeGetAllTips() {
    if (_getAllTips.length == 0) {
      _getAllTips.clear();
      _getAllTips = destinationRepo.getAllTip;
      notifyListeners();
    }
  }
}
