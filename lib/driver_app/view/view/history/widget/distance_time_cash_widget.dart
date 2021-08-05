import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/rideshare/utility/colorResources.dart';

// ignore: must_be_immutable
class DistanceTimeCashWidget extends StatelessWidget {
  String title;
  String subtitle;
  bool isButtonLine;

  DistanceTimeCashWidget({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: poppinsBold.copyWith(color: ColorResources.COLOR_BLACK, fontSize: 15)),
        Text(subtitle, style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY, fontSize: 13)),
      ],
    );
  }
}
