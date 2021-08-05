import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/auth_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_button.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_text_field.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/auth/login_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/forgot_password/verification_screen.dart';
import 'package:provider/provider.dart';

class RestSignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
        child: Consumer<RestAuthProvider>(
          builder: (context, authProvider, child) => ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  Images.efood_bike_with_person,
                  height: MediaQuery.of(context).size.height / 4.5,
                  fit: BoxFit.scaleDown,)
              ),
              SizedBox(height: 20),
              Center(
                  child: Text(
                getTranslated('signup', context),
                style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 24, color: ColorResources.getGreyBunkerColor(context)),
              )),
              SizedBox(height: 35),
              Text(
                getTranslated('email', context),
                style: Theme.of(context).textTheme.headline2.copyWith(color: ColorResources.getHintColor(context)),
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              CustomTextField(
                hintText: getTranslated('demo_gmail', context),
                isShowBorder: true,
                inputAction: TextInputAction.done,
                inputType: TextInputType.emailAddress,
                controller: _emailController,
              ),

              // for continue button
              SizedBox(height: 12),
              CustomButton(
                      btnTxt: getTranslated('continue', context),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => VerificationScreen(emailAddress: _emailController.text, fromSignUp: true)));
                      },
                    ),

              // for create an account
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => RestLoginScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getTranslated('already_have_account', context),
                        style: Theme.of(context).textTheme.headline2.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.getGreyColor(context)),
                      ),
                      SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                      Text(
                        getTranslated('login', context),
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.getGreyBunkerColor(context)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
