
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/data/model/onboarding_model.dart';
import 'package:flutter_ui_kit/doctor/data/repository/onboarding_repo.dart';

class OnBoardingProvider with ChangeNotifier{

  final OnBoardingRepo onBoardingRepo;
  OnBoardingProvider({@required this.onBoardingRepo});

  List<OnBoardingModel> getOnBoardingList() {
    return onBoardingRepo.getOnboardingList;
  }

}