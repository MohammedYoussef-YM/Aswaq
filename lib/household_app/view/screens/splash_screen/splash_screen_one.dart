import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/images.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';
import 'package:flutter_ui_kit/household_app/view/screens/splash_screen/splash_screen_two.dart';
import 'package:flutter_ui_kit/household_app/view/widget/custom_button.dart';

class HouseHoldSplashScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HouseHoldColorResources.COLOR_PRIMARY,
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(
                  left: HouseHoldDimensions.PADDING_SIZE_EXTRA_LARGE,
                  right: HouseHoldDimensions.PADDING_SIZE_EXTRA_LARGE,
                  bottom: HouseHoldDimensions.PADDING_SIZE_EXTRA_LARGE,
                ),
                child: Text(
                  Strings.get_connection_with_your_pair,
                  textAlign: TextAlign.center,
                  style: manropeSemiBold.copyWith(color: HouseHoldColorResources.COLOR_WHITE, fontSize: 34),
                ),
              )),
          Expanded(
              child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(
                    left: HouseHoldDimensions.PADDING_SIZE_EXTRA_LARGE,
                    right: HouseHoldDimensions.PADDING_SIZE_EXTRA_LARGE,
                    bottom: HouseHoldDimensions.PADDING_SIZE_EXTRA_LARGE,
                  ),
                  child: Text(
                    Strings.lorem__ips,
                    textAlign: TextAlign.center,
                    style: manropeRegular.copyWith(
                      color: HouseHoldColorResources.COLOR_WHITE,
                      fontSize: HouseHoldDimensions.FONT_SIZE_LARGE,
                    ),
                  ))),
          Expanded(
              flex: 3,
              child:Image.asset(
                Images.onboarding_one,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,),
          ),
          Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  left: HouseHoldDimensions.PADDING_SIZE_EXTRA_LARGE,
                  right: HouseHoldDimensions.PADDING_SIZE_EXTRA_LARGE,
                  top: 30,
            ),
                child: CustomButton(
                  btnTxt: Strings.get_started,
                  isPinkBackground: true,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => SplashScreenTwo()));
              },
            ),
          )),
          Expanded(child: SizedBox.shrink()),
        ],
      ),
    );
  }
}
