import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/driver_app/data/repository/driverapp_home_repo.dart';
import 'package:flutter_ui_kit/rideshare/data/model/address_model.dart';

class DriverAppHomeProvider with ChangeNotifier {
  final DriverAppHomeRepo driverAppHomeRepo;

  DriverAppHomeProvider({@required this.driverAppHomeRepo});

  List<AddressModel> _allAddressModel = [];

  List<AddressModel> get allAddressModel => _allAddressModel;

  initializeAddres() {
    if (_allAddressModel.length == 0) {
      _allAddressModel.clear();
      _allAddressModel = driverAppHomeRepo.getAllAddressList;
      notifyListeners();
    }
  }

  int _selectIndex = -1;

  int get selectIndex => _selectIndex;

  updateSelectIndex(int index) {
    _selectIndex = index;
    notifyListeners();
  }
}
