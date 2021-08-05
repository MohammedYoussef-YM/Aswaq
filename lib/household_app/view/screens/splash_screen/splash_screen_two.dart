import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/images.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';
import 'package:flutter_ui_kit/household_app/view/screens/auth/phone_login_screen.dart';
import 'package:flutter_ui_kit/household_app/view/widget/custom_button.dart';

class SplashScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HouseHoldColorResources.COLOR_WHITE,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: SizedBox.shrink()),
            Expanded(
                flex: 6,
                child: Image.asset(
                  Images.onboarding_two,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill)),
            Expanded(child: SizedBox.shrink()),
            Expanded(
                child: Text(
              Strings.welcome_to_h_service,
              style: manropeSemiBold.copyWith(color: HouseHoldColorResources.COLOR_CRANBERRY, fontSize: HouseHoldDimensions.FONT_SIZE_OVER_LARGE),
            )),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(
                left: HouseHoldDimensions.PADDING_SIZE_EXTRA_LARGE,
                right: HouseHoldDimensions.PADDING_SIZE_EXTRA_LARGE,
              ),
              child: Text(Strings.lorem__ips,
                  textAlign: TextAlign.center,
                  style: manropeLight.copyWith(color: HouseHoldColorResources.COLOR_CHARCOAL_HINT, fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),
            )),
            Expanded(child: SizedBox.shrink()),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(
                left: HouseHoldDimensions.PADDING_SIZE_EXTRA_LARGE,
                right: HouseHoldDimensions.PADDING_SIZE_EXTRA_LARGE,
              ),
              child: CustomButton(
                btnTxt: Strings.continue_with_phone,
                imageUrl: Images.phone_small,
                isIcon: true,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => PhoneLoginScreen()));
                },
              ),
            )),
            SizedBox(height: 18),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(
                left: HouseHoldDimensions.PADDING_SIZE_EXTRA_LARGE,
                right: HouseHoldDimensions.PADDING_SIZE_EXTRA_LARGE,
              ),
              child: CustomButton(
                btnTxt: Strings.continue_with_gmail,
                isPinkBackground: true,
                imageUrl: Images.gmail,
                isIcon: true,
                onTap: () {},
              ),
            )),
            Expanded(child: SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
