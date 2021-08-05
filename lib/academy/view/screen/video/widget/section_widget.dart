import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  SectionWidget({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AcademyDimensions.PADDING_SIZE_EXTRA_SMALL),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title, style: robotoMedium.copyWith(fontSize: AcademyDimensions.FONT_SIZE_SMALL)),
        Icon(Icons.arrow_circle_down),
      ]),
    );
  }
}
