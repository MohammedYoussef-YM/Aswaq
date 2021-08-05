import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonExist;

  CustomAppBar({@required this.title, this.isBackButtonExist = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: rubikMedium.copyWith(fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE)),
      centerTitle: true,
      leading: isBackButtonExist
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios, color: RestaurantDeliveryBoyColorResources.COLOR_BLACK),
              onPressed: () => Navigator.pop(context),
            )
          : SizedBox(),
      backgroundColor: RestaurantDeliveryBoyColorResources.COLOR_WHITE,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 50);
}
