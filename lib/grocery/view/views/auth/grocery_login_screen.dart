import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/views/auth/forgot_password_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/auth/grocery_signup_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/auth/widget/auth_header_widget.dart';
import 'package:flutter_ui_kit/grocery/view/views/choose_topics/choose_topics_screen.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_button.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class GroceryLoginScreen extends StatelessWidget {
  FocusNode _emailFocus=FocusNode();
  FocusNode _passwordFocus=FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                //physics: NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(height: 50),
                  Center(child: Image.asset('assets/logo.jpg', width: 100)),
                  authHeaderWidget(context: context, title: Strings.welcome_back, subTitle: Strings.sign_in_to_continue),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomTextField(
                      hintText: Strings.email_or_phone_number,
                      focusNode: _emailFocus,
                      nextFocus: _passwordFocus,
                      inputType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomTextField(
                      hintText: Strings.password,
                      isPassword: true,
                      focusNode: _passwordFocus,
                      inputType: TextInputType.visiblePassword,
                      inputAction: TextInputAction.done,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(Strings.forgot_password,
                                  textAlign: TextAlign.end, style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY))
                            ],
                          ))),
                  SizedBox(height: 15),
                  Container(
                      margin: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT,right: Dimensions.PADDING_SIZE_DEFAULT),
                      child: CustomButton(btnTxt: Strings.sign_in,onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChooseTopicsScreen()));
                      },)),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          color: Theme.of(context).hintColor.withOpacity(.1),
                          height: 1,
                        )),
                        Text(Strings.or),
                        Expanded(
                            child: Container(
                          color: Theme.of(context).hintColor.withOpacity(.1),
                          height: 1,
                        )),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorResources.COLOR_DODGER_BLUE,
                        child: Image.asset('assets/doctor/Icon/facebook.png', width: 20, height: 20, color: ColorResources.COLOR_WHITE),
                      ),
                      SizedBox(width: Dimensions.PADDING_SIZE_LARGE),
                      CircleAvatar(
                        backgroundColor: ColorResources.COLOR_TWITTER,
                        child: Image.asset('assets/doctor/Icon/twitter.png', width: 20, height: 20, color: ColorResources.COLOR_WHITE),
                      ),
                      SizedBox(width: Dimensions.PADDING_SIZE_LARGE),
                      CircleAvatar(
                        backgroundColor: ColorResources.COLOR_GOOGLE,
                        child: Image.asset('assets/doctor/Icon/google.png', width: 20, height: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GrocerySignUpScreen()));
              },
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.you_dont_have_an_account,
                      style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                    ),
                    Text(Strings.sign_up, style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
