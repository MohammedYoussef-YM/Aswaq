import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/images.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';
import 'package:flutter_ui_kit/household_app/view/screens/location/choice_location_screen.dart';
import 'package:flutter_ui_kit/household_app/view/widget/custom_button.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class HouseHoldOTPVerificationScreen extends StatefulWidget {
  @override
  _HouseHoldOTPVerificationScreenState createState() => _HouseHoldOTPVerificationScreenState();
}

class _HouseHoldOTPVerificationScreenState extends State<HouseHoldOTPVerificationScreen> {
  String text = '';

  void _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
      if (text.length == 4) {
        //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => DashboardScreen()));
      }
    });
  }

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
        title: Text(Strings.verify_phone, style: manropeMedium),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
               Image.asset(Images.smart_phone,width: 80, height: 120,fit: BoxFit.scaleDown),
                SizedBox(height: 20),
                Column(
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          otpNumberWidget(0),
                          otpNumberWidget(1),
                          otpNumberWidget(2),
                          otpNumberWidget(3),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Center(child: Text(Strings.enter_the_4_digit_code_sent_to_you,style: manropeLight,)),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(top: HouseHoldDimensions.PADDING_SIZE_SMALL),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Strings.resend_code_in,
                            style: manropeRegular.copyWith(
                                fontSize: HouseHoldDimensions.PADDING_SIZE_SMALL
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.of(context).pushReplacement(MaterialPageRoute(
                              //     builder: (BuildContext context) => LocationScreen()));
                            },
                            child: Text(
                              Strings.second_10,
                              style: manropeRegular.copyWith(
                                  fontSize: HouseHoldDimensions.PADDING_SIZE_SMALL,
                                  color: HouseHoldColorResources.COLOR_CRANBERRY
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(HouseHoldDimensions.PADDING_SIZE_SMALL),
                      child: CustomButton(btnTxt: Strings.verify_account,onTap: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => ChoiceLocationScreen()));
                      },),
                    ),
                    NumericKeyboard(
                      onKeyboardTap: _onKeyboardTap,
                      textColor: HouseHoldColorResources.COLOR_BLACK,
                      rightIcon: Icon(
                        Icons.backspace,
                        color: HouseHoldColorResources.COLOR_BLACK,
                      ),
                      rightButtonFn: () {
                        setState(() {
                          text = text.substring(0, text.length - 1);
                        });
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: HouseHoldColorResources.COLOR_WHITE,
            border: Border.all(color: HouseHoldColorResources.COLOR_PRIMARY, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Center(
            child: Text(
              text[position],
              style: manropeSemiBold.copyWith(color: HouseHoldColorResources.COLOR_BLACK,fontSize: 21,),
            )),
      );
    } catch (e) {
      return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: HouseHoldColorResources.COLOR_WHITE,
            border: Border.all(color: HouseHoldColorResources.COLOR_CHARCOAL_HINT.withOpacity(.5), width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
      );
    }
  }
}
