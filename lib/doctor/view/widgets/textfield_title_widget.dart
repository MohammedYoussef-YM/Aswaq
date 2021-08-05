import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';

class TextFieldTitleWidget extends StatelessWidget {
  final String title;
  final String imageUrl;

  TextFieldTitleWidget({this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imageUrl,
          width: 15,
          height: 15,
          //color: ColorResources.COLOR_GREY,
          fit: BoxFit.scaleDown,
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: khulaSemiBold.copyWith(
              color: ColorResources.COLOR_GREY,
            ),
          ),
        ),
      ],
    );
  }
}
