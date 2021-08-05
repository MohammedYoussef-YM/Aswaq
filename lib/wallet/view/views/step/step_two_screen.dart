import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/wallet/utility/colorResources.dart';
import 'package:flutter_ui_kit/wallet/utility/dimensions.dart';
import 'package:flutter_ui_kit/wallet/utility/strings.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';
import 'package:flutter_ui_kit/wallet/view/views/step/step_three_screen.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/custom_app_bar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class StepTwoScreen extends StatefulWidget {
  @override
  _StepTwoScreenState createState() => _StepTwoScreenState();
}

class _StepTwoScreenState extends State<StepTwoScreen> {
  String currentText = '';
  var onTapRecognizer;
  TextEditingController textEditingController = TextEditingController()..text = "";
  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_REGISTRATION_BACKGROUND,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                title: Strings.STEP2,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.0,
                margin: EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 10),
                padding: EdgeInsets.all(25),
                child: Hero(
                  tag: 3,
                  child: Image.asset(
                    'assets/wallet/Illustration/verification pg.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Center(
                child: Text(
                  Strings.VERIFICATION,
                  style: poppinsRegular.copyWith(
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.only(left: 30, right: 20),
                alignment: Alignment.center,
                child: Text(
                  Strings.ENTER_4_DIGIT,
                  textAlign: TextAlign.center,
                  style: montserratRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        length: 4,
                        appContext: context,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v.length < 3) {
                            return "I'm from validator";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.underline,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          selectedFillColor: Colors.transparent,
                          inactiveFillColor: Colors.transparent,
                          inactiveColor: ColorResources.COLOR_GRAY,
                          activeColor: ColorResources.COLOR_PRIMARY_DARK,
                          activeFillColor: hasError ? Colors.orange : Colors.transparent,
                        ),
                        animationDuration: Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        onCompleted: (v) {
                          print("Completed");
                        },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: Dimensions.MARGIN_SIZE_DEFAULT,
                  left: Dimensions.MARGIN_SIZE_DEFAULT,
                  right: Dimensions.MARGIN_SIZE_DEFAULT,
                ),
                child: CustomButton(
                  btnTxt: Strings.CONTINUE,
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => StepThreeScreen()));
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Center(
                    child: Text(
                  Strings.RESEND_CODE_IN,
                  style: poppinsRegular,
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
