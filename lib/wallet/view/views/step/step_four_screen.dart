import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/wallet/utility/colorResources.dart';
import 'package:flutter_ui_kit/wallet/utility/dimensions.dart';
import 'package:flutter_ui_kit/wallet/utility/strings.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';
import 'package:flutter_ui_kit/wallet/view/views/step/widget/last_step_confirm_widget.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/custom_app_bar.dart';

import '../startup_Screen.dart';

class StepFourScreen extends StatefulWidget {

  @override
  _StepFourScreenState createState() => _StepFourScreenState();
}

class _StepFourScreenState extends State<StepFourScreen> {
  bool isRecommendedSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_REGISTRATION_BACKGROUND,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: Strings.STEP4,
            ),

            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Hero(
                    tag: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3,
                      margin: EdgeInsets.only(
                          left: 25, right: 25, bottom: 10),
                      padding: EdgeInsets.all(25),
                      child: Image.asset(
                        'assets/wallet/Illustration/Id-verify.png',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      Strings.ONE_STEP_AWAY,
                      style: poppinsRegular.copyWith(fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    padding: EdgeInsets.only(left: 30, right: 20),
                    child: Text(
                      Strings.ONE_STEP_AWAY_CONTENT,
                      style: montserratSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isRecommendedSelected = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 10,right: 10,bottom: 20,top: 10),
                      margin: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                          color: ColorResources.COLOR_WHITE,
                          border: isRecommendedSelected ? Border.all(width: 2, color: ColorResources.COLOR_PRIMARY) : null,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],

                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: CircleAvatar(
                                    backgroundColor:
                                        ColorResources.COLOR_SHAMROCK,
                                    radius: 13,
                                    child: Text(
                                      Strings.ONE,
                                      style: montserratSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL,color: ColorResources.COLOR_WHITE),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 4,
                                  child: Text(
                                    Strings.USE_IDENTITY_CARD,
                                    style: poppinsSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                  )),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 5, bottom: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      gradient: LinearGradient(colors: [
                                        ColorResources.COLOR_MEDIUM_VIOLET_RED,
                                        ColorResources.COLOR_MEDIUM_VIOLET_RED,
                                        ColorResources.COLOR_WILD_WATERMELON,
                                      ])),
                                  child: Text(
                                    Strings.RECOMMENDED,
                                    textAlign: TextAlign.center,
                                    style: poppinsSemiBold.copyWith(fontSize: 9,color: ColorResources.COLOR_WHITE),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(child: Container()),
                              Expanded(
                                flex: 7,
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    Strings.LOREM,
                                    style: montserratRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isRecommendedSelected = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 10,right: 10,bottom: 20,top: 10),
                      margin: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                          color: ColorResources.COLOR_WHITE,
                          border: isRecommendedSelected ? null : Border.all(width: 2, color: ColorResources.COLOR_PRIMARY),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: CircleAvatar(
                                    backgroundColor:
                                        ColorResources.COLOR_SHAMROCK,
                                    radius: 13,
                                    child: Text(
                                      Strings.TWO,
                                      style: montserratSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL,color: ColorResources.COLOR_WHITE),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 4,
                                  child: Text(
                                    Strings.USE_IDENTITY_CARD,
                                    style: poppinsSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                  )),
                              Expanded(
                                flex: 3,
                                child: Container(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(child: Container()),
                              Expanded(
                                flex: 7,
                                child: Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    Strings.LOREM,
                                    style: montserratRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
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
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: LastStepConfirmWidget(onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => WalletStartupScreen()));
                          }),
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
