import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/driver_app/utility/colorResources.dart';

// ignore: must_be_immutable
class RatingBar extends StatelessWidget {
  final int ratingNumber;

  RatingBar({this.ratingNumber = 5});

  bool firstRatingEnable, secondRatingEnable, thiredRatingEnable, fourRatingEnable, fiveRatingEnable;

  @override
  Widget build(BuildContext context) {
    if (ratingNumber == 1) {
      firstRatingEnable = true;
      secondRatingEnable = false;
      thiredRatingEnable = false;
      fourRatingEnable = false;
      fiveRatingEnable = false;
    } else if (ratingNumber == 2) {
      firstRatingEnable = true;
      secondRatingEnable = true;
      thiredRatingEnable = false;
      fourRatingEnable = false;
      fiveRatingEnable = false;
    } else if (ratingNumber == 3) {
      firstRatingEnable = true;
      secondRatingEnable = true;
      thiredRatingEnable = true;
      fourRatingEnable = false;
      fiveRatingEnable = false;
    } else if (ratingNumber == 4) {
      firstRatingEnable = true;
      secondRatingEnable = true;
      thiredRatingEnable = true;
      fourRatingEnable = true;
      fiveRatingEnable = false;
    } else if (ratingNumber == 5) {
      firstRatingEnable = true;
      secondRatingEnable = true;
      thiredRatingEnable = true;
      fourRatingEnable = true;
      fiveRatingEnable = true;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.star,
          color: firstRatingEnable ? ColorResources.COLOR_YELLOW : AcademyColorResources.BORDER_COLOR,
          size: 17,
        ),
        Icon(
          Icons.star,
          color: secondRatingEnable ? ColorResources.COLOR_YELLOW : AcademyColorResources.BORDER_COLOR,
          size: 17,
        ),
        Icon(
          Icons.star,
          color: thiredRatingEnable ? ColorResources.COLOR_YELLOW : AcademyColorResources.BORDER_COLOR,
          size: 17,
        ),
        Icon(
          Icons.star,
          color: fourRatingEnable ? ColorResources.COLOR_YELLOW : AcademyColorResources.BORDER_COLOR,
          size: 17,
        ),
        Icon(
          Icons.star,
          color: fiveRatingEnable ? ColorResources.COLOR_YELLOW : AcademyColorResources.BORDER_COLOR,
          size: 17,
        ),
      ],
    );
  }
}
