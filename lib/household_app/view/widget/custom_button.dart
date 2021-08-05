import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String btnTxt;
  final bool isPinkBackground;
  final String imageUrl;
  final bool isIcon;

  CustomButton({this.onTap, @required this.btnTxt, this.isPinkBackground = false, this.imageUrl, this.isIcon = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
          color: isPinkBackground ? HouseHoldColorResources.COLOR_CRANBERRY : HouseHoldColorResources.COLOR_PRIMARY,
          borderRadius: BorderRadius.circular(10)),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(0),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isIcon
                ? Image.asset(
                    imageUrl,
                    color: HouseHoldColorResources.COLOR_WHITE,
                    fit: BoxFit.scaleDown,
                  )
                : SizedBox.shrink(),
            isIcon
                ? SizedBox(
                    width: 17,
                  )
                : SizedBox.shrink(),
            Text(btnTxt, style: manropeRegular.copyWith(color: HouseHoldColorResources.COLOR_WHITE, fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),
          ],
        ),
      ),
    );
  }
}
