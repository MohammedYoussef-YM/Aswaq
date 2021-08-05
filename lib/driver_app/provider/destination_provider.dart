import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/rideshare/data/model/destination_model.dart';
import 'package:flutter_ui_kit/rideshare/data/repository/destination_repo.dart';

class DestinationProvider with ChangeNotifier {
  final DestinationRepo destinationRepo;

  DestinationProvider({this.destinationRepo});

  List<DestinationModel> _destinations = [];
  List<String> _getAllTips = [];

  List<String> get getAllTips => _getAllTips;

  List<DestinationModel> get destinations => _destinations;

  int _selectIndex = -1;

  int get selectIndex => _selectIndex;

  changeSelectIndex(int index) {
    _selectIndex = index;
    if (index != -1) {
      notifyListeners();
    }
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

  int _selectRideIndex = 0;

  int get selectRideIndex => _selectRideIndex;

  updateRideIndex(int index) {
    _selectRideIndex = index;
    notifyListeners();
  }
}
