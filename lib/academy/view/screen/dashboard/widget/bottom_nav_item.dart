import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';

class BottomNavItem extends StatelessWidget {
  final IconData iconImageUrl;
  final String title;
  final Function onTap;
  final bool isSelected;

  BottomNavItem({@required this.iconImageUrl, @required this.title, this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(iconImageUrl, color: isSelected ? AcademyColorResources.COLOR_PRIMARY : Colors.grey),
        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
        Text(
          title,
          style: poppinsRegular.copyWith(
              fontSize: AcademyDimensions.FONT_SIZE_SMALL, color: isSelected ? AcademyColorResources.COLOR_PRIMARY : Colors.grey),
        ),
      ]),
      onTap: onTap,
    );
  }
}
