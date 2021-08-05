import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/screens/onBoard/food_onboarding_screen.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/utility/dimensions.dart';
import 'package:flutter_ui_kit/food/utility/strings.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => FoodOnBoardScreen()));
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/food/images/splash_background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Text(Strings.JOLLIBEE,
            style: TextStyle(
              color: ColorResources.COLOR_WHITE,
              fontSize: Dimensions.TEXT_SIZE_SPLASH,
              fontWeight: FontWeight.bold,
              fontFamily: 'GothamRounded'
            ),
          )
        ),
      ),
    );
  }
}
