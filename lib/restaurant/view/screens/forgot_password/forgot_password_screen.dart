import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/auth_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_app_bar.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_button.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_text_field.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/forgot_password/verification_screen.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();

    return Scaffold(
      appBar: CustomAppBar(title: getTranslated('forgot_password', context)),
      body: Consumer<RestAuthProvider>(
        builder: (context, auth, child) {
          return ListView(
            children: [
              SizedBox(height: 55),
              FadeInImage.assetNetwork(
                placeholder: Images.placeholder,
                image: Images.open_lock,
                width: 142,
                height: 142,),
              SizedBox(height: 40),
              Center(
                  child: Text(
                    getTranslated('please_enter_your_number_to', context),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2.copyWith(color: ColorResources.getHintColor(context)),
                  )),
              Padding(
                padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 80),
                    Text(
                      getTranslated('email', context),
                      style: Theme.of(context).textTheme.headline2.copyWith(color: ColorResources.getHintColor(context)),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    CustomTextField(
                      hintText: getTranslated('demo_gmail', context),
                      isShowBorder: true,
                      controller: _emailController,
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.done,
                    ),
                    SizedBox(height: 24),
                    CustomButton(
                      btnTxt: getTranslated('send', context),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => VerificationScreen(emailAddress: _emailController.text)));
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
