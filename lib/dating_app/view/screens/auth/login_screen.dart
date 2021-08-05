import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/dating_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/dating_app/utility/dating_image.dart';
import 'package:flutter_ui_kit/dating_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/strings.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/auth/signup_screen.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/choice/choice_screen.dart';
import 'package:flutter_ui_kit/dating_app/view/widget/custom_button.dart';
import 'package:flutter_ui_kit/dating_app/view/widget/custom_text_field.dart';


// ignore: must_be_immutable
class DatingLoginScreen extends StatelessWidget {
  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
            Container(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.login,
                    style: robotoRegular.copyWith(color: ColorResources.COLOR_PRIMARY, fontSize: 24),
                  ),
                  Center(
                      child:Image.asset(DatingImages.signIn,height: 235,width: 270,fit: BoxFit.scaleDown)
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
            Container(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              child: Column(
                children: [
                  CustomTextField(
                    hintText: Strings.email_or_phone_number,
                    inputType: TextInputType.emailAddress,
                    focusNode: _emailFocus,
                    nextFocus: _passwordFocus,
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                  CustomTextField(
                    hintText: Strings.password,
                    isPassword: true,
                    focusNode: _passwordFocus,
                    inputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                    child: CustomButton(
                      btnTxt: Strings.login,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ChoiceScreen()));
                      },
                    ),
                  ),

                  SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                  Padding(
                    padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.create_new_account,
                          style: robotoLight,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DatingSignUpScreen()));
                          },
                          child: Text(
                            Strings.sign_up,
                            style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
