import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_ui_kit/doctor/data/model/appoinment_data.dart';
import 'package:flutter_ui_kit/doctor/helper/utils.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/patients_details_screen.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/custom_app_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AppointmentsScreen extends StatefulWidget {
  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  bool isMorning = true;

  bool isVoiceCall = true;
  bool isMessage = false;
  bool isVideoCall = false;

  bool isTime = false;

  int timeSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: Strings.APPOINTMENTS),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, top: Dimensions.MARGIN_SIZE_DEFAULT),
                    child: Text(
                      Utils.dateFormatStyle1(),
                      style: khulaSemiBold.copyWith(color: ColorResources.COLOR_GREY, fontSize: Dimensions.FONT_SIZE_LARGE),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isMorning = true;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              height: 40,
                              decoration: BoxDecoration(
                                  color: isMorning ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_WHITE,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(7)),
                              child: Row(
                                children: [
                                  Container(
                                    width: 34,
                                    height: 34,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: isMorning
                                            ? ColorResources.COLOR_WHITE.withOpacity(.25)
                                            : ColorResources.COLOR_GAINSBORO.withOpacity(.25)),
                                    child: Icon(
                                      Icons.wb_sunny,
                                      color: isMorning ? ColorResources.COLOR_WHITE : ColorResources.COLOR_PRIMARY,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(Strings.MORNING,
                                              style: isMorning
                                                  ? khulaSemiBold.copyWith(
                                                      color: ColorResources.COLOR_WHITE,
                                                    )
                                                  : khulaSemiBold.copyWith(
                                                      color: ColorResources.COLOR_PRIMARY,
                                                    ))))
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isMorning = false;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              height: 40,
                              decoration: BoxDecoration(
                                  color: !isMorning ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_WHITE,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(7)),
                              child: Row(
                                children: [
                                  Container(
                                    width: 34,
                                    height: 34,
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: !isMorning
                                            ? ColorResources.COLOR_WHITE.withOpacity(.25)
                                            : ColorResources.COLOR_GAINSBORO.withOpacity(.25)),
                                    child: Icon(
                                      Icons.local_florist,
                                      color: !isMorning ? ColorResources.COLOR_WHITE : ColorResources.COLOR_PRIMARY,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(Strings.EVENING,
                                              style: !isMorning
                                                  ? khulaSemiBold.copyWith(
                                                      color: ColorResources.COLOR_WHITE,
                                                    )
                                                  : khulaSemiBold.copyWith(
                                                      color: ColorResources.COLOR_PRIMARY,
                                                    ))))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: isMorning ? AppointmentData.morningData.length : AppointmentData.eveningData.length,
                    itemBuilder: (BuildContext context, int index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          timeSelectedIndex = index;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                            color: index == timeSelectedIndex ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_WHITE,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 2),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(7)),
                        child: Text(
                          isMorning ? AppointmentData.morningData[index].time : AppointmentData.eveningData[index].time,
                          style: khulaSemiBold.copyWith(color: index == timeSelectedIndex ? ColorResources.COLOR_WHITE : ColorResources.COLOR_GREY),
                        ),
                      ),
                    ),
                    staggeredTileBuilder: (int index) => new StaggeredTile.count(1, 0.45),
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 45, left: 15, bottom: 15),
                    child: Text(
                      Utils.dateFormatStyle1(),
                      style: khulaSemiBold.copyWith(color: ColorResources.COLOR_GREY, fontSize: Dimensions.FONT_SIZE_LARGE),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isVoiceCall = true;
                        isMessage = false;
                        isVideoCall = false;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                      padding: EdgeInsets.only(left: 9, top: 6, bottom: 7, right: 10),
                      height: 55,
                      decoration: BoxDecoration(
                          color: isVoiceCall ? ColorResources.COLOR_MAYA_BLUE : ColorResources.COLOR_WHITE,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(7)),
                      child: Row(
                        children: [
                          Container(
                            width: 41,
                            height: 42,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: ColorResources.COLOR_GAINSBORO.withOpacity(.25), borderRadius: BorderRadius.circular(7)),
                            child: Image.asset(
                              'assets/doctor/Icon/call.png',
                              color: isVoiceCall ? ColorResources.COLOR_WHITE : ColorResources.COLOR_MAYA_BLUE,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(Strings.VOICE_CALL,
                                    style: isVoiceCall
                                        ? khulaBold.copyWith(
                                            color: ColorResources.COLOR_WHITE,
                                          )
                                        : khulaBold.copyWith(
                                            color: ColorResources.COLOR_GREY,
                                          )),
                                Text(Strings.YOU_CAN_CONNECT_THROUGH_VOICE_CALL,
                                    style: isVoiceCall
                                        ? khulaRegular.copyWith(
                                            color: ColorResources.COLOR_WHITE,
                                            fontSize: Dimensions.MARGIN_SIZE_SMALL,
                                          )
                                        : khulaRegular.copyWith(
                                            color: ColorResources.COLOR_GREY,
                                            fontSize: Dimensions.MARGIN_SIZE_SMALL,
                                          )),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Text(Strings.DOLLER10,
                                style: isVoiceCall
                                    ? khulaBold.copyWith(
                                        color: ColorResources.COLOR_WHITE,
                                        fontSize: 20,
                                      )
                                    : khulaBold.copyWith(
                                        color: ColorResources.COLOR_MAYA_BLUE,
                                        fontSize: 20,
                                      )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isVoiceCall = false;
                        isMessage = true;
                        isVideoCall = false;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                      padding: EdgeInsets.only(left: 9, top: 6, bottom: 7, right: 10),
                      height: 55,
                      decoration: BoxDecoration(
                          color: isMessage ? ColorResources.COLOR_YELLOW_SEA : ColorResources.COLOR_WHITE,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(7)),
                      child: Row(
                        children: [
                          Container(
                            width: 41,
                            height: 42,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: ColorResources.COLOR_GAINSBORO.withOpacity(.25), borderRadius: BorderRadius.circular(7)),
                            child: Image.asset(
                              'assets/doctor/Icon/message.png',
                              color: isMessage ? ColorResources.COLOR_WHITE : ColorResources.COLOR_YELLOW_SEA,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(Strings.MESSAGE_CHAT,
                                    style: isMessage
                                        ? khulaBold.copyWith(
                                            color: ColorResources.COLOR_WHITE,
                                          )
                                        : khulaBold.copyWith(
                                            color: ColorResources.COLOR_GREY,
                                          )),
                                Text(Strings.YOU_CAN_CONNECT_THROUGH_MESSAGE,
                                    style: isMessage
                                        ? khulaRegular.copyWith(
                                            color: ColorResources.COLOR_WHITE,
                                            fontSize: Dimensions.MARGIN_SIZE_SMALL,
                                          )
                                        : khulaRegular.copyWith(
                                            color: ColorResources.COLOR_GREY,
                                            fontSize: Dimensions.MARGIN_SIZE_SMALL,
                                          )),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Text(
                              Strings.DOLLER5,
                              style: isMessage
                                  ? khulaBold.copyWith(
                                      color: ColorResources.COLOR_WHITE,
                                      fontSize: 20,
                                    )
                                  : khulaBold.copyWith(
                                      color: ColorResources.COLOR_YELLOW_SEA,
                                      fontSize: 20,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isVoiceCall = false;
                        isMessage = false;
                        isVideoCall = true;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                      padding: EdgeInsets.only(left: 9, top: 6, bottom: 7, right: 10),
                      height: 55,
                      decoration: BoxDecoration(
                          color: isVideoCall ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_WHITE,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(7)),
                      child: Row(
                        children: [
                          Container(
                            width: 41,
                            height: 42,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: ColorResources.COLOR_GAINSBORO.withOpacity(.25), borderRadius: BorderRadius.circular(7)),
                            child: Image.asset(
                              'assets/doctor/Icon/video blue.png',
                              color: isVideoCall ? ColorResources.COLOR_WHITE : ColorResources.COLOR_PRIMARY,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(Strings.VIDEO_CALL,
                                    style: isVideoCall
                                        ? khulaBold.copyWith(
                                            color: ColorResources.COLOR_WHITE,
                                          )
                                        : khulaBold.copyWith(
                                            color: ColorResources.COLOR_GREY,
                                          )),
                                Text(Strings.BEST_WAY_TO_CONNECT_A_DOCTOR,
                                    style: isVideoCall
                                        ? khulaRegular.copyWith(
                                            color: ColorResources.COLOR_WHITE,
                                            fontSize: Dimensions.MARGIN_SIZE_SMALL,
                                          )
                                        : khulaRegular.copyWith(
                                            color: ColorResources.COLOR_GREY,
                                            fontSize: Dimensions.MARGIN_SIZE_SMALL,
                                          )),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Text(
                              Strings.DOLLER20,
                              style: isVideoCall
                                  ? khulaBold.copyWith(
                                      color: ColorResources.COLOR_WHITE,
                                      fontSize: 20,
                                    )
                                  : khulaBold.copyWith(
                                      color: ColorResources.COLOR_PRIMARY,
                                      fontSize: 20,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: CustomButton(
                btnTxt: Strings.CONTINUE,
                onTap: () {
                  pushNewScreen(
                    context,
                    screen: PatientsDetails(),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
