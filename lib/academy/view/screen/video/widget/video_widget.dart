import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';

class VideoWidget extends StatelessWidget {
  final String counter;
  final String title;
  final String description;
  VideoWidget({@required this.counter, @required this.title, @required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AcademyDimensions.PADDING_SIZE_EXTRA_SMALL),
      child: Row(children: [
        Text(counter, style: robotoMedium),
        Icon(Icons.check_circle, color: AcademyColorResources.PRIMARY_LIGHT, size: 20),
        SizedBox(width: 10),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //Icon(Icons.check_circle, color: AcademyColorResources.PRIMARY_LIGHT, size: 20),
            Text(title, style: robotoMedium),
            Text(description, style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_GREY, fontSize: AcademyDimensions.FONT_SIZE_SMALL)),
          ]),
        ),
        Icon(Icons.arrow_circle_down),
      ]),
    );
  }
}
