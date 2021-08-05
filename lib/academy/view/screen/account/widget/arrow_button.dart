import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';

class ArrowButton extends StatelessWidget {
  final String title;
  final Function onTap;
  ArrowButton({@required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AcademyDimensions.PADDING_SIZE_SMALL),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(title, style: robotoMedium.copyWith(fontSize: AcademyDimensions.FONT_SIZE_LARGE, color: AcademyColorResources.COLOR_GREY)),
          Icon(Icons.arrow_forward_ios_rounded, color: AcademyColorResources.COLOR_GREY, size: 20),
        ]),
      ),
    );
  }
}
