import 'package:flutter_ui_kit/wallet/data/models/get_started_model.dart';
import 'package:flutter_ui_kit/wallet/utility/colorResources.dart';
import 'package:flutter_ui_kit/wallet/utility/strings.dart';

class OnboardingRepo {
  static List<GetStartedModel> getAllStartedData = [
    GetStartedModel(
      imageUrl: 'assets/wallet/Illustration/onboard-graphic.png',
      title: Strings.GET_STARTED,
    ),
    GetStartedModel(
      imageUrl: 'assets/wallet/Illustration/onboard-graphic.png',
      title: Strings.GET_STARTED,
    ),
    GetStartedModel(
      imageUrl: 'assets/wallet/Illustration/onboard-graphic.png',
      title: Strings.GET_STARTED,
    ),
  ];

  static List<GetStartedModel> getStartedModelDataSecondSlides = [
    GetStartedModel(
      secondSlideText: Strings.GET_STARTED_TEXT,
      color1: ColorResources.COLOR_ROYAL_BLUE,
      color2: ColorResources.COLOR_GRAY,
      color3: ColorResources.COLOR_GRAY,
    ),
    GetStartedModel(
      secondSlideText: Strings.GET_STARTED_TEXT,
      color1: ColorResources.COLOR_GRAY,
      color2: ColorResources.COLOR_ROYAL_BLUE,
      color3: ColorResources.COLOR_GRAY,
    ),
    GetStartedModel(
      secondSlideText: Strings.GET_STARTED_TEXT,
      color1: ColorResources.COLOR_GRAY,
      color2: ColorResources.COLOR_GRAY,
      color3: ColorResources.COLOR_ROYAL_BLUE,
    ),
  ];
}
