import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/images.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';
import 'package:flutter_ui_kit/household_app/view/screens/auth/otp_verification_screen.dart';
import 'package:flutter_ui_kit/household_app/view/widget/custom_button.dart';

class PhoneLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HouseHoldColorResources.COLOR_SOLITUDE,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left, size: 30, color: HouseHoldColorResources.COLOR_BLACK),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(Strings.continue_with_phone_number, style: manropeMedium),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 80),
         Image.asset(
           Images.phone_large,
           width: 120,
           height: 150,
           fit: BoxFit.scaleDown,),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.only(
              left: HouseHoldDimensions.PADDING_SIZE_EXTRA_LARGE,
              right: HouseHoldDimensions.PADDING_SIZE_EXTRA_LARGE,
            ),
            child: Text(
              Strings.we_will_send_4_digit_code_to,
              textAlign: TextAlign.center,
              style: manropeLight,
            ),
          ),
          SizedBox(height: 30),
          Container(
            //height: 88,
            padding: EdgeInsets.all(HouseHoldDimensions.PADDING_SIZE_DEFAULT),
            margin: EdgeInsets.all(HouseHoldDimensions.PADDING_SIZE_DEFAULT),
            decoration: BoxDecoration(
              color: HouseHoldColorResources.COLOR_WHITE,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(HouseHoldDimensions.PADDING_SIZE_SMALL),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.enter_your_phone,
                  style: manropeRegular.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_SMALL),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextField(
                        style: manropeRegular.copyWith(
                          fontSize: HouseHoldDimensions.FONT_SIZE_LARGE,
                        ),
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: Strings.phone_number_one,
                            hintStyle: manropeRegular.copyWith(
                              color: HouseHoldColorResources.COLOR_CHARCOAL_HINT.withOpacity(.7),
                              fontSize: HouseHoldDimensions.FONT_SIZE_LARGE,
                            )),
                      ),
                    ),
                    SizedBox(width: HouseHoldDimensions.PADDING_SIZE_LARGE),
                    Expanded(
                      child: CustomButton(
                        btnTxt: Strings.continue_,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>HouseHoldOTPVerificationScreen()));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
