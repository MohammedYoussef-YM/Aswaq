import 'package:flutter_ui_kit/doctor/data/model/onboarding_model.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';

class OnBoardingRepo{

  List<OnBoardingModel> getOnboardingList=[
    OnBoardingModel(
      imageUrl: 'assets/doctor/Image/OB1.png',
      title: Strings.THOUSANDS_OF_DOCTOR,
      description: Strings.DESCRIPTION_FIRST_PAGE,
    ),
    OnBoardingModel(
      imageUrl: 'assets/doctor/Image/OB2.png',
      title: Strings.LIVE_TALK,
      description: Strings.DESCRIPTION_SECOND_PAGE,
    ),
    OnBoardingModel(
      imageUrl: 'assets/doctor/Image/OB3.png',
      title: Strings.GET_APPOINTMENT,
      description: Strings.DESCRIPTION_THIRD_PAGE,
    ),
  ];

}