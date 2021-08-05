import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/screens/auth/otp_verification_screen.dart';
import 'package:flutter_ui_kit/food/screens/auth/food_registration_screen.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/utility/dimensions.dart';
import 'package:flutter_ui_kit/food/utility/strings.dart';

class FoodLoginScreen extends StatefulWidget {
  @override
  _FoodLoginScreenState createState() => _FoodLoginScreenState();
}

class _FoodLoginScreenState extends State<FoodLoginScreen> {

  var textStyle = TextStyle(color: ColorResources.COLOR_GREY, fontSize: Dimensions.TEXT_SIZE_DEFAULT);
  var focusBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(Dimensions.OUTLINE_BORDER)),
    borderSide: BorderSide(color: ColorResources.COLOR_GREY, width: 2.0),
  );
  var enableBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(Dimensions.OUTLINE_BORDER)),
    borderSide: BorderSide(color: ColorResources.COLOR_BLACK, width: 1.0),
  );

  bool obscureText = true;
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 380,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Image.asset(
                      'assets/food/images/login_background.jpg',
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: ColorResources.COLOR_PRIMARY.withOpacity(0.3),
                  ),
                  Positioned(
                    top: 300,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: ColorResources.COLOR_WHITE,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                        ),
                      )
                  ),
                  Positioned(
                    top: 260,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: Container(
                              decoration: BoxDecoration(
                                color:ColorResources.COLOR_WHITE,
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                  'assets/food/images/login_secu.png'
                              ),
                            ),
                          ),
                        ),
                      )
                  ),
                ],
              ),
            ),
            loginDataWidget(context)
          ],
        ),
      ),
    );
  }

  loginDataWidget(BuildContext context) {
    return Container(
      color: ColorResources.COLOR_WHITE,
      child: Column(
        children: [
          Text(
              Strings.SIGN_IN_TO_YOUR_ACCOUNT,
            style: TextStyle(
              fontSize: Dimensions.TEXT_SIZE_DEFAULT,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 50,),
          Form(
            child: Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      style: textStyle,
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return Strings.FIELD_REQUIRED;
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: Strings.USERNAME_PHONE_NUMBER,
                        labelStyle: textStyle,
                        focusedBorder: focusBorderStyle,
                        enabledBorder: enableBorderStyle,
                        focusedErrorBorder: enableBorderStyle,
                        errorBorder: enableBorderStyle,
                        prefixIcon: Image.asset('assets/food/images/login_user.png')
                      ),

                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      obscureText: obscureText,
                      autofocus: false,
                      style: textStyle,
                      controller: password,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return Strings.FIELD_REQUIRED;
                        } else {
                          return null;
                        }
                      },
                      decoration: new InputDecoration(
                        labelText: Strings.PASSWORD,
                        labelStyle: textStyle,
                        focusedBorder: focusBorderStyle,
                        enabledBorder: enableBorderStyle,
                        focusedErrorBorder: enableBorderStyle,
                        errorBorder: enableBorderStyle,
                        prefixIcon: Image.asset('assets/food/images/login_secu.png'),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          child: Icon(
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            semanticLabel: obscureText
                                ? 'show password'
                                : 'hide password',
                            color: ColorResources.COLOR_PRIMARY,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => OTPVerificationScreen()));
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
                          Strings.SIGN_IN,
                          style: TextStyle(
                            fontSize: Dimensions.TEXT_SIZE_DEFAULT,
                            color: ColorResources.COLOR_WHITE
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FoodRegistrationScreen())),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            Strings.DONT_HAVE_ACCOUNT,
                          style: TextStyle(
                              color: ColorResources.COLOR_BLACK,
                              fontSize: Dimensions.TEXT_SIZE_SMALL
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text(
                            Strings.REGISTRATION_HERE,
                          style: TextStyle(
                            color: ColorResources.COLOR_PRIMARY,
                            fontSize: Dimensions.TEXT_SIZE_SMALL
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
