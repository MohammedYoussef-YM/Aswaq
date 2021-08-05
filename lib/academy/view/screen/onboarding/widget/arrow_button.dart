import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';

class ArrowButton extends StatelessWidget {
  final Function onTap;
  final Color bgColor;
  final IconData icon;
  ArrowButton({@required this.onTap, @required this.icon, @required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40, width: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: bgColor,
        ),
        child: Icon(icon, color: AcademyColorResources.COLOR_WHITE, size: 40),
      ),
    );
  }
}
