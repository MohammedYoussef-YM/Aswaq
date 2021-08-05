import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/data/model/doctor.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/images.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/about_doctor_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class DoctorWidget extends StatelessWidget {
  final Doctor doctor;
  final bool isFavScreen;
  DoctorWidget({@required this.doctor, this.isFavScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushNewScreen(
          context,
          screen: AboutDoctorScreen(),
          withNavBar: false,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        height: 90,
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(color: ColorResources.COLOR_WHITE,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FadeInImage.assetNetwork(
                placeholder: Images.place_holder,
                image:  doctor.imageUrl,
                  height: double.infinity,
                  fit: BoxFit.fill,
                  width: 65,
              ),
            ),
            SizedBox(
            width: 13,
            ),
            Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.name,
                  style: khulaSemiBold.copyWith(
                    fontSize: 20,
                    color: ColorResources.COLOR_CONFLOWER_BLUE,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: ColorResources.COLOR_YELLOW_SEA,
                      size: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2, left: 5),
                      child: Text(doctor.review,
                          style: khulaRegular.copyWith(
                            fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                            color: ColorResources.COLOR_SPECIALIST_CARD_PRICE,
                          )),
                    )
                  ],
                ),
                Text(
                  doctor.designation,
                  style: khulaRegular.copyWith(
                    fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                    color: ColorResources.COLOR_GREY,
                  ),
                  maxLines: 1,
                )
              ],
            ),
            ),
            Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.MARGIN_SIZE_SMALL,
                ),
                isFavScreen
                    ? Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0x24387AF6),
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: ColorResources.COLOR_PRIMARY,
                          size: 30,
                        ),
                      )
                    : Container(
                        width: 51,
                        height: 14,
                        padding: EdgeInsets.only(top: 2),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: ColorResources.COLOR_MAYA_BLUE),
                        child: Text(
                          Strings.AVAILABLE,
                          style: khulaRegular.copyWith(
                            color: ColorResources.COLOR_WHITE,
                            fontSize: 8,
                          ),
                        ),
                      ),
              ],
            ),
            ),
      ]),
    ));
  }
}
