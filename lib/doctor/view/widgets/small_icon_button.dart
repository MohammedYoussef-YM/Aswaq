import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';

class SmallIconButton extends StatelessWidget {

  final IconData iconData;
  final Function myFunction;
  SmallIconButton({@required this.iconData, this.myFunction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
        margin: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
        decoration: BoxDecoration(
          color: ColorResources.COLOR_WHITE,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [BoxShadow(color: Colors.grey[200], spreadRadius: 1, blurRadius: 10)],
        ),
        child: Icon(iconData, color: ColorResources.COLOR_PRIMARY),
      ),
      onTap: myFunction,
    );
  }
}