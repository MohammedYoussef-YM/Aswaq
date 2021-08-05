import 'package:flutter_ui_kit/grocery/data/models/onboarding_model.dart';
import 'package:flutter_ui_kit/grocery/utility/images.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';

class OnboardingRepo {
  List<OnBoardingModel> getOnboardingList = [
    OnBoardingModel(
      imageUrl: Images.onBoard_one,
      title: Strings.online_shopping,
      subTitle: Strings.you_can_shopping_anytime_anywhere_that,
    ),
    OnBoardingModel(
      imageUrl: Images.onBoard_two,
      title: Strings.detailed_recipes,
      subTitle: Strings.if_you_are_wandering_what_to_cook_today,
    ),
    OnBoardingModel(
      imageUrl: Images.onBoard_three,
      title: Strings.ship_at_your_home,
      subTitle: Strings.the_product_you_order_will_be_delivered,
    ),
  ];
}
