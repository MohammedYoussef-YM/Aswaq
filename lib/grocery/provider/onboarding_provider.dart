import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/grocery/data/models/onboarding_model.dart';
import 'package:flutter_ui_kit/grocery/data/repository/onboarding_repo.dart';

class OnboardingProvider with ChangeNotifier {
  final OnboardingRepo onboardingRepo;

  OnboardingProvider({this.onboardingRepo});

  List<OnBoardingModel> _onBoardingList = [];

  List<OnBoardingModel> get onBoardingList => _onBoardingList;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  changeOnboardingIndex(int index){
    _selectedIndex=index;
    notifyListeners();
  }

  void initializeBoardingList() {
    if (_onBoardingList.length == 0) {
      _onBoardingList.clear();
      _onBoardingList = onboardingRepo.getOnboardingList;
      notifyListeners();
    }
  }
}
