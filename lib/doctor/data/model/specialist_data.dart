import 'package:flutter_ui_kit/doctor/data/model/specialist.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';

class SpecialistData{
  static List<SpeciaList> speciaList=[
    SpeciaList(
      iconUrl: 'assets/doctor/Icon/cardiac.png',
      title: 'Cardio\nspecialist',
      backgroundColor: ColorResources.COLOR_PRIMARY
    ),
    SpeciaList(
      iconUrl: 'assets/doctor/Icon/heart.png',
      title: 'Heart\nspecialist',
      backgroundColor: ColorResources.COLOR_YELLOW_SEA
    ),
    SpeciaList(
      iconUrl: 'assets/doctor/Icon/dental.png',
      title: 'Dental\nspecialist',
      backgroundColor: ColorResources.COLOR_MOUNTAIN_MEADOW
    ),
    SpeciaList(
      iconUrl: 'assets/doctor/Icon/dental.png',
      title: 'Mental\nspecialist',
      backgroundColor: ColorResources.COLOR_MEDIUM_SLATE_BLUE
    ),
  ];

  static List<SpeciaList> getBannerList=[
    SpeciaList(
      bannerTitle: 'Cardio issues?',
      bannerDescription: 'Lorem ispum dolor sit amet, consetetur adipiscing elit, sed do eiusmod tempor ncididunt ut labore et dolore magna aliqua. ',
      price: 99
    ),
    SpeciaList(
        bannerTitle: 'Dental issues?',
        bannerDescription: 'Lorem ispum dolor sit amet, consetetur adipiscing elit, sed do eiusmod tempor ncididunt ut labore et dolore magna aliqua. ',
        price: 80
    ),
    SpeciaList(
        bannerTitle: 'Heart issues?',
        bannerDescription: 'Lorem ispum dolor sit amet, consetetur adipiscing elit, sed do eiusmod tempor ncididunt ut labore et dolore magna aliqua. ',
        price: 60
    ),
    SpeciaList(
        bannerTitle: 'Mental issues?',
        bannerDescription: 'Lorem ispum dolor sit amet, consetetur adipiscing elit, sed do eiusmod tempor ncididunt ut labore et dolore magna aliqua. ',
        price: 100
    ),
  ];
}