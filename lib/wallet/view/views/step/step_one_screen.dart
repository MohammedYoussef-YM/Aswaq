import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/wallet/view/views/startup_Screen.dart';
import 'package:flutter_ui_kit/wallet/utility/colorResources.dart';
import 'package:flutter_ui_kit/wallet/utility/dimensions.dart';
import 'package:flutter_ui_kit/wallet/utility/strings.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';
import 'package:flutter_ui_kit/wallet/view/views/step/step_two_screen.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/custom_app_bar.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/edittext/custom_text_field.dart';

class StepOneScreen extends StatelessWidget {
  final bool isLogin;
  StepOneScreen({this.isLogin = false});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorResources.COLOR_REGISTRATION_BACKGROUND,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                title: Strings.STEP1,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.0,
                margin: EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 10),
                padding: EdgeInsets.all(25),
                child: Image.asset(
                  'assets/wallet/Illustration/registration page.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
              Center(
                child: Text(
                  Strings.REGISTRATION,
                  style: poppinsRegular.copyWith(fontSize: 17),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.only(left: 30, right: 20),
                child: Text(
                  Strings.ENTER_YOUR_MOBILE,
                  textAlign: TextAlign.center,
                  style: montserratRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                width: double.infinity,
                height: 44,
                margin: EdgeInsets.only(right: 20, left: 20),
                padding: EdgeInsets.only(left: 20, right: 10),
                decoration: BoxDecoration(
                  color: ColorResources.COLOR_WHITE,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  border: Border.all(color: ColorResources.COLOR_WHITE_GRAY,width: 2)
                ),
                child: Row(
                  children: [
                    CountryCodePicker(
                      padding: EdgeInsets.all(0),
                      onChanged: print,
                      initialSelection: 'BD',
                      favorite: ['+88', 'BD'],
                      showCountryOnly: false,
                      textStyle: poppinsRegular.copyWith(fontSize: 13,),
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                    Expanded(
                      flex: 3,
                      child: CustomTextField(
                        hintTxt: Strings.MOBILE_NUMBER,
                        isPhoneNumber: true,
                        textInputType: TextInputType.phone,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: ColorResources.COLOR_DARK_ORCHID,
                              width: 2,
                            )),
                        child: Icon(
                          Icons.done,
                          color: ColorResources.COLOR_ROYAL_BLUE,
                          size: 15,
                        ))
                  ],
                ),
              ),
              SizedBox(height: 10),
              isLogin ? Container(
                width: double.infinity,
                height: 44,
                margin: EdgeInsets.only(right: 20, left: 20),
                padding: EdgeInsets.only(left: 20, right: 10),
                decoration: BoxDecoration(
                    color: ColorResources.COLOR_WHITE,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(color: ColorResources.COLOR_WHITE_GRAY,width: 2)
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CustomTextField(
                        hintTxt: 'Password',
                        textInputType: TextInputType.visiblePassword,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: ColorResources.COLOR_DARK_ORCHID,
                              width: 2,
                            )),
                        child: Icon(
                          Icons.done,
                          color: ColorResources.COLOR_ROYAL_BLUE,
                          size: 15,
                        ))
                  ],
                ),
              ) : SizedBox(),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(bottom: 30,left: 15,right: 15),
                child: CustomButton(btnTxt: isLogin ? Strings.LOGIN_TO_ACCOUNT : Strings.CONTINUE, onTap: (){
                  if(isLogin) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => WalletStartupScreen()));
                  }else {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => StepTwoScreen()));
                  }
                },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
