import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';

class SocialMediaButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  SocialMediaButton({@required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_EXTRA_SMALL),
        margin: EdgeInsets.only(right: AcademyDimensions.PADDING_SIZE_SMALL),
        decoration: BoxDecoration(
          color: AcademyColorResources.COLOR_WHITE,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AcademyColorResources.COLOR_BLACK, size: 20),
      ),
    );
  }
}
