import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/auth/doctor_signup_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/auth/widget/social_media_widget.dart';
import 'package:flutter_ui_kit/doctor/view/views/startup_screen.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/edittext/custom_pass_field.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/edittext/custom_text_field.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/textfield_title_widget.dart';

class DoctorSignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    FocusNode _emailNode = FocusNode();
    FocusNode _passNode = FocusNode();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Image.asset(
                'assets/doctor/images/splash_logo.png',
                height: 110,
                width: 100,
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: Dimensions.MARGIN_SIZE_DEFAULT,
                    right: Dimensions.MARGIN_SIZE_DEFAULT,
                    bottom: Dimensions.MARGIN_SIZE_DEFAULT),
                child: Stack(
                  children: [
                    TextFieldTitleWidget(
                      imageUrl: 'assets/doctor/Icon/email.png',
                      title: Strings.EMAIL,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Dimensions.MARGIN_SIZE_LARGE),
                      child: CustomTextField(
                        hintTxt: Strings.NIPON_MAIL,
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        focusNode: _emailNode,
                        nextNode: _passNode,
                        isEmail: true,
                        controller: _emailController,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: Dimensions.MARGIN_SIZE_DEFAULT,
                    right: Dimensions.MARGIN_SIZE_DEFAULT,
                    bottom: Dimensions.MARGIN_SIZE_DEFAULT),
                child: Stack(
                  children: [
                    TextFieldTitleWidget(
                      imageUrl: 'assets/doctor/Icon/security.png',
                      title: Strings.PASSWORD,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Dimensions.MARGIN_SIZE_LARGE),
                      child: CustomPassField(
                        hintTxt: Strings.ENTER_YOUR_PASSWORD,
                        textInputAction: TextInputAction.done,
                        focusNode: _passNode,
                        controller: _passwordController,
                      ),
                    ),
                  ],
                ),
              ),

              // for signin button
              SizedBox(
                height: 60,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: Dimensions.MARGIN_SIZE_DEFAULT,
                  right: Dimensions.MARGIN_SIZE_DEFAULT,
                ),
                child: CustomButton(
                  btnTxt: Strings.SIGN_IN,
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => StartupScreen()));
                  },
                ),
              ),

              TextButton(
                onPressed: () {
                  //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => AuthScreen()));
                },
                child: Text(
                  Strings.FORGET_PASSWORD,
                  style: khulaRegular.copyWith(
                    fontSize: Dimensions.FONT_SIZE_SMALL,
                    color: ColorResources.COLOR_GREY,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.all(Dimensions.MARGIN_SIZE_DEFAULT),
                child: Row(
                  children: [
                    Text(
                      Strings.OR_SIGN_IN,
                      style: khulaRegular.copyWith(
                        color: ColorResources.COLOR_GREY,
                        fontSize: Dimensions.FONT_SIZE_SMALL,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        width: 10,
                        color: ColorResources.COLOR_GAINSBORO,
                      ),
                    ),
                  ],
                ),
              ),

              // for or sign in
              Container(
                margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT),
                child: Row(
                  children: [
                    SocialMediaWidget(
                      imageUrl: 'assets/doctor/Icon/google.png',
                    ),
                    SocialMediaWidget(
                      imageUrl: 'assets/doctor/Icon/facebook.png',
                    ),
                    SocialMediaWidget(
                      imageUrl: 'assets/doctor/Icon/twitter.png',
                    ),
                    SocialMediaWidget(
                      imageUrl: 'assets/doctor/Icon/instagram.png',
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DoctorSignUpScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.HAVENT_ANY,
                      style: khulaSemiBold.copyWith(color: ColorResources.COLOR_GREY, fontSize: Dimensions.FONT_SIZE_SMALL),
                    ),
                    Text(
                      Strings.CREATE_AN_ACCOUNT,
                      style: khulaSemiBold.copyWith(color: ColorResources.COLOR_PRIMARY, fontSize: Dimensions.FONT_SIZE_SMALL),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
