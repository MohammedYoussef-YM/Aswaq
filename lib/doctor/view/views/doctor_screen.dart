import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/data/model/doctor.dart';
import 'package:flutter_ui_kit/doctor/data/model/doctor_data.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/custom_app_bar.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/doctor_widget.dart';

class DoctorScreen extends StatefulWidget {
  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  bool isAll = true;
  bool isCardio = false;
  bool isHeart = false;
  bool isMental = false;
  bool isDental = false;
  bool isArm = false;
  TextEditingController searchController = new TextEditingController();
  List<Doctor> _searchDoctor = [];

  onSearchTextChanged(String text) async {
    _searchDoctor.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    DoctorData.allDoctorList.forEach((doctor) {
      if (doctor.name.toLowerCase().contains(text.toLowerCase()) || doctor.designation.toLowerCase().contains(text.toLowerCase()))
        _searchDoctor.add(doctor);
    });

    setState(() {});
  }

  Widget _searchDoctors(BuildContext context) {
    return Container(
      height: 45,
      margin: EdgeInsets.only(right: 20, left: 20),
      padding: EdgeInsets.only(left: 20, right: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorResources.COLOR_WHITE,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: .2,
            blurRadius: 1,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          TextField(
            controller: searchController,
            onChanged: onSearchTextChanged,
            style: khulaSemiBold.copyWith(
              color: ColorResources.COLOR_BLACK,
            ),
            decoration: InputDecoration(
                hintText: Strings.SEARCH_HINT,
                hintStyle: khulaSemiBold.copyWith(
                  color: ColorResources.COLOR_GAINSBORO,
                ),
                border: InputBorder.none),
          ),
          Positioned(
              right: 10,
              top: 10,
              child: InkWell(
                onTap: () {
                  setState(() {
                    searchController.clear();
                    onSearchTextChanged('');
                  });
                },
                child: Image.asset(
                  'assets/doctor/Icon/Search.png',
                  color: ColorResources.COLOR_PRIMARY,
                  width: 25,
                  height: 25,
                ),
              )),
        ],
      ),
    );
  }

  Widget _staticSearch(BuildContext context) {
    return Container(
      height: 32,
      margin: EdgeInsets.only(left: 16, top: 15),
      decoration: BoxDecoration(color: ColorResources.COLOR_HOME_BACKGROUND),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                searchController.clear();
                isAll = true;
                isCardio = false;
                isHeart = false;
                isMental = false;
                isDental = false;
                isArm = false;
              });
            },
            child: Container(
              width: 68,
              height: 32,
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isAll ? ColorResources.COLOR_YELLOW_SEA : ColorResources.COLOR_WHITE,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: .2,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Text(
                Strings.ALL,
                style:
                    isAll ? khulaSemiBold.copyWith(color: ColorResources.COLOR_WHITE) : khulaSemiBold.copyWith(color: ColorResources.COLOR_GAINSBORO),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                searchController.clear();
                isAll = false;
                isCardio = true;
                isHeart = false;
                isMental = false;
                isDental = false;
                isArm = false;
              });
            },
            child: Container(
              width: 68,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isCardio ? ColorResources.COLOR_YELLOW_SEA : ColorResources.COLOR_WHITE,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: .2,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Text(
                Strings.CARDIO,
                style: isCardio ? khulaSemiBold.copyWith(color: ColorResources.COLOR_WHITE) : khulaSemiBold.copyWith(color: ColorResources.COLOR_GAINSBORO),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                searchController.clear();
                isAll = false;
                isCardio = false;
                isHeart = true;
                isMental = false;
                isDental = false;
                isArm = false;
              });
            },
            child: Container(
              width: 68,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isHeart ? ColorResources.COLOR_YELLOW_SEA : ColorResources.COLOR_WHITE,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: .2,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Text(
                Strings.HEART,
                style: isHeart ? khulaSemiBold.copyWith(color: ColorResources.COLOR_WHITE) : khulaSemiBold.copyWith(color: ColorResources.COLOR_GAINSBORO),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                searchController.clear();
                isAll = false;
                isCardio = false;
                isHeart = false;
                isMental = true;
                isDental = false;
                isArm = false;
              });
            },
            child: Container(
              width: 68,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isMental ? ColorResources.COLOR_YELLOW_SEA : ColorResources.COLOR_WHITE,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: .2,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Text(
                Strings.MENTAL,
                style: isMental ?khulaSemiBold.copyWith(color: ColorResources.COLOR_WHITE) : khulaSemiBold.copyWith(color: ColorResources.COLOR_GAINSBORO),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                searchController.clear();
                isAll = false;
                isCardio = false;
                isHeart = false;
                isMental = false;
                isDental = true;
                isArm = false;
              });
            },
            child: Container(
              width: 68,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isDental ? ColorResources.COLOR_YELLOW_SEA : ColorResources.COLOR_WHITE,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: .2,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Text(
                Strings.DENTAL,
                style: isDental ? khulaSemiBold.copyWith(color: ColorResources.COLOR_WHITE) : khulaSemiBold.copyWith(color: ColorResources.COLOR_GAINSBORO),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                searchController.clear();
                isAll = false;
                isCardio = false;
                isHeart = false;
                isMental = false;
                isDental = false;
                isArm = true;
              });
            },
            child: Container(
              width: 68,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isArm ? ColorResources.COLOR_YELLOW_SEA : ColorResources.COLOR_WHITE,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: .2,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Text(
                Strings.ARM,
                style: isArm ? khulaSemiBold.copyWith(color: ColorResources.COLOR_WHITE) : khulaSemiBold.copyWith(color: ColorResources.COLOR_GAINSBORO),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Widget _showAllDoctor(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 10, bottom: 30),
      itemCount: _searchDoctor.length == 0 || searchController.text.isEmpty
          ? isAll && !isCardio && !isHeart && !isMental && !isDental
              ? DoctorData.allDoctorList.length
              : !isAll && isCardio && !isHeart && !isMental && !isDental
                  ? DoctorData.cardioDoctorList.length
                  : !isAll && !isCardio && isHeart && !isMental && !isDental
                      ? DoctorData.heartDoctorList.length
                      : !isAll && !isCardio && !isHeart && isMental && !isDental
                          ? DoctorData.mentalDoctorList.length
                          : DoctorData.dentalDoctorList.length
          : _searchDoctor.length,
      itemBuilder: (context, index) => DoctorWidget(
          doctor: _searchDoctor.length == 0 || searchController.text.isEmpty
              ? isAll && !isCardio && !isHeart && !isMental && !isDental
                  ? DoctorData.allDoctorList[index]
                  : !isAll && isCardio && !isHeart && !isMental && !isDental
                      ? DoctorData.cardioDoctorList[index]
                      : !isAll && !isCardio && isHeart && !isMental && !isDental
                          ? DoctorData.heartDoctorList[index]
                          : !isAll && !isCardio && !isHeart && isMental && !isDental
                              ? DoctorData.mentalDoctorList[index]
                              : DoctorData.dentalDoctorList[index]
              : _searchDoctor[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: Strings.DOCTORS, isBackExist: false),
            _searchDoctors(context),
            _staticSearch(context),
            SizedBox(height: 10),
            Expanded(child: _showAllDoctor(context)),
          ],
        ),
      ),
    );
  }
}
