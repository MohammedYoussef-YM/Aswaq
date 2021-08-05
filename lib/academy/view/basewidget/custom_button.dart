import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  CustomButton({@required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10),
        primary:  AcademyColorResources.COLOR_WHITE,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(text, style: robotoBold.copyWith(fontSize: 20, color: AcademyColorResources.COLOR_PRIMARY)),
    );
  }
}
