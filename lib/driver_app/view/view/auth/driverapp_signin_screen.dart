import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/driver_app/provider/driverapp_auth_provider.dart';
import 'package:flutter_ui_kit/driver_app/view/view/home/driverapp_homescreen.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/driver_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/driver_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/driver_app/utility/strings.dart';
import 'package:flutter_ui_kit/driver_app/view/view/auth/create_account_screen.dart';
import 'package:flutter_ui_kit/driver_app/view/widget/custom_button.dart';
import 'package:flutter_ui_kit/driver_app/view/widget/custom_text_field.dart';
import 'package:flutter_ui_kit/rideshare/utility/images.dart';
import 'package:ola_like_country_picker/ola_like_country_picker.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DriverAppSignInScreen extends StatelessWidget{
  FocusNode _phoneFocus = FocusNode();

  FocusNode _passwordFocus = FocusNode();

  CountryPicker countryPicker;


  @override
  Widget build(BuildContext context) {

    countryPicker = CountryPicker(onCountrySelected: (Country country) {
      Provider.of<DriverAppAuthProvider>(context,listen: false).changeCountry(country);
    });

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  child: Text(
                    Strings.welcome_back,
                    style: poppinsBold.copyWith(color: ColorResources.COLOR_GRAY_DEEP, fontSize: 24),
                  ),
                ),
                SizedBox(height: 50),
                Image.asset(Images.welcome_back, fit: BoxFit.fill, width: MediaQuery.of(context).size.width),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                Container(
                  margin: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Strings.phone_number,
                          style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY, fontSize: Dimensions.FONT_SIZE_SMALL)),

                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  child: Consumer<DriverAppAuthProvider>(
                                    builder: (context,authProvider,child)=>Container(
                                      height: 30,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            authProvider.country.flagUri,
                                            package: 'ola_like_country_picker',
                                            width: 30,
                                            height: 20,
                                          ),
                                          SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                                          Text(
                                            '+ ${authProvider.country.dialCode}',
                                            style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_DEEP, fontSize: Dimensions.FONT_SIZE_LARGE),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    countryPicker.launch(context);
                                  },
                                ),
                                SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                                Expanded(
                                  child: CustomTextField(
                                    hintText: Strings.phone_number_digit,
                                    focusNode: _phoneFocus,
                                    nextFocus: _passwordFocus,
                                    inputType: TextInputType.number,
                                    isBorder: false,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 2,
                              color: ColorResources.COLOR_PRIMARY,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      Text(Strings.password, style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY, fontSize: Dimensions.FONT_SIZE_SMALL)),
                      CustomTextField(hintText: Strings.password_hint, focusNode: _passwordFocus, inputAction: TextInputAction.done),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      Text(Strings.forgot_password,
                          style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY, fontSize: Dimensions.FONT_SIZE_SMALL)),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
            child: Column(
              children: [
                CustomButton(
                  btnTxt: Strings.login,
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => DriverAppHomeScreen()));
                  },
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => DriverCreateAccountScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.or,
                        style: poppinsRegular,
                      ),
                      Text(Strings.create_an_account, style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY)),
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
