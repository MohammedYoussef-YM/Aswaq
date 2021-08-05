import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/screens/auth/otp_widget.dart';
import 'package:flutter_ui_kit/food/screens/dashboard_screen.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/utility/dimensions.dart';
import 'package:flutter_ui_kit/food/utility/strings.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class OTPConfirmationScreen extends StatefulWidget {
  @override
  _OTPConfirmationScreenState createState() => _OTPConfirmationScreenState();
}

class _OTPConfirmationScreenState extends State<OTPConfirmationScreen> {

  String text = '';

  void _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
      if(text.length == 4) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => DashboardScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return OtpWidget(child: Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                Strings.OTP_VERIFICATION,
                style: TextStyle(
                    fontSize: Dimensions.TEXT_SIZE_EXTRA_LARGE,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                const EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.ENTER_OTP_TO,
                      style: TextStyle(
                        fontSize: Dimensions.PADDING_SIZE_SMALL,
                      ),
                    ),
                    Text(
                      Strings.DEMO_NUMBER,
                      style: TextStyle(
                          fontSize: Dimensions.PADDING_SIZE_SMALL,
                          color: ColorResources.COLOR_BLACK,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Column(
                children: [
                  Container(
                    constraints: const BoxConstraints(
                        maxWidth: 500
                    ),
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
                  Padding(
                    padding:
                    const EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.DIDNT_RECEIVED_CODE,
                          style: TextStyle(
                            fontSize: Dimensions.PADDING_SIZE_SMALL,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (BuildContext context) => DashboardScreen()));
                          },
                          child: Text(
                            Strings.RESEND_OTP,
                            style: TextStyle(
                              fontSize: Dimensions.PADDING_SIZE_SMALL,
                              color: ColorResources.COLOR_PRIMARY,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  NumericKeyboard(
                    onKeyboardTap: _onKeyboardTap,
                    textColor: ColorResources.COLOR_BLACK,

                    rightIcon: Icon(
                      Icons.backspace,
                      color: ColorResources.COLOR_BLACK,

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
    ));
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 73,
        width: 64,
        decoration: BoxDecoration(
            color: ColorResources.COLOR_LIGHT_GREY,
            border: Border.all(
                color: ColorResources.COLOR_LIGHT_GREY,
                width: 0
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
        child: Center(child: Text(text[position], style: TextStyle(color: Colors.black),)),
      );
    } catch (e) {
      return Container(
        height: 73,
        width: 64,
        decoration: BoxDecoration(
          color: ColorResources.COLOR_LIGHT_GREY,
            border: Border.all(
                color: ColorResources.COLOR_LIGHT_GREY,
                width: 0
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
      );
    }
  }
}
