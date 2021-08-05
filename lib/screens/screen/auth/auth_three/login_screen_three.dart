import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screens/provider/auth_provider.dart';
import 'package:flutter_ui_kit/screens/utility/colorResources.dart';
import 'package:flutter_ui_kit/screens/utility/dimensions.dart';
import 'package:flutter_ui_kit/screens/utility/strings.dart';
import 'package:flutter_ui_kit/screens/utility/style.dart';
import 'package:flutter_ui_kit/screens/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginScreenThree extends StatelessWidget {
  FocusNode _emailFocus = FocusNode();
  FocusNode _nameFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  FocusNode _confirmPasswordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 30),
                Container(
                  width: 130,
                  height: 130,
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    'assets/logo.jpg',
                    fit: BoxFit.fill,
                    width: 120,
                    height: 120,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  child: Text(
                    Strings.welcome,
                    style: ibmBold.copyWith(color: ColorResources.COLOR_NERO, fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT),
                  child: Text(
                    Strings.lorem__tempor,
                    style: ibmBold.copyWith(color: ColorResources.COLOR_NERO, fontSize: Dimensions.FONT_SIZE_SMALL),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  child: Consumer<ScreensAuthProvider>(
                    builder: (context, authProvider, child) => Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.only(right: Dimensions.PADDING_SIZE_DEFAULT),
                          ),
                            onPressed: () {
                              authProvider.changeLoginThreeWidgetCondition(true);
                            },
                            child: Text(
                              Strings.login,
                              style: ibmSemiBold.copyWith(
                                  color: authProvider.isLoginThreeWidget ? ColorResources.COLOR_BITTERSWEET : ColorResources.COLOR_GRAY_CHATEAU,
                                  fontSize: Dimensions.FONT_SIZE_LARGE),
                            )),
                        TextButton(
                            onPressed: () {
                              authProvider.changeLoginThreeWidgetCondition(false);
                            },
                            child: Text(
                              Strings.sign_up,
                              style: ibmSemiBold.copyWith(
                                  color: authProvider.isLoginThreeWidget ? ColorResources.COLOR_GRAY_CHATEAU : ColorResources.COLOR_BITTERSWEET,
                                  fontSize: Dimensions.FONT_SIZE_LARGE),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.PADDING_SIZE_LARGE,
                ),
                Consumer<ScreensAuthProvider>(
                  builder: (context, authProvider, child) => authProvider.isLoginThreeWidget
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: Offset(0, 1), // changes position of shadow
                                        ),
                                      ],
                                      color: ColorResources.COLOR_WHITE,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                        topRight: Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                      ),
                                    ),
                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(width: 4.0, color: ColorResources.COLOR_BITTERSWEET),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset('assets/screen/icon/user_name.png'),
                                          Expanded(
                                            child: CustomTextField(
                                              isBorder: false,
                                              hintText: Strings.username,
                                              focusNode: _emailFocus,
                                              nextFocus: _passwordFocus,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: Offset(0, 1), // changes position of shadow
                                        ),
                                      ],
                                      color: ColorResources.COLOR_WHITE,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                        topRight: Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                      ),
                                    ),
                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(width: 4.0, color: ColorResources.COLOR_BITTERSWEET),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset('assets/screen/icon/password.png'),
                                          Expanded(
                                            child: CustomTextField(
                                              isBorder: false,
                                              hintText: Strings.password,
                                              isPassword: true,
                                              focusNode: _passwordFocus,
                                              inputAction: TextInputAction.done,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT),
                              child: Text(
                                Strings.forgot_password,
                                style: ibmRegular.copyWith(color: ColorResources.COLOR_BITTERSWEET, fontSize: Dimensions.FONT_SIZE_SMALL),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: Offset(0, 1), // changes position of shadow
                                        ),
                                      ],
                                      color: ColorResources.COLOR_WHITE,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                        topRight: Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                      ),
                                    ),
                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(width: 4.0, color: ColorResources.COLOR_BITTERSWEET),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset('assets/screen/icon/user_name.png'),
                                          Expanded(
                                            child: CustomTextField(
                                              isBorder: false,
                                              hintText: Strings.name,
                                              focusNode: _nameFocus,
                                              nextFocus: _emailFocus,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: Offset(0, 1), // changes position of shadow
                                        ),
                                      ],
                                      color: ColorResources.COLOR_WHITE,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                        topRight: Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                      ),
                                    ),
                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(width: 4.0, color: ColorResources.COLOR_BITTERSWEET),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset('assets/screen/icon/email.png'),
                                          Expanded(
                                            child: CustomTextField(
                                              isBorder: false,
                                              hintText: Strings.email_address,
                                              focusNode: _emailFocus,
                                              inputType: TextInputType.emailAddress,
                                              nextFocus: _passwordFocus,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: Offset(0, 1), // changes position of shadow
                                        ),
                                      ],
                                      color: ColorResources.COLOR_WHITE,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                        topRight: Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                      ),
                                    ),
                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(width: 4.0, color: ColorResources.COLOR_BITTERSWEET),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset('assets/screen/icon/password.png'),
                                          Expanded(
                                            child: CustomTextField(
                                              isBorder: false,
                                              hintText: Strings.password,
                                              isPassword: true,
                                              focusNode: _passwordFocus,
                                              nextFocus: _confirmPasswordFocus,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: Offset(0, 1), // changes position of shadow
                                        ),
                                      ],
                                      color: ColorResources.COLOR_WHITE,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                        topRight: Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                        bottomLeft: Radius.circular(8.0),
                                        bottomRight: Radius.circular(8.0),
                                      ),
                                    ),
                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(width: 4.0, color: ColorResources.COLOR_BITTERSWEET),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset('assets/screen/icon/password.png'),
                                          Expanded(
                                            child: CustomTextField(
                                              isBorder: false,
                                              hintText: Strings.confirm_password,
                                              isPassword: true,
                                              focusNode: _confirmPasswordFocus,
                                              inputAction: TextInputAction.done,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
                SizedBox(
                  height: Dimensions.PADDING_SIZE_SMALL,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: Dimensions.PADDING_SIZE_DEFAULT),
                  child: CircleAvatar(
                    backgroundColor: ColorResources.COLOR_BITTERSWEET,
                    radius: 25,
                    child: Icon(
                      Icons.arrow_forward,
                      color: ColorResources.COLOR_WHITE,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Consumer<ScreensAuthProvider>(
            builder: (context, authProvider, child) => Padding(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              child: RichText(
                text: TextSpan(
                  style: ibmRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                  children: <TextSpan>[
                    TextSpan(text: authProvider.isLoginThreeWidget ? Strings.dont_have_an_account : Strings.by_siging_up_you),
                    TextSpan(
                        text: authProvider.isLoginThreeWidget ? Strings.sign_up : Strings.terms_and_condition,
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
