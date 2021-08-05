import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/rideshare/provider/rideshare_auth_provider.dart';
import 'package:flutter_ui_kit/rideshare/utility/colorResources.dart';
import 'package:flutter_ui_kit/rideshare/utility/dimensions.dart';
import 'package:flutter_ui_kit/rideshare/utility/images.dart';
import 'package:flutter_ui_kit/rideshare/utility/strings.dart';
import 'package:flutter_ui_kit/rideshare/view/view/auth/rideshare_otp_confirmation.dart';
import 'package:flutter_ui_kit/rideshare/view/widget/custom_button.dart';
import 'package:flutter_ui_kit/rideshare/view/widget/custom_text_field.dart';
import 'package:ola_like_country_picker/ola_like_country_picker.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CreateAccountScreen extends StatelessWidget {
  FocusNode _phoneFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  CountryPicker countryPicker;

  @override
  Widget build(BuildContext context) {
    countryPicker = CountryPicker(onCountrySelected: (Country country) {
      Provider.of<RideShareAuthProvider>(context,listen: false).changeCountry(country);
    });

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  margin: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      Text(
                        Strings.create_account,
                        style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_GRAY_DEEP, fontSize: Dimensions.FONT_SIZE_LARGE),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Image.asset(Images.welcome_back, fit: BoxFit.fill, width: MediaQuery.of(context).size.width),
                SizedBox(height: 80),
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
                                  child: Consumer<RideShareAuthProvider>(
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
                                    inputAction: TextInputAction.done,
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
                      Text(Strings.by_creating_an_account,
                          style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE, fontSize: Dimensions.FONT_SIZE_SMALL)),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(Strings.terms_of_service,
                              style: poppinsBold.copyWith(color: ColorResources.COLOR_BLACK, fontSize: Dimensions.FONT_SIZE_SMALL)),
                          Text(Strings.and,
                              style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE, fontSize: Dimensions.FONT_SIZE_SMALL)),
                          Text(Strings.privacy_policy,
                              style: poppinsBold.copyWith(color: ColorResources.COLOR_BLACK, fontSize: Dimensions.FONT_SIZE_SMALL)),
                        ],
                      ),
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
                  btnTxt: Strings.continue_,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => RideShareConfirmationScreen()));
                  },
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
