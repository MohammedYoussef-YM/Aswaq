import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/driver_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/driver_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/driver_app/utility/strings.dart';
import 'package:flutter_ui_kit/driver_app/view/view/auth/create_account_screen.dart';
import 'package:flutter_ui_kit/driver_app/view/view/auth/driverapp_signin_screen.dart';
import 'package:flutter_ui_kit/driver_app/view/widget/custom_button.dart';
import 'package:flutter_ui_kit/rideshare/utility/images.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 35),
                Container(
                  margin: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.hello_nice_to_meet_you,
                        style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_LIGHT),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      Text(
                        Strings.get_a_new_experience,
                        style: poppinsBold.copyWith(color: ColorResources.COLOR_GRAY_DEEP, fontSize: 24),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 70),
                Image.asset(
                  Images.welcome_back,
                  fit: BoxFit.scaleDown,
                  width: double.infinity,)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT, bottom: 30),
            child: Column(
              children: [
                CustomButton(
                  btnTxt: Strings.login,
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => DriverAppSignInScreen()));
                  },
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => DriverCreateAccountScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.or,
                        style: poppinsRegular,
                      ),
                      Text(Strings.create_an_account, style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY)),
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
