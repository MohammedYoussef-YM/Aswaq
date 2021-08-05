import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/data/model/doctor_data.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/view/views/about_doctor_screen.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/custom_app_bar.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/doctor_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


class FavouriteDoctors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: Strings.FAVOURTITE_DOCTORS),

            Expanded(child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: DoctorData.topDoctorList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    pushNewScreen(context, screen: AboutDoctorScreen(), withNavBar: false, pageTransitionAnimation: PageTransitionAnimation.cupertino);
                  },
                  child: DoctorWidget(doctor: DoctorData.allDoctorList[index], isFavScreen: true),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}

