import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/helper/utils.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/images.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/incoming_call_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/about_doctor_screen.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/custom_app_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'audio_calling_screen.dart';
import 'chat_screen.dart';

class OnlineAppointmentsScreen extends StatelessWidget {
  final bool isAppointment;
  OnlineAppointmentsScreen({this.isAppointment = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: Strings.APPOINTMENTS_DETAILS),
            // for doctor name
            Container(
              height: 86,
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(color: ColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FadeInImage.assetNetwork(
                      placeholder: Images.place_holder,
                      image: Images.doctor_one,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      width: 70,),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Strings.DOCTOR_NAME1,
                          style: khulaSemiBold.copyWith(
                            fontSize: 20,
                            color: ColorResources.COLOR_CONFLOWER_BLUE,
                          ),
                        ),
                        Text(
                          Strings.HEART__HOSPITAL,
                          style: khulaRegular.copyWith(
                            fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                            color: ColorResources.COLOR_GREY,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 15,
            ),
            Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorResources.COLOR_PRIMARY,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(42), topRight: Radius.circular(42))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: AudioCallingScreen(),
                                  withNavBar: false, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Container(
                                height: 62,
                                margin: EdgeInsets.only(right: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(color: ColorResources.COLOR_WHITE.withOpacity(.22), borderRadius: BorderRadius.circular(8)),
                                child: Image.asset(
                                  'assets/doctor/Icon/call.png',
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: ChatScreen(),
                                  withNavBar: false, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Container(
                                height: 62,
                                margin: EdgeInsets.only(right: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(color: ColorResources.COLOR_WHITE.withOpacity(.22), borderRadius: BorderRadius.circular(8)),
                                child: Image.asset(
                                  'assets/doctor/Icon/message.png',
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                pushNewScreen(
                                  context,
                                  screen: IncomingCallScreen(),
                                  withNavBar: false, // OPTIONAL VALUE. True by default.
                                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                );
                              },
                              child: Container(
                                height: 62,
                                margin: EdgeInsets.only(right: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(color: ColorResources.COLOR_WHITE.withOpacity(.22), borderRadius: BorderRadius.circular(8)),
                                child: Image.asset(
                                  'assets/doctor/Icon/call.png',
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 62,
                              margin: EdgeInsets.only(right: 15),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(color: ColorResources.COLOR_WHITE.withOpacity(.22), borderRadius: BorderRadius.circular(8)),
                              child: Image.asset(
                                'assets/doctor/Icon/calender.png',
                                width: 24,
                                height: 24,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Ink(
                  color: ColorResources.COLOR_PRIMARY,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ColorResources.COLOR_HOME_BACKGROUND,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(42), topRight: Radius.circular(42))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/doctor/Icon/time 2.png',
                              width: 17,
                              height: 17,
                              fit: BoxFit.fill,
                              color: ColorResources.COLOR_GREY,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Strings.VISIT_TIME,
                                  style: khulaSemiBold.copyWith(
                                    color: ColorResources.COLOR_GREY,
                                  ),
                                ),
                                Text(
                                  Strings.MORNING,
                                  style: khulaRegular.copyWith(
                                    color: ColorResources.COLOR_GREY,
                                    fontSize: Dimensions.FONT_SIZE_SMALL,
                                  ),
                                ),
                                Text(
                                  Strings.TODAY + Utils.dateFormatStyle2(),
                                  style: khulaRegular.copyWith(
                                    color: ColorResources.COLOR_GREY,
                                    fontSize: Dimensions.FONT_SIZE_SMALL,
                                  ),
                                ),
                                Text(
                                  Strings.TIME_10_00_AM_TO_11_00_AM,
                                  style: khulaBold.copyWith(
                                    color: ColorResources.COLOR_PRIMARY,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person,
                              size: 18,
                              color: ColorResources.COLOR_GREY3,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Strings.PATIENT_INFORMATION,
                                    style: khulaSemiBold.copyWith(
                                      color: ColorResources.COLOR_GREY,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Text(
                                        Strings.NAME,
                                        style: khulaRegular.copyWith(
                                          color: ColorResources.COLOR_GREY,
                                          fontSize: Dimensions.FONT_SIZE_SMALL,
                                        ),
                                      )),
                                      Text(': '),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            Strings.NAME1,
                                            style: khulaRegular.copyWith(
                                              color: ColorResources.COLOR_GREY,
                                              fontSize: Dimensions.FONT_SIZE_SMALL,
                                            ),
                                          ))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Text(
                                        Strings.AGE,
                                        style: khulaRegular.copyWith(
                                          color: ColorResources.COLOR_GREY,
                                          fontSize: Dimensions.FONT_SIZE_SMALL,
                                        ),
                                      )),
                                      Text(': '),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            Strings.NUMBER_26,
                                            style: khulaRegular.copyWith(
                                              color: ColorResources.COLOR_GREY,
                                              fontSize: Dimensions.FONT_SIZE_SMALL,
                                            ),
                                          ))
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Text(
                                        Strings.PHONE,
                                        style: khulaRegular.copyWith(
                                          color: ColorResources.COLOR_GREY,
                                          fontSize: Dimensions.FONT_SIZE_SMALL,
                                        ),
                                      )),
                                      Text(': '),
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            Strings.NUMBER__254,
                                            style: khulaRegular.copyWith(
                                              color: ColorResources.COLOR_GREY,
                                              fontSize: Dimensions.FONT_SIZE_SMALL,
                                            ),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/doctor/Icon/doller.png',
                              width: 10,
                              height: 17,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: 23,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Strings.FEES_INFORMATION,
                                  style: khulaSemiBold.copyWith(
                                    color: ColorResources.COLOR_GREY,
                                  ),
                                ),
                                Text(
                                  Strings.PAID,
                                  style: khulaSemiBold.copyWith(
                                    color: ColorResources.COLOR_PRIMARY,
                                  ),
                                ),
                                Text(
                                  Strings.DOLLER5,
                                  style: khulaSemiBold.copyWith(
                                    color: ColorResources.COLOR_GREY,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),

            isAppointment ? Container(
              margin: EdgeInsets.all(15),
              child: CustomButton(
                btnTxt: Strings.BOOK_AN_APPOINTMENT,
                onTap: () {
                  pushNewScreen(
                    context,
                    screen: AboutDoctorScreen(),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
            ) : SizedBox(),
          ],
        ),
      ),
    );
  }
}
