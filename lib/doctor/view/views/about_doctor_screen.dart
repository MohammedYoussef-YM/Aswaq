import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/helper/utils.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/images.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/appointment_screen.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/custom_app_bar.dart';

class AboutDoctorScreen extends StatefulWidget {
  @override
  _AboutDoctorScreenState createState() => _AboutDoctorScreenState();
}

class _AboutDoctorScreenState extends State<AboutDoctorScreen> {
  int selectedDate = -1;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: Strings.ABOUT),
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
                      fit: BoxFit.fill,
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
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
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
              height: 5,
            ),
            Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: 5),
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(left: 42, right: 42, top: 20, bottom: 20),
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
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: ColorResources.COLOR_WHITE.withOpacity(.2),
                                  radius: 25,
                                  child: Image.asset(
                                    'assets/doctor/Icon/people.png',
                                    width: 26,
                                    height: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Strings.Plus1000,
                                      style: TextStyle(
                                          color: ColorResources.COLOR_WHITE,
                                          fontSize: 20,
                                          fontFamily: '',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(Strings.PATIENTS,
                                        style: khulaSemiBold.copyWith(
                                            color: ColorResources.COLOR_WHITE, fontSize: Dimensions.FONT_SIZE_SMALL)),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: ColorResources.COLOR_WHITE.withOpacity(.2),
                                  radius: 25,
                                  child: Image.asset(
                                    'assets/doctor/Icon/batch.png',
                                    width: 26,
                                    height: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Strings.Yrs5,
                                      style: TextStyle(
                                          color: ColorResources.COLOR_WHITE,
                                          fontSize: 20,
                                          fontFamily: '',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(Strings.EXPERIENCE,
                                        style: khulaSemiBold.copyWith(
                                            color: ColorResources.COLOR_WHITE, fontSize: Dimensions.FONT_SIZE_SMALL)),
                                  ],
                                )
                              ],
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
                        Text(
                          Strings.ABOUT_DOCTOR,
                          style: khulaSemiBold.copyWith(color: ColorResources.COLOR_GREY, fontSize: Dimensions.FONT_SIZE_LARGE),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          Strings.LOREM__TINCIDUNT,
                          textAlign: TextAlign.justify,
                          style: khulaRegular.copyWith(color: ColorResources.COLOR_GREY, fontSize: Dimensions.FONT_SIZE_SMALL),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          Strings.WORKING_TIME,
                          style: khulaSemiBold.copyWith(color: ColorResources.COLOR_GREY, fontSize: Dimensions.FONT_SIZE_LARGE),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          Strings.MON_FRI,
                          style: khulaRegular.copyWith(color: ColorResources.COLOR_GREY, fontSize: Dimensions.FONT_SIZE_SMALL),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              Utils.monthName(),
                              style: khulaSemiBold.copyWith(
                                  color: ColorResources.COLOR_GREY, fontSize: Dimensions.FONT_SIZE_LARGE),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: ColorResources.COLOR_GREY,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 60,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: Utils.calculateDaysInterval().length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                setState(() {
                                  selectedDate = index;
                                });
                              },
                              child: Container(
                                width: 50,
                                margin: EdgeInsets.only(right: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: selectedDate == index ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_WHITE,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(0, 1), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(Utils.calculateDaysInterval()[index].dayName.toString(),
                                        style: khulaSemiBold.copyWith(
                                          color: selectedDate == index ? ColorResources.COLOR_WHITE : ColorResources.COLOR_GREY,
                                        )),
                                    Text(Utils.calculateDaysInterval()[index].day.toString(),
                                        style: khulaSemiBold.copyWith(
                                          color: selectedDate == index ? ColorResources.COLOR_WHITE : ColorResources.COLOR_GREY,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
            Container(
              height: 45,
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              color: Colors.transparent,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 45,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: ColorResources.COLOR_SKY_MAYA_BLUE),
                      child: Icon(
                        isChecked ? Icons.favorite : Icons.favorite_border,
                        color: ColorResources.COLOR_PRIMARY,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: CustomButton(
                      btnTxt: Strings.BOOK_AN_APPOINTMENT,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => AppointmentsScreen()));
                      },
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
