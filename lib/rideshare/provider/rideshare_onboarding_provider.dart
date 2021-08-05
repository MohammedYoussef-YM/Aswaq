import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/rideshare/data/model/onboarding_model.dart';
import 'package:flutter_ui_kit/rideshare/data/repository/rideshare_onboarding_repo.dart';

class RideShareOnBoardingProvider with ChangeNotifier {
  final RideShareOnBoardingRepo rideShareOnBoardingRepo;

  RideShareOnBoardingProvider({this.rideShareOnBoardingRepo});

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
      _onBoardingList = rideShareOnBoardingRepo.getOnboardingList;
      notifyListeners();
    }
  }
}
