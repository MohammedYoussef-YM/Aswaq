import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/chat_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/video_calling_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AudioCallingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_PRIMARY,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.80,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(45),
                  bottomRight: Radius.circular(45)),
              child: Image.asset(
                'assets/doctor/images/639.jpg',
                fit: BoxFit.fitHeight,
                color: ColorResources.COLOR_PRIMARY.withOpacity(.2),
                colorBlendMode: BlendMode.colorBurn,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.80,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 2,
                bottom: MediaQuery.of(context).size.height *0.20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
              ColorResources.COLOR_SIMPLE_BLUE.withOpacity(.1),
              ColorResources.COLOR_SIMPLE_BLUE.withOpacity(.2),
              ColorResources.COLOR_PRIMARY.withOpacity(.2),
              ColorResources.COLOR_PRIMARY.withOpacity(.5),
              ColorResources.COLOR_PRIMARY.withOpacity(.5),
            ])),
          ),
          Container(
            width: 35,
            height: 35,
            margin: EdgeInsets.only(left: 15, right: 15, top: 40),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: ColorResources.COLOR_WHITE.withOpacity(.6),
                borderRadius: BorderRadius.circular(5)),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: ColorResources.COLOR_PRIMARY,
                size: 17,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.80,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(Strings.DOCTOR_NAME1,style: khulaBold.copyWith(color: ColorResources.COLOR_WHITE, fontSize: 20)),
                Text(Strings.AUDIO_TIME_14_33,style: khulaSemiBold.copyWith(color: ColorResources.COLOR_WHITE)),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.80,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.80,left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 65,
                  width: 65,
                  margin: EdgeInsets.only(right: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: ColorResources.COLOR_WHITE
                          .withOpacity(.22),
                      borderRadius: BorderRadius.circular(8)),
                  child: Image.asset(
                    'assets/doctor/Icon/sound off.png',
                    width: 24,
                    height: 24,
                    fit: BoxFit.fill,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    pushNewScreen(
                      context,
                      screen: ChatScreen(),
                      withNavBar: false, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    );
                  },
                  child: Container(
                    height: 65,
                    width: 65,
                    margin: EdgeInsets.only(right: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorResources.COLOR_WHITE
                            .withOpacity(.22),
                        borderRadius: BorderRadius.circular(8)),
                    child: Image.asset(
                      'assets/doctor/Icon/message.png',
                      width: 24,
                      height: 24,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  height: 65,
                  width: 65,
                  margin: EdgeInsets.only(right: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: ColorResources.COLOR_WHITE
                          .withOpacity(.22),
                      borderRadius: BorderRadius.circular(8)),
                  child: Image.asset(
                    'assets/doctor/Icon/call.png',
                    width: 24,
                    height: 24,
                    fit: BoxFit.fill,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    pushNewScreen(
                      context,
                      screen: VideoCallingScreen(),
                      withNavBar: false, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation: PageTransitionAnimation.cupertino,
                    );
                  },
                  child: Container(
                    height: 65,
                    width: 65,
                    margin: EdgeInsets.only(right: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorResources.COLOR_RED,
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(Icons.call, color: ColorResources.COLOR_WHITE, size: 24),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
