import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/auth_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/wishlist_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_button.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_text_field.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/auth/login_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FocusNode _firstNameFocus = FocusNode();
    FocusNode _lastNameFocus = FocusNode();
    FocusNode _numberFocus = FocusNode();
    FocusNode _passwordFocus = FocusNode();
    FocusNode _confirmPasswordFocus = FocusNode();
    TextEditingController _firstNameController = TextEditingController();
    TextEditingController _lastNameController = TextEditingController();
    TextEditingController _numberController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _confirmPasswordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
        child: Consumer<RestAuthProvider>(
          builder: (context, authProvider, child) => ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: 53),
              Center(
                  child: Text(
                getTranslated('create_account', context),
                style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 24, color: ColorResources.getGreyBunkerColor(context)),
              )),
              SizedBox(height: 85),

              // for first name section
              Text(
                getTranslated('first_name', context),
                style: Theme.of(context).textTheme.headline2.copyWith(color: ColorResources.getHintColor(context)),
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              CustomTextField(
                hintText: 'John',
                isShowBorder: true,
                controller: _firstNameController,
                focusNode: _firstNameFocus,
                nextFocus: _lastNameFocus,
                inputType: TextInputType.name,
                capitalization: TextCapitalization.words,
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

              // for last name section
              Text(
                getTranslated('last_name', context),
                style: Theme.of(context).textTheme.headline2.copyWith(color: ColorResources.getHintColor(context)),
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              CustomTextField(
                hintText: 'Doe',
                isShowBorder: true,
                controller: _lastNameController,
                focusNode: _lastNameFocus,
                nextFocus: _numberFocus,
                inputType: TextInputType.name,
                capitalization: TextCapitalization.words,
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

              // for email section
              Text(
                getTranslated('mobile_number', context),
                style: Theme.of(context).textTheme.headline2.copyWith(color: ColorResources.getHintColor(context)),
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              CustomTextField(
                hintText: getTranslated('number_hint', context),
                isShowBorder: true,
                controller: _numberController,
                focusNode: _numberFocus,
                nextFocus: _passwordFocus,
                inputType: TextInputType.phone,
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

              // for password section
              Text(
                getTranslated('password', context),
                style: Theme.of(context).textTheme.headline2.copyWith(color: ColorResources.getHintColor(context)),
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              CustomTextField(
                hintText: getTranslated('password_hint', context),
                isShowBorder: true,
                isPassword: true,
                controller: _passwordController,
                focusNode: _passwordFocus,
                nextFocus: _confirmPasswordFocus,
                isShowSuffixIcon: true,
              ),
              SizedBox(height: 22),

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
                controller: _confirmPasswordController,
                focusNode: _confirmPasswordFocus,
                isShowSuffixIcon: true,
                inputAction: TextInputAction.done,
              ),

              SizedBox(height: 22),


              // for signup button
              CustomButton(
                      btnTxt: getTranslated('signup', context),
                      onTap: () async {
                        await Provider.of<RestWishListProvider>(context, listen: false).initWishList();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => RestDashboardScreen()));
                      },
                    ),

              // for already an account
              SizedBox(height: 11),
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
