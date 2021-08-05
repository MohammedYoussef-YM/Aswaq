import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screens/screen/auth/auth_one/signup_screen_one.dart';
import 'package:flutter_ui_kit/screens/utility/colorResources.dart';
import 'package:flutter_ui_kit/screens/utility/dimensions.dart';
import 'package:flutter_ui_kit/screens/utility/strings.dart';
import 'package:flutter_ui_kit/screens/utility/style.dart';
import 'package:flutter_ui_kit/screens/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class LoginScreenOne extends StatelessWidget {
  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 300,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/logo.jpg',
                    fit: BoxFit.fill,
                    width: 200,
                    height: 200,
                  ),
                ),
                Container(
                  height: 104,
                  width: double.infinity,
                  margin: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), border: Border.all(color: ColorResources.COLOR_GRAY_CHATEAU)),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: Dimensions.PADDING_SIZE_SMALL, top: Dimensions.PADDING_SIZE_DEFAULT, bottom: Dimensions.PADDING_SIZE_LARGE),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/screen/icon/email.png'),
                            Image.asset('assets/screen/icon/password.png'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextField(
                              isBorder: false,
                              hintText: Strings.email_address,
                              focusNode: _emailFocus,
                              nextFocus: _passwordFocus,
                              inputType: TextInputType.emailAddress,
                            ),
                            Container(
                              color: ColorResources.COLOR_GRAY_CHATEAU,
                              height: 1,
                              margin: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT),
                            ),
                            CustomTextField(
                              isBorder: false,
                              hintText: Strings.password,
                              isPassword: true,
                              focusNode: _passwordFocus,
                              inputAction: TextInputAction.done,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                    child: Text(
                  Strings.forgot_password,
                  style: ibmRegular.copyWith(color: ColorResources.COLOR_PRIMARY_DARK, fontSize: Dimensions.FONT_SIZE_SMALL),
                )),
                Container(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  margin: EdgeInsets.only(top: 50),
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 45,
                          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ColorResources.COLOR_MARINER, borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL)),
                          child: Image.asset(
                            'assets/doctor/Icon/facebook.png',
                            color: ColorResources.COLOR_WHITE,
                          ),
                        ),
                      )),
                      SizedBox(width: Dimensions.PADDING_SIZE_LARGE),
                      Expanded(
                          child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 45,
                          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ColorResources.COLOR_PRIMARY, borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL)),
                          child: Text(
                            Strings.login,
                            style: ibmBold.copyWith(color: ColorResources.COLOR_WHITE, fontSize: Dimensions.FONT_SIZE_LARGE),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreenOne()));
            },
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              child: RichText(
                text: TextSpan(
                  style: ibmRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                  children: <TextSpan>[
                    TextSpan(text: Strings.already_have_an_account),
                    TextSpan(
                        text: Strings.sign_up,
                        style: ibmRegular.copyWith(color: ColorResources.COLOR_PRIMARY_DARK, decoration: TextDecoration.underline)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
