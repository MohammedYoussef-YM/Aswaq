import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/wallet/utility/colorResources.dart';
import 'package:flutter_ui_kit/wallet/utility/strings.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';
import 'package:flutter_ui_kit/wallet/view/views/pixallet_onboarding_screen.dart';
import 'package:gradient_text/gradient_text.dart';

class SplashScreenWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2), () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => PixalletOnBoardingScreen())));
    return Scaffold(
      backgroundColor: ColorResources.COLOR_BACKGROUND,
      body: Center(
        child: GradientText(
          Strings.PIXALLET,
          gradient: LinearGradient(colors: [
            ColorResources.COLOR_ROYAL_BLUE,
            ColorResources.COLOR_ROYAL_BLUE,
            ColorResources.COLOR_DARK_ORCHID,
          ]),
          style: poppinsBold.copyWith(fontSize: 50),
        ),
      ),
    );
  }
}
