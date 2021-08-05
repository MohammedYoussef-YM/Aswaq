import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_ui_kit/doctor/data/model/doctor_data.dart';
import 'package:flutter_ui_kit/doctor/data/model/specialist_data.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/images.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/appointment_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/my_appointments.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/home_specialist_cardwidget.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/home_specialist_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'about_doctor_screen.dart';
import 'doctor_screen.dart';

class DoctorHomeScreen extends StatefulWidget {
  @override
  _DoctorHomeScreenState createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  Widget _homeToolbar(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Row(
        children: [
          Container(
            width: 37,
            height: 35,
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: ColorResources.COLOR_GAINSBORO,
              child: Icon(
                Icons.person,
                color: ColorResources.COLOR_WHITE,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.JOHN_DOE,
                  style: khulaRegular.copyWith(color: ColorResources.COLOR_GREY, fontSize: 20),
                ),
                Text(
                  Strings.FIND_BEST_DOCTORS_EASILY,
                  style: khulaRegular.copyWith(color: ColorResources.COLOR_GREY, fontSize: Dimensions.FONT_SIZE_SMALL),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () => pushNewScreen(context, screen: MyAppointments(), withNavBar: false),
            child: Container(
                width: 38,
                height: 35,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorResources.COLOR_WHITE,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/doctor/Icon/calendar3.png',
                  color: ColorResources.COLOR_PRIMARY,
                  fit: BoxFit.scaleDown,
                )),
          ),
        ],
      ),
    );
  }

  Widget _searchDoctors(BuildContext context) {
    return Container(
      height: 43,
      width: double.infinity,
      margin: EdgeInsets.only(right: 20, left: 20),
      padding: EdgeInsets.only(left: 20, right: 5),
      decoration: BoxDecoration(
        color: ColorResources.COLOR_WHITE,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 12,
            child: Text(
              Strings.SEARCH_HINT,
              style: khulaSemiBold.copyWith(
                color: ColorResources.COLOR_GAINSBORO,
              ),
            ),
          ),
          Positioned(
              right: 10,
              top: 10,
              child: Image.asset(
                'assets/doctor/Icon/Search.png',
                color: ColorResources.COLOR_PRIMARY,
                width: 25,
                height: 25,
              )),
        ],
      ),
    );
  }

  Widget _specialistList(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(color: ColorResources.COLOR_HOME_BACKGROUND),
      child: ListView.builder(
          itemCount: SpecialistData.speciaList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                pushNewScreen(
                  context,
                  screen: DoctorScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              child: HomeSpecialistWidget(SpecialistData.speciaList[index]),
            );
          }),
    );
  }

  Widget _specialistBannerList(BuildContext context) {
    return Container(
      height: 110,
      margin: EdgeInsets.only(left: 16),
      child: ListView.builder(
          itemCount: SpecialistData.getBannerList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                pushNewScreen(
                  context,
                  screen: AppointmentsScreen(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
              child: HomeSpecialistCardWidget(SpecialistData.getBannerList[index]),
            );
          }),
    );
  }

  Widget _showAllDoctor(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 35),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: DoctorData.topDoctorList.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            pushNewScreen(
              context,
              screen: AboutDoctorScreen(),
              withNavBar: false,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            decoration: BoxDecoration(
              color: ColorResources.COLOR_WHITE,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 12,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FadeInImage.assetNetwork(
                      placeholder: Images.place_holder,
                      image: DoctorData.topDoctorList[index].imageUrl,
                      height: double.maxFinite,
                      width: double.maxFinite,
                      fit: BoxFit.fill,),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    DoctorData.topDoctorList[index].name,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: khulaSemiBold.copyWith(
                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
                      color: ColorResources.COLOR_MAYA_BLUE,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Text(
                    DoctorData.topDoctorList[index].designation,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: khulaRegular.copyWith(
                      fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                      color: ColorResources.COLOR_GREY,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        staggeredTileBuilder: (int index) => new StaggeredTile.count(1, 1.3),
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 1.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _homeToolbar(context),
              SizedBox(height: 20),
              GestureDetector(
                  onTap: () {
                    pushNewScreen(
                      context,
                      screen: DoctorScreen(),
                      withNavBar: false,
                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    );
                  },
                  child: _searchDoctors(context)),
              SizedBox(height: 20),
              Container(
                  margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT),
                  child: Text(
                    Strings.SPECIALIST,
                    style: khulaSemiBold.copyWith(color: ColorResources.COLOR_GREY, fontSize: Dimensions.FONT_SIZE_LARGE),
                    textAlign: TextAlign.start,
                  )),
              _specialistList(context),
              SizedBox(
                height: 20,
              ),
              _specialistBannerList(context),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(Strings.TOP_DOCTORS,
                          style: khulaSemiBold.copyWith(
                            color: ColorResources.COLOR_GREY,
                            fontSize: Dimensions.FONT_SIZE_LARGE,
                          )),
                      GestureDetector(
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: DoctorScreen(),
                            withNavBar: false,
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Text(Strings.VIEW_ALL,
                            style: khulaSemiBold.copyWith(
                              color: ColorResources.COLOR_GREY,
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                            )),
                      ),
                    ],
                  )),
              _showAllDoctor(context),
            ],
          ),
        ),
      ),
    );
  }
}
