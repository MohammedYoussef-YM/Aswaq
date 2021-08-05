import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/driver_app/data/repository/driverapp_onboarding_repo.dart';
import 'package:flutter_ui_kit/rideshare/data/model/onboarding_model.dart';

class DriveAppOnBoardingProvider with ChangeNotifier {
  final DriverAppOnBoardingRepo driverAppOnBoardingRepo;

  DriveAppOnBoardingProvider({this.driverAppOnBoardingRepo});

  List<OnBoardingModel> _onBoardingList = [];

  List<OnBoardingModel> get onBoardingList => _onBoardingList;

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  changeOnboardingIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void initializeBoardingList() {
    if (_onBoardingList.length == 0) {
      _onBoardingList.clear();
      _onBoardingList = driverAppOnBoardingRepo.getOnboardingList;
      notifyListeners();
    }
  }
}
