import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/rideshare/utility/colorResources.dart';
import 'package:flutter_ui_kit/rideshare/utility/dimensions.dart';
import 'package:flutter_ui_kit/rideshare/utility/strings.dart';
import 'package:flutter_ui_kit/rideshare/view/view/onboarding/rideshare_onboarding_screen.dart';

class RideShareSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => RideShareOnboardingScreen()));
    });

    return Scaffold(
      backgroundColor: ColorResources.COLOR_PRIMARY_LIGHT,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/rideshare/images/ride_share_logo.png'),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
            Text(Strings.ride_share,style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_GRAY_DEEP,fontSize: 29),),
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
            Text(Strings.just_click_to_go_anywhere,style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_DEEP,fontSize: 17),)
          ],
        ),
      ),
    );
  }
}
