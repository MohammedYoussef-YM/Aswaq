import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/dating_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/dating_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/strings.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/auth/login_screen.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/auth/signup_screen.dart';
import 'package:flutter_ui_kit/dating_app/view/widget/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(53),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/dating_app/icon/soul_mate.png'),
                SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                Text(
                  Strings.soul_mate,
                  style: robotoBold.copyWith(color: ColorResources.COLOR_PRIMARY, fontSize: 30),
                ),
                SizedBox(height: 45),
                Text(
                  Strings.match_and_chat_with_perople_you,
                  textAlign: TextAlign.center,
                  style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),
                ),
                SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  child: CustomButton(btnTxt: Strings.login,onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DatingLoginScreen()));
                  },),
                ),
                Padding(
                  padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  child: CustomButton(
                    btnTxt: Strings.sign_up,
                    isWhiteBackground: true,
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DatingSignUpScreen()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
