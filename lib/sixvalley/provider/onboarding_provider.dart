import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/onboarding_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/repository/onboarding_repo.dart';

class SixOnBoardingProvider with ChangeNotifier {
  final SixOnBoardingRepo onboardingRepo;

  SixOnBoardingProvider({@required this.onboardingRepo});

  List<OnboardingModel> _onBoardingList = [];
  List<OnboardingModel> get onBoardingList => _onBoardingList;

  int _selectedIndex = 0;
  int get selectedIndex =>_selectedIndex;

  changeSelectIndex(int index){
    _selectedIndex=index;
    notifyListeners();
  }

  void initBoardingList() async {
    _onBoardingList.clear();
    _onBoardingList.addAll(onboardingRepo.getOnBoardingList());
    notifyListeners();
  }
}
