import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/images.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/startup_screen.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/custom_app_bar.dart';

class WriteAReviewScreen extends StatefulWidget {
  @override
  _WriteAReviewScreenState createState() => _WriteAReviewScreenState();
}

class _WriteAReviewScreenState extends State<WriteAReviewScreen> {
  bool isYes = true;
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: Strings.WRITE_A_REVIEW),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: 15),
              children: [
                Container(
                  margin: EdgeInsets.only(left: 140, right: 140),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: FadeInImage.assetNetwork(
                          placeholder: Images.place_holder,
                          image: Images.doc_two,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,),
                      ),
                      Positioned(
                        top: -7,
                        left: -17,
                        child: Image.asset('assets/doctor/Icon/Group 163.png'),
                      ),
                      Positioned(
                        bottom: -7,
                        right: -17,
                        child: Image.asset('assets/doctor/Icon/Group 164.png'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text(
                    Strings.HOW_WAS_YOUR_EXPERIENCE,
                    textAlign: TextAlign.center,
                    style: khulaSemiBold.copyWith(color: ColorResources.COLOR_GREY, fontSize: 16),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          rating = 1;
                        });
                      },
                      child: Icon(Icons.star, color: rating >= 1 ? ColorResources.COLOR_YELLOW_SEA : ColorResources.COLOR_GAINSBORO),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        setState(() {
                          rating = 2;
                        });
                      },
                      child: Icon(Icons.star, color: rating >= 2 ? ColorResources.COLOR_YELLOW_SEA : ColorResources.COLOR_GAINSBORO),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        setState(() {
                          rating = 3;
                        });
                      },
                      child: Icon(Icons.star, color: rating >= 3 ? ColorResources.COLOR_YELLOW_SEA : ColorResources.COLOR_GAINSBORO),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        setState(() {
                          rating = 4;
                        });
                      },
                      child: Icon(Icons.star, color: rating >= 4 ? ColorResources.COLOR_YELLOW_SEA : ColorResources.COLOR_GAINSBORO),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        setState(() {
                          rating = 5;
                        });
                      },
                      child: Icon(Icons.star, color: rating >= 5 ? ColorResources.COLOR_YELLOW_SEA : ColorResources.COLOR_GAINSBORO),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(Strings.WRITE_A_COMMENT, style: khulaSemiBold.copyWith(color: ColorResources.COLOR_GREY, fontSize: 16)),
                      Text(Strings.MAX_450_WORDS, style: khulaSemiBold.copyWith(color: ColorResources.COLOR_GREY, fontSize: 12)),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  height: 170,
                  decoration: BoxDecoration(
                      color: ColorResources.COLOR_WHITE,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: ColorResources.COLOR_GREY)),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 10,right: 10),
                        hintStyle: khulaRegular.copyWith(color: ColorResources.COLOR_GREY),
                        hintText: Strings.LOREM__EXERCITATION,
                        border: InputBorder.none),
                    maxLines: 450,
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: Text(Strings.WOULD_YOU_RECOMMEND__, style: khulaBold.copyWith(color: ColorResources.COLOR_GREY)
                    )),

                Container(
                  margin: EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isYes = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              isYes
                                  ? CircleAvatar(
                                radius: 12,
                                backgroundColor:
                                ColorResources.COLOR_PRIMARY,
                                child: Icon(
                                  Icons.done,
                                  color: ColorResources.COLOR_WHITE,
                                  size: 15,
                                ),
                              )
                                  : CircleAvatar(
                                radius: 12,
                                backgroundColor:
                                ColorResources.COLOR_GAINSBORO,
                                child: Icon(
                                  Icons.done,
                                  size: 15,
                                  color: ColorResources.COLOR_WHITE,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                Strings.YES,
                                style: khulaRegular.copyWith(color: ColorResources.COLOR_GREY, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isYes = false;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              !isYes
                                  ? CircleAvatar(
                                radius: 12,
                                backgroundColor: ColorResources.COLOR_PRIMARY,
                                child: Icon(Icons.done,
                                    size: 15,
                                    color: ColorResources.COLOR_WHITE),
                              )
                                  : CircleAvatar(
                                radius: 12,
                                backgroundColor: ColorResources.COLOR_GAINSBORO,
                                child: Icon(Icons.done,
                                    size: 15,
                                    color: ColorResources.COLOR_WHITE),
                              ),
                              SizedBox(width: 10),
                              Text(Strings.NO,
                                style: khulaRegular.copyWith(color: ColorResources.COLOR_GREY, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            )),

            Container(
              margin: EdgeInsets.all(15),
              child: CustomButton(
                btnTxt: Strings.SUBMIT,
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => StartupScreen()), (route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
