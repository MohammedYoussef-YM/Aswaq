import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/images.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/view/screen/auth/log_in_screen.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';

class AcademySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AcademyLogInScreen()));
    });

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AcademyColorResources.COLOR_PRIMARY, AcademyColorResources.PRIMARY_LIGHT],
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(Images.logo, width: 150),
          Text(AcademyStrings.e_academy, style: robotoBold.copyWith(
            fontSize: 40, color: AcademyColorResources.COLOR_WHITE,
            fontStyle: FontStyle.italic, decoration: TextDecoration.none,
          )),
        ]),
      ),
    );
  }
}
