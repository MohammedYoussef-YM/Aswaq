import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/provider/auth_provider.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/payment/payment_setup_screen.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/custom_app_bar.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/edittext/custom_text_field.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/textfield_title_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class PatientsDetails extends StatefulWidget {
  @override
  _PatientsDetailsState createState() => _PatientsDetailsState();
}

class _PatientsDetailsState extends State<PatientsDetails> {
  bool isMale = true;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _statusController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  int ageIndex = -1;

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context, listen: false).initializeCountryCodeList();

    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: Strings.PATIENT_DETAILS),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  // for Name
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.MARGIN_SIZE_DEFAULT,
                        right: Dimensions.MARGIN_SIZE_DEFAULT,
                        bottom: Dimensions.MARGIN_SIZE_DEFAULT),
                    child: Stack(
                      children: [
                        TextFieldTitleWidget(
                          imageUrl: 'assets/doctor/Icon/people.png',
                          title: Strings.NAME,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: Dimensions.MARGIN_SIZE_LARGE),
                          child: CustomTextField(
                            hintTxt: Strings.ENTER_YOUR_NAME,
                            textInputType: TextInputType.name,
                            textInputAction: TextInputAction.done,
                            controller: _nameController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // for select age range or type
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldTitleWidget(
                          imageUrl: 'assets/doctor/Icon/calendar3.png',
                          title: Strings.SELECT_YOUR_AGE_RANGE_OR_TYPE,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    ageIndex = 0;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: ageIndex == 0 ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_WHITE,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: Offset(0, 1), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(15)),
                                  alignment: Alignment.center,
                                  height: 70,
                                  child: Text(Strings.plus_10,
                                      style: khulaSemiBold.copyWith(
                                        color: ageIndex == 0 ? ColorResources.COLOR_WHITE : ColorResources.COLOR_GREY,
                                        fontSize: 25,
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    ageIndex = 1;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: ageIndex == 1 ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_WHITE,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: Offset(0, 1), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(15)),
                                  alignment: Alignment.center,
                                  height: 70,
                                  child: Text(Strings.plus20,
                                      style: khulaSemiBold.copyWith(
                                        color: ageIndex == 1 ? ColorResources.COLOR_WHITE : ColorResources.COLOR_GREY,
                                        fontSize: 25,
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    ageIndex = 2;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: ageIndex == 2 ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_WHITE,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: Offset(0, 1), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(15)),
                                  alignment: Alignment.center,
                                  height: 70,
                                  child: Text(Strings.plus_30,
                                      style: khulaSemiBold.copyWith(
                                        color: ageIndex == 2 ? ColorResources.COLOR_WHITE : ColorResources.COLOR_GREY,
                                        fontSize: 25,
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: ageIndex == 3 ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_WHITE,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 7,
                                        offset: Offset(0, 1), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(15)),
                                alignment: Alignment.center,
                                height: 70,
                                child: TextField(
                                  onTap: () {
                                    setState(() {
                                      ageIndex = 3;
                                    });
                                  },
                                  textAlign: TextAlign.center,
                                  cursorColor: ColorResources.COLOR_GREY,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  controller: _ageController,
                                  maxLength: 3,
                                  style: TextStyle(fontSize: 25, color: ageIndex == 3 ? ColorResources.COLOR_WHITE : ColorResources.COLOR_GREY),
                                  decoration: InputDecoration(
                                      disabledBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      counterText: '',
                                      labelStyle: khulaSemiBold.copyWith(color: ColorResources.COLOR_GREY),
                                      enabledBorder: InputBorder.none),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: Dimensions.MARGIN_SIZE_DEFAULT,
                  ),
                  // for phone number
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.MARGIN_SIZE_DEFAULT,
                        right: Dimensions.MARGIN_SIZE_DEFAULT,
                        bottom: Dimensions.MARGIN_SIZE_DEFAULT),
                    child: Stack(
                      children: [
                        TextFieldTitleWidget(
                          imageUrl: 'assets/doctor/Icon/phone 2.png',
                          title: Strings.PHONE,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: Dimensions.MARGIN_SIZE_LARGE),
                          child: Consumer<AuthProvider>(builder: (context, profileProvider, child) {
                            return Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    //alignment: Alignment.center,
                                    child: DropdownButton<String>(
                                      value: profileProvider.countryCode ?? '',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: ColorResources.COLOR_GREY,
                                      ),
                                      iconSize: 20,
                                      elevation: 16,
                                      style: khulaSemiBold.copyWith(
                                          color: ColorResources.COLOR_GREY, fontSize: Dimensions.FONT_SIZE_SMALL),
                                      underline: SizedBox(),
                                      onChanged: profileProvider.updateCountryCode,
                                      items: profileProvider.countryCodeList.map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: CustomTextField(
                                      hintTxt: Strings.ENTER_YOUR_PHONE_NO,
                                      textInputType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      isPhoneNumber: true,
                                      controller: _phoneController,
                                    )),
                              ],
                            );
                          }),
                        ),
                        Positioned(
                          bottom: 7,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 1,
                            color: ColorResources.COLOR_GAINSBORO,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // check mail or female
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldTitleWidget(
                          imageUrl: 'assets/doctor/Icon/gendeer.png',
                          title: Strings.GENDER,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isMale = true;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    isMale
                                        ? CircleAvatar(
                                            radius: 12,
                                            backgroundColor: ColorResources.COLOR_PRIMARY,
                                            child: Icon(
                                              Icons.done,
                                              color: ColorResources.COLOR_WHITE,
                                              size: 15,
                                            ),
                                          )
                                        : CircleAvatar(
                                            radius: 12,
                                            backgroundColor: ColorResources.COLOR_GAINSBORO,
                                          ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 2),
                                      child: Text(
                                        Strings.MALE,
                                        style: khulaSemiBold.copyWith(
                                            color: ColorResources.COLOR_GREY, fontSize: Dimensions.FONT_SIZE_SMALL),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isMale = false;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    !isMale
                                        ? CircleAvatar(
                                            radius: 12,
                                            backgroundColor: ColorResources.COLOR_PRIMARY,
                                            child: Icon(
                                              Icons.done,
                                              color: ColorResources.COLOR_WHITE,
                                              size: 15,
                                            ),
                                          )
                                        : CircleAvatar(
                                            radius: 12,
                                            backgroundColor: ColorResources.COLOR_GAINSBORO,
                                          ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 2),
                                      child: Text(
                                        Strings.FEMALE,
                                        style: khulaSemiBold.copyWith(
                                            color: ColorResources.COLOR_GREY, fontSize: Dimensions.FONT_SIZE_SMALL),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // write your status
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Strings.WRITE_YOUR_ISSUES,
                            style: khulaSemiBold.copyWith(
                              color: ColorResources.COLOR_GREY,
                              fontSize: Dimensions.FONT_SIZE_LARGE,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 121,
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: ColorResources.COLOR_GAINSBORO), borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            cursorColor: ColorResources.COLOR_GREY,
                            maxLines: null,
                            controller: _statusController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintText: Strings.LOREM__FACILLIS,
                              hintStyle: khulaRegular.copyWith(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                //height: 12.5,
                              ),
                              hintMaxLines: 4,
                              labelStyle: khulaRegular.copyWith(
                                color: ColorResources.COLOR_GREY,
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                    screen: PaymentSetupScreen(),
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
