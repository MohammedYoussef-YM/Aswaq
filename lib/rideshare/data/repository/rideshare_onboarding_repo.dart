import 'package:flutter_ui_kit/rideshare/data/model/onboarding_model.dart';
import 'package:flutter_ui_kit/rideshare/utility/images.dart';
import 'package:flutter_ui_kit/rideshare/utility/strings.dart';

class RideShareOnBoardingRepo {
  List<OnBoardingModel> getOnboardingList = [
    OnBoardingModel(
      imageUrl: Images.onBoarding_one,
      title: Strings.set_your_destination,
      description: Strings.lorem__ut,
    ),
    OnBoardingModel(
      imageUrl: Images.onBoarding_two,
      title: Strings.book_a_ride,
      description: Strings.lorem__ut,
    ),
    OnBoardingModel(
      imageUrl: Images.onBoarding_three,
      title: Strings.enjoy_the_trip,
      description: Strings.lorem__ut,
    ),
  ];
}