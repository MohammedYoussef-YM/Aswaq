import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/screens/auth/otp_confirmation.dart';
import 'package:flutter_ui_kit/food/screens/auth/otp_widget.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/utility/dimensions.dart';
import 'package:flutter_ui_kit/food/utility/strings.dart';
import 'package:flutter_ui_kit/food/utility/style.dart';

class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return OtpWidget(child: Padding(
      padding: EdgeInsets.only(top: 100.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              Strings.OTP_VERIFICATION,
              style: TextStyle(
                  fontSize: Dimensions.TEXT_SIZE_EXTRA_LARGE,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height:50,
            ),
            Padding(
              padding:
              const EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.WE_WILL_SEND,
                    style: TextStyle(
                        fontSize: Dimensions.PADDING_SIZE_SMALL,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    Strings.ONE_TIME_PASSWORD,
                    style: TextStyle(
                        fontSize: Dimensions.PADDING_SIZE_SMALL,
                        color: ColorResources.COLOR_PRIMARY,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                Strings.ON_THIS_MOBILE,
                style: TextStyle(
                    fontSize: Dimensions.PADDING_SIZE_SMALL,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height:50,
            ),
            Padding(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  style: CustomStyle.textStyle,
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.number,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return Strings.FIELD_REQUIRED;
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      labelText: Strings.DEMO_PHONE,
                      labelStyle: CustomStyle.textStyle,
                      focusedBorder: CustomStyle.focusBorderStyle,
                      enabledBorder: CustomStyle.enableBorderStyle,
                      focusedErrorBorder: CustomStyle.enableBorderStyle,
                      errorBorder: CustomStyle.enableBorderStyle,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        child: Image(
                          height: 3,
                          width: 3,
                          image:
                          AssetImage('assets/food/images/otp_phone_icon.png',),
                        ),
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => OTPConfirmationScreen()));
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: ColorResources.COLOR_PRIMARY,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Center(
                    child: Text(
                      Strings.GET_OTP,
                      style: TextStyle(
                          fontSize: Dimensions.TEXT_SIZE_DEFAULT,
                          color: ColorResources.COLOR_WHITE
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
