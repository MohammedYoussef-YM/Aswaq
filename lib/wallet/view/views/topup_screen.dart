import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/wallet/utility/colorResources.dart';
import 'package:flutter_ui_kit/wallet/utility/dimensions.dart';
import 'package:flutter_ui_kit/wallet/utility/strings.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/custom_app_bar.dart';

class TopUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: Strings.TOP_UP),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    width: double.infinity,
                    height: 170,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/wallet/Illustration/topup-pg.png',
                      width: 153,
                      height: 153,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                    height: 39,
                    padding: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: ColorResources.COLOR_WHITE_SMOKE),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            alignment: Alignment.center,
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(23), color: ColorResources.COLOR_PRIMARY_DARK),
                            child: Text(
                              Strings.TOP_UP_FOR,
                              style: poppinsRegular.copyWith(
                                color: ColorResources.COLOR_WHITE,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 5),
                            child: FittedBox(
                              child: Text(
                                Strings.COUNTRY_CODE,
                                textAlign: TextAlign.justify,
                                style: poppinsRegular.copyWith(
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            alignment: Alignment.center,
                            child: FittedBox(
                                child: Text(
                              Strings.MOBILE_NUMBER,
                              style: poppinsSemiBold.copyWith(
                                color: ColorResources.COLOR_PRIMARY_DARK,
                              ),
                            )),
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            'assets/wallet/Icon/contacts.png',
                            width: 12,
                            height: 16,
                            fit: BoxFit.scaleDown,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    height: 39,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: ColorResources.COLOR_WHITE_SMOKE),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(23), color: ColorResources.COLOR_PRIMARY_DARK),
                            child: Text(
                              Strings.AMOUNT,
                              style: poppinsRegular.copyWith(
                                color: ColorResources.COLOR_WHITE,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            alignment: Alignment.center,
                            child: Text(
                              Strings.DOLLER25,
                              textAlign: TextAlign.center,
                              style: poppinsSemiBold.copyWith(
                                fontSize: 20,
                                color: ColorResources.COLOR_DARK_ORCHID,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 20, bottom: 30),
                    child: Text(
                      Strings.AVAIBLE_BALANCE,
                      style: montserratSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 50, left: 50),
                      child: CustomButton(
                        btnTxt: Strings.CONTINUE,
                        onTap: () {},
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30, top: 37, bottom: 14),
                    child: Text(
                      Strings.RECENT,
                      style: poppinsRegular,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30, bottom: 14),
                    padding: EdgeInsets.only(left: 18, top: 13, bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: ColorResources.COLOR_WHITE),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/wallet/Icon/loan.png',
                              width: 11,
                              height: 11,
                              fit: BoxFit.scaleDown,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              Strings.CONTACT1,
                              style: poppinsRegular.copyWith(fontSize: 11),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/wallet/Icon/loan.png',
                              width: 11,
                              height: 11,
                              fit: BoxFit.scaleDown,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              Strings.CONTACT2,
                              style: poppinsRegular.copyWith(fontSize: 11),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/wallet/Icon/loan.png',
                              width: 11,
                              height: 11,
                              fit: BoxFit.scaleDown,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              Strings.CONTACT3,
                              style: poppinsRegular.copyWith(fontSize: 11),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/wallet/Icon/loan.png',
                              width: 11,
                              height: 11,
                              fit: BoxFit.scaleDown,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              Strings.CONTACT4,
                              style: poppinsRegular.copyWith(fontSize: 11),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/wallet/Icon/loan.png',
                              width: 11,
                              height: 11,
                              fit: BoxFit.scaleDown,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              Strings.CONTACT5,
                              style: poppinsRegular.copyWith(fontSize: 11),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30, top: 37, bottom: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.MY_CONTACT,
                          style: poppinsRegular,
                        ),
                        Text(
                          Strings.VIEW_MORE,
                          style: poppinsRegular.copyWith(
                              fontWeight: FontWeight.normal, fontSize: 11, color: ColorResources.COLOR_GRAY.withOpacity(.7)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30, bottom: 14),
                    padding: EdgeInsets.only(left: 18, top: 13, bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: ColorResources.COLOR_WHITE),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/wallet/Icon/loan.png',
                              width: 11,
                              height: 11,
                              fit: BoxFit.scaleDown,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              Strings.CONTACT1,
                              style: poppinsRegular.copyWith(fontSize: 11),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/wallet/Icon/loan.png',
                              width: 11,
                              height: 11,
                              fit: BoxFit.scaleDown,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              Strings.CONTACT2,
                              style: poppinsRegular.copyWith(fontSize: 11),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/wallet/Icon/loan.png',
                              width: 11,
                              height: 11,
                              fit: BoxFit.scaleDown,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              Strings.CONTACT3,
                              style: poppinsRegular.copyWith(fontSize: 11),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/wallet/Icon/loan.png',
                              width: 11,
                              height: 11,
                              fit: BoxFit.scaleDown,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              Strings.CONTACT4,
                              style: poppinsRegular.copyWith(fontSize: 11),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/wallet/Icon/loan.png',
                              width: 11,
                              height: 11,
                              fit: BoxFit.scaleDown,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              Strings.CONTACT5,
                              style: poppinsRegular.copyWith(fontSize: 11),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
