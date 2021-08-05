import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';

class RatingBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.star, color: ColorResources.COLOR_YELLOW_SEA),
        SizedBox(width: 10),
        Icon(Icons.star, color: ColorResources.COLOR_YELLOW_SEA),
        SizedBox(width: 10),
        Icon(Icons.star, color: ColorResources.COLOR_YELLOW_SEA),
        SizedBox(width: 10),
        Icon(Icons.star, color: ColorResources.COLOR_YELLOW_SEA),
        SizedBox(width: 10),
        Icon(Icons.star, color: ColorResources.COLOR_YELLOW_SEA),
      ],
    );
  }
}
