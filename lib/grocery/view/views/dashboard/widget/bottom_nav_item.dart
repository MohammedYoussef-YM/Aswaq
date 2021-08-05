import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  final bool isSelected;

  BottomNavItem({@required this.icon, @required this.title, this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, color: isSelected ? ColorResources.COLOR_PRIMARY : Colors.grey, size: 30),
        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
        Text(
          title,
          style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: isSelected ? ColorResources.COLOR_PRIMARY : Colors.grey),
        ),
      ]),
      onTap: onTap,
    );
  }
}
