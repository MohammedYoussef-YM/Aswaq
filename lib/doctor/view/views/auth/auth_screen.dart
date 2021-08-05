import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/auth/doctor_signin_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/auth/doctor_signup_screen.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/button/custom_button.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/doctor/images/splash_logo.png',
                height: 110,
                width: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 60,
                  bottom: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                ),
                child: Text(
                  Strings.CREATE_A_FREE_ACCOUNT,
                  style: khulaSemiBold.copyWith(
                    color: ColorResources.COLOR_GREY,
                    fontSize: Dimensions.FONT_SIZE_LARGE,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.all(15),
                child: CustomButton(btnTxt: Strings.CREATE_AN_ACCOUNT,onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => DoctorSignUpScreen()));
                },),
              ),
              Container(
                margin: EdgeInsets.only(left: 15,right: 15),
                child: CustomButton(btnTxt: Strings.SIGN_IN,
                  isWhiteBackground: true,
                  onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => DoctorSignInScreen()));
                },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
