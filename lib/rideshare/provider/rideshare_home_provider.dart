import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/rideshare/data/model/address_model.dart';
import 'package:flutter_ui_kit/rideshare/data/repository/rideshare_home_repo.dart';

class RideShareHomeProvider with ChangeNotifier {
  final RideShareHomeRepo rideShareHomeRepo;

  RideShareHomeProvider({@required this.rideShareHomeRepo});

  List<AddressModel> _allAddressModel = [];

  List<AddressModel> get allAddressModel => _allAddressModel;

  int _destinationIndex = 0;
  int get destinationIndex => _destinationIndex;
  changeDestinationIndex(int index) {
    _destinationIndex = index;
    notifyListeners();
  }

  initializeAddres() {
    if (_allAddressModel.length == 0) {
      _allAddressModel.clear();
      _allAddressModel = rideShareHomeRepo.getAllAddressList;
      notifyListeners();
    }
  }
}
