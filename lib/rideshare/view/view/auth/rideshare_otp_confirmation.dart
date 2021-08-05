import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/rideshare/utility/colorResources.dart';
import 'package:flutter_ui_kit/rideshare/utility/dimensions.dart';
import 'package:flutter_ui_kit/rideshare/utility/strings.dart';
import 'package:flutter_ui_kit/rideshare/view/view/home/rideshare_homescreen.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class RideShareConfirmationScreen extends StatefulWidget {
  @override
  _RideShareConfirmationScreenState createState() => _RideShareConfirmationScreenState();
}

class _RideShareConfirmationScreenState extends State<RideShareConfirmationScreen> {
  String text = '';

  void _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
      if (text.length == 4) {
        //Navigator.of(context).pushReplacement(Materia lPageRoute(builder: (BuildContext context) => DashboardScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView(
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
                      Strings.phone_verification,
                      style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_GRAY_DEEP, fontSize: Dimensions.FONT_SIZE_LARGE),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  Strings.enter_your_otp_code,
                  style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_BLACK, fontSize: 24.0),
                ),
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
              Padding(
                padding: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.enter_the_4_digit_code,
                      style: poppinsRegular.copyWith(
                        color: ColorResources.COLOR_GRAY_DEEP,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60.0),
              Container(
                constraints: const BoxConstraints(maxWidth: 300),
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
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    Strings.resend_code_in,
                                    style: TextStyle(
                                      fontSize: Dimensions.PADDING_SIZE_SMALL,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => DashboardScreen()));
                                    },
                                    child: Text(
                                      Strings.ten_seconds,
                                      style: TextStyle(
                                        fontSize: Dimensions.PADDING_SIZE_SMALL,
                                        color: ColorResources.COLOR_PRIMARY,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                backgroundColor: ColorResources.COLOR_PRIMARY,
                                radius: 25,
                                child: IconButton(
                                  icon: Icon(Icons.arrow_right_alt_sharp, color: ColorResources.COLOR_WHITE),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => RideShareHomeScreen()));
                                  },
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
          ),
        ],
      ),
    );
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: ColorResources.COLOR_SIMPLE_WHITE,
            border: Border.all(color: ColorResources.COLOR_PRIMARY, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Center(
            child: Text(
          text[position],
          style: TextStyle(color: ColorResources.COLOR_GRAY),
        )),
      );
    } catch (e) {
      return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: ColorResources.COLOR_SIMPLE_WHITE,
            border: Border.all(color: ColorResources.COLOR_PRIMARY, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
      );
    }
  }
}
