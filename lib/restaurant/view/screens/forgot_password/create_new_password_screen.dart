import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/auth_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_app_bar.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_button.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_snackbar.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_text_field.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  final String resetToken;
  final String email;
  CreateNewPasswordScreen({@required this.resetToken, @required this.email});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController = TextEditingController();
    final FocusNode _passwordFocus = FocusNode();
    final FocusNode _confirmPasswordFocus = FocusNode();

    return Scaffold(
      appBar: CustomAppBar(title: getTranslated('create_new_password', context)),
      body: Consumer<RestAuthProvider>(
        builder: (context, auth, child) {
          return ListView(
            physics: BouncingScrollPhysics(),
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
                    getTranslated('enter_password_to_create', context),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2.copyWith(color: ColorResources.getHintColor(context)),
                  )),
              Padding(
                padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // for password section

                    SizedBox(height: 60),
                    Text(
                      getTranslated('new_password', context),
                      style: Theme.of(context).textTheme.headline2.copyWith(color: ColorResources.getHintColor(context)),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    CustomTextField(
                      hintText: getTranslated('password_hint', context),
                      isShowBorder: true,
                      isPassword: true,
                      focusNode: _passwordFocus,
                      nextFocus: _confirmPasswordFocus,
                      isShowSuffixIcon: true,
                      inputAction: TextInputAction.next,
                      controller: _passwordController,
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                    // for confirm password section
                    Text(
                      getTranslated('confirm_password', context),
                      style: Theme.of(context).textTheme.headline2.copyWith(color: ColorResources.getHintColor(context)),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    CustomTextField(
                      hintText: getTranslated('password_hint', context),
                      isShowBorder: true,
                      isPassword: true,
                      isShowSuffixIcon: true,
                      focusNode: _confirmPasswordFocus,
                      controller: _confirmPasswordController,
                      inputAction: TextInputAction.done,
                    ),

                    SizedBox(height: 24),
                    CustomButton(
                      btnTxt: getTranslated('save', context),
                      onTap: () {
                        if(_passwordController.text.isEmpty) {
                          showCustomSnackBar('Enter new password', context);
                        }else if(_confirmPasswordController.text.isEmpty) {
                          showCustomSnackBar('Enter new password again', context);
                        }else if(_passwordController.text != _confirmPasswordController.text) {
                          showCustomSnackBar('Password does not matched', context);
                        }else {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => RestDashboardScreen()));
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
