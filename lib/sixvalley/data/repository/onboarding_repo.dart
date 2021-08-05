
import 'package:flutter_ui_kit/sixvalley/data/model/response/onboarding_model.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';

final String description='Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.';
class SixOnBoardingRepo{

  List<OnboardingModel> getOnBoardingList() {
    List<OnboardingModel> onboarding = [
      OnboardingModel(Images.onboarding_one,'BUY',description),
      OnboardingModel(Images.onboariding_two,'Check Out',description),
      OnboardingModel(Images.onboariding_three,'Fast Delivery',description),
    ];
    return onboarding;
  }
}