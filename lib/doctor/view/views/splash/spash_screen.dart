import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/view/views/onBorad/doctor_onboarding_screen.dart';

class DoctorSplashScreen extends StatefulWidget {
  @override
  _DoctorSplashScreenState createState() => _DoctorSplashScreenState();
}

class _DoctorSplashScreenState extends State<DoctorSplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) =>
            DoctorOnBoardingScreen(indicatorColor: ColorResources.COLOR_GREY, selectedIndicatorColor: ColorResources.COLOR_PRIMARY))));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      body: Center(
        child: Image.asset('assets/doctor/images/splash_logo.png',
        height: 150,
        width: 160,),
      ),
    );
  }
}
