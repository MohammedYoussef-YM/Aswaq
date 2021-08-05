import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/images.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/complete_widget.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/custom_app_bar.dart';
import 'package:flutter_ui_kit/food/screens/dashboard/message_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class IncomingCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: ''),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.80,
                    alignment: Alignment.center,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            Strings.INCOMING_CALL,
                            style: khulaRegular.copyWith(color: ColorResources.COLOR_GREY, fontSize: 16),
                          ),
                          SizedBox(height: 7),
                          Container(
                            width: 213,
                            height: 213,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorResources.COLOR_ALTO
                                      .withOpacity(.26),
                                ),
                                borderRadius: BorderRadius.circular(34)),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 213,
                                  height: 213,
                                  margin: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: ColorResources.COLOR_ALTO,
                                      ),
                                      borderRadius: BorderRadius.circular(34)),
                                  child: Container(
                                    width: 213,
                                    height: 213,
                                    margin: EdgeInsets.all(25),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ColorResources.COLOR_MAYA_BLUE,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(26)),
                                    child: Container(
                                      width: 213,
                                      height: 213,
                                      margin: EdgeInsets.all(15),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: FadeInImage.assetNetwork(
                                            placeholder: Images.place_holder,
                                            image: Images.doc_one,
                                          fit: BoxFit.fill,),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 13),
                          Text(
                            Strings.DOCTOR_NAME2,
                            style: khulaSemiBold.copyWith(color: ColorResources.COLOR_GREY, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: CompleteWidget(),
                            );
                          });
                    },
                    child: Container(
                      height: 58,
                      width: 58,
                      margin: EdgeInsets.only(right: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ColorResources.COLOR_RED,
                          borderRadius: BorderRadius.circular(15)),
                      child: Icon(
                        Icons.call_end,
                        color: ColorResources.COLOR_WHITE,
                        size: 25,
                      ),
                    ),
                  ),
                  Container(
                    height: 58,
                    width: 58,
                    margin: EdgeInsets.only(right: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorResources.COLOR_MOUNTAIN_MEADOW,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      Icons.call,
                      color: ColorResources.COLOR_WHITE,
                      size: 25,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      pushNewScreen(
                        context,
                        screen: MessageScreen(),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );

                    },
                    child: Container(
                      height: 58,
                      width: 58,
                      margin: EdgeInsets.only(right: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: ColorResources.COLOR_YELLOW_SEA,
                          borderRadius: BorderRadius.circular(15)),
                      child: Icon(
                        Icons.volume_mute,
                        color: ColorResources.COLOR_WHITE,
                        size: 30,
                      ),
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
