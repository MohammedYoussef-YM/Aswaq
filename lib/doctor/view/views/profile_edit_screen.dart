import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/startup_screen.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/custom_app_bar.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/edittext/custom_text_field.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/textfield_title_widget.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileEditScreen extends StatefulWidget {
  final fromSetting;
  ProfileEditScreen({this.fromSetting});

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  bool isMale = true;
  TextEditingController _locationController=TextEditingController();
  DateTime _date;
  File file;
  FocusNode _locationNode = FocusNode();

  void _choose() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery, imageQuality: 50, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (pickedFile != null) {
        file = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: SafeArea(
        child: Column(
          children: [
            widget.fromSetting ? CustomAppBar(title: '') : SizedBox.shrink(),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                children: [
                  Text(
                    Strings.SET_UP_YOUR_PROFILE,
                    style: khulaSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: ColorResources.COLOR_GREY),
                  ),
                  Text(
                    Strings.UPDATE_YOUR_PROFILE,
                    style: khulaSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_GREY),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: _choose,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: ColorResources.COLOR_GAINSBORO,
                                borderRadius: BorderRadius.circular(24)),
                            child: file == null ? Icon(Icons.person, color: ColorResources.COLOR_WHITE, size: 75)
                                : ClipRRect(borderRadius: BorderRadius.circular(24), child: Image.file(file, fit: BoxFit.cover, height: 1000, width: 100,)),
                          ),
                          Positioned(
                            bottom: -22,
                            left: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: ColorResources.COLOR_PRIMARY,
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Image.asset('assets/doctor/Icon/camera.png')),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50),

                  // check mail or female
                  Column(
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
                  // for Date of Birth
                  Container(
                    margin: EdgeInsets.only(
                      top: Dimensions.MARGIN_SIZE_DEFAULT,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldTitleWidget(
                          imageUrl: 'assets/doctor/Icon/calendar3.png',
                          title: Strings.DATE_OF_BIRTH,
                        ),
                        InkWell(
                          onTap: () async {
                            DateTime date = await showDatePicker(context: context, firstDate: DateTime(2000), initialDate: DateTime.now(), lastDate: DateTime(2022));
                            setState(() {
                              _date = date;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: Dimensions.MARGIN_SIZE_LARGE, left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: Text(_date == null ? 'Select date of birth' : DateFormat('dd MMM yyyy').format(_date), style: khulaRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // for Location
                  Container(
                    margin: EdgeInsets.only(
                      top: Dimensions.MARGIN_SIZE_DEFAULT,),
                    child: Stack(
                      children: [
                        TextFieldTitleWidget(
                          imageUrl: 'assets/doctor/Icon/location.png',
                          title: Strings.LOCATION,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: Dimensions.MARGIN_SIZE_LARGE),
                          child: CustomTextField(
                            hintTxt: Strings.ENTER_YOUR_LOCATION,
                            textInputType: TextInputType.streetAddress,
                            textInputAction: TextInputAction.done,
                            focusNode: _locationNode,
                            controller: _locationController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.all(15),
              child: CustomButton(
                btnTxt: widget.fromSetting ? Strings.SAVE : Strings.CONTINUE,
                onTap: () {
                  widget.fromSetting ? Navigator.of(context).pop() : Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => StartupScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
