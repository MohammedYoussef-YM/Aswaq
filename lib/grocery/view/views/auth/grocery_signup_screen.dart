import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/views/auth/grocery_login_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/auth/verification_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/auth/widget/auth_header_widget.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_button.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class GrocerySignUpScreen extends StatelessWidget {
  FocusNode _fullNameFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  FocusNode _phoneNumberFocus = FocusNode();
  FocusNode _dateFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: ListView(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.of(context).pop();
                            })),
                    SizedBox(height: 50),
                    authHeaderWidget(context: context, title: Strings.sign_up, subTitle: Strings.please_type_your_information_below),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomTextField(
                        hintText: Strings.full_name,
                        focusNode: _fullNameFocus,
                        nextFocus: _emailFocus,
                        inputType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomTextField(
                        hintText: Strings.email,
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
                        nextFocus: _phoneNumberFocus,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorResources.COLOR_LIGHT_GRAY),
                          borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL)
                      ),
                      child: Row(
                        children: [
                          CountryCodePicker(
                            onChanged: print,
                            initialSelection: 'BD',
                            favorite: ['+88', 'BD'],
                            showCountryOnly: false,
                            textStyle: poppinsRegular.copyWith(fontSize: 13,),
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                          ),
                          Expanded(
                            child: CustomTextField(
                              hintText: Strings.phone_number,
                              inputType: TextInputType.phone,
                              focusNode: _phoneNumberFocus,
                              isCountryPicker: true,
                              isBorder: false,
                              nextFocus: _dateFocus,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomTextField(
                        hintText: Strings.date_of_birth,
                        inputType: TextInputType.datetime,
                        isDateOfBirth: true,
                        focusNode: _dateFocus,
                        inputAction: TextInputAction.done,
                      ),
                    ),

                    SizedBox(height: 50),
                    Container(
                        margin: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT),
                        child: CustomButton(
                          btnTxt: Strings.send,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => VerificationScreen()));
                          },
                        )),

                  ],
                )),

            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GroceryLoginScreen()));
              },
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.you_have_an_account,
                      style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                    ),
                    Text(Strings.sign_in, style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY))
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
