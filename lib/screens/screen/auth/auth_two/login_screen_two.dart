import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screens/provider/auth_provider.dart';
import 'package:flutter_ui_kit/screens/utility/colorResources.dart';
import 'package:flutter_ui_kit/screens/utility/dimensions.dart';
import 'package:flutter_ui_kit/screens/utility/strings.dart';
import 'package:flutter_ui_kit/screens/utility/style.dart';
import 'package:flutter_ui_kit/screens/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginScreenTwo extends StatelessWidget {
  FocusNode _userNameFocus = FocusNode();
  FocusNode _nameNameFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  FocusNode _confirmPasswordFocus = FocusNode();

  Widget _selectAuthButton({String title, Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: ColorResources.COLOR_PRIMARY_DARK,
        alignment: Alignment.center,
        height: 52,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: ibmSemiBold.copyWith(color: ColorResources.COLOR_WHITE, fontSize: Dimensions.FONT_SIZE_LARGE),
            ),
            SizedBox(
              width: Dimensions.PADDING_SIZE_DEFAULT,
            ),
            Icon(
              Icons.arrow_forward,
              color: ColorResources.COLOR_WHITE,
              size: 18,
            )
          ],
        ),
      ),
    );
  }

  Widget _unSelectAuthButton({String title, String message, Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 52,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message ?? '',
              style: ibmRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
            ),
            Text(
              title,
              style: ibmSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: ColorResources.COLOR_PRIMARY_DARK),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      body: Consumer<ScreensAuthProvider>(
        builder: (context, authProvider, child) => Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 300,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/screen/images/login_header_back.png',
                          fit: BoxFit.fill,
                          height: 300,
                        ),
                        Positioned(
                          left: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                          bottom: 110,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_LARGE),
                            child: Image.asset(
                              'assets/logo.jpg',
                              fit: BoxFit.fill,
                              //color: ColorResources.COLOR_WHITE,
                              height: 100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                  Padding(
                    padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                    child: Text(
                      authProvider.isLoginTwoWidget ? Strings.login : Strings.sign_up,
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
                  SizedBox(
                    height: Dimensions.PADDING_SIZE_LARGE,
                  ),
                  Container(
                    //height: 104,
                    width: double.infinity,
                    margin: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                    child: authProvider.isLoginTwoWidget
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/screen/icon/user_name.png'),
                                  Expanded(
                                    child: CustomTextField(
                                      isBorder: false,
                                      hintText: Strings.username,
                                      focusNode: _userNameFocus,
                                      nextFocus: _passwordFocus,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              Row(
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
                            ],
                          )
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/screen/icon/user_name.png'),
                                  Expanded(
                                    child: CustomTextField(
                                      isBorder: false,
                                      hintText: Strings.name,
                                      focusNode: _nameNameFocus,
                                      nextFocus: _userNameFocus,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/screen/icon/email.png'),
                                  Expanded(
                                    child: CustomTextField(
                                      isBorder: false,
                                      hintText: Strings.email_address,
                                      focusNode: _userNameFocus,
                                      inputType: TextInputType.emailAddress,
                                      nextFocus: _passwordFocus,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              Row(
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
                              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              Row(
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
                            ],
                          ),
                  ),
                  authProvider.isLoginTwoWidget
                      ? Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: Dimensions.PADDING_SIZE_DEFAULT),
                          child: Text(
                            Strings.forgot_password,
                            style: ibmRegular.copyWith(color: ColorResources.COLOR_PRIMARY_DARK, fontSize: Dimensions.FONT_SIZE_SMALL),
                          ),
                        )
                      : SizedBox.shrink(),
                  SizedBox(height: 40),
                ],
              ),
            ),
            Container(
              height: 52,
              decoration: BoxDecoration(border: Border.all(color: ColorResources.COLOR_GRAY_CHATEAU)),
              child: Row(
                children: [
                  Expanded(
                      child: _unSelectAuthButton(
                          title: authProvider.isLoginTwoWidget ? Strings.sign_up : Strings.login,
                          message: authProvider.isLoginTwoWidget ? Strings.dont_have_an_account : Strings.already_have_an_account,
                          onTap: () {
                            authProvider.changeLoginTwoWidgetCondition(false);
                          })),
                  Expanded(
                      child: _selectAuthButton(
                          title: authProvider.isLoginTwoWidget ? Strings.login : Strings.sign_up,
                          onTap: () {
                            authProvider.changeLoginTwoWidgetCondition(true);
                          })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
