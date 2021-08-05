import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/rideshare/utility/colorResources.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String btnTxt;
  final bool isWhiteBackground;

  CustomButton({this.onTap, @required this.btnTxt, this.isWhiteBackground = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
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
          color: isWhiteBackground ? ColorResources.COLOR_WHITE : ColorResources.COLOR_PRIMARY,
          border: Border.all(color: isWhiteBackground ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_WHITE),
          borderRadius: BorderRadius.circular(10)),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(0),
        ),
        onPressed: onTap,
        child: Text(btnTxt, style: poppinsSemiBold.copyWith(color: isWhiteBackground ? ColorResources.COLOR_GRAY_DEEP : ColorResources.COLOR_WHITE)),
      ),
    );
  }
}
