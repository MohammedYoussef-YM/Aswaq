import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/dating_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/dating_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';

class BottomNavItem extends StatelessWidget {
  final String iconImageUrl;
  final String title;
  final Function onTap;
  final bool isSelected;

  BottomNavItem({@required this.iconImageUrl, @required this.title, this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(height: 1, color: isSelected ? ColorResources.COLOR_DARK_ORANGE : Colors.transparent),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
        Image.asset(
          iconImageUrl,
          color: isSelected ? ColorResources.COLOR_DARK_ORANGE : ColorResources.COLOR_GREY_GONDOLA,
          width: 20,
          height: 20,
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
        Text(
          title,
          style: robotoMedium.copyWith(
              fontSize: Dimensions.FONT_SIZE_SMALL, color: isSelected ? ColorResources.COLOR_DARK_ORANGE : ColorResources.COLOR_GREY_GONDOLA),
        ),
      ]),
      onTap: onTap,
    );
  }
}
