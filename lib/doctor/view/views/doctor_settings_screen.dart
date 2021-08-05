import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/profile_edit_screen.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/select_a_language_widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'faq_screen.dart';
import 'favourite_doctors.dart';
import 'invite_a_friend_screen.dart';
import 'membership_screen.dart';
import 'notification_screen.dart';

class DoctorSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: Text(Strings.SETTINGS,style: khulaSemiBold.copyWith(color: ColorResources.COLOR_GREY, fontSize: 16)),
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    height: 100,
                    decoration: BoxDecoration(
                        color: ColorResources.COLOR_PRIMARY,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ColorResources.COLOR_WHITE,
                              borderRadius: BorderRadius.circular(7)),
                          child: Icon(Icons.person, color: ColorResources.COLOR_PRIMARY, size: 45),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                            child: Text(
                          Strings.NAME6,
                          style: khulaSemiBold.copyWith(color: ColorResources.COLOR_WHITE, fontSize: 16),
                        )),
                        GestureDetector(
                          onTap: () {
                            pushNewScreen(
                              context,
                              screen: ProfileEditScreen(fromSetting: true),
                              withNavBar: false,
                              // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                          child: Image.asset(
                            'assets/doctor/Icon/edit.png',
                            width: 25,
                            height: 25,
                            fit: BoxFit.scaleDown,
                          ),
                        )
                      ],
                    ),
                  ),
                  PageButton(
                      imageUrl: 'assets/doctor/Icon/crown.png',
                      title: Strings.BECOME_PRO_MEMBER,
                      color: ColorResources.COLOR_YELLOW_SEA,
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: MemberShipScreen(),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                  PageButton(
                      imageUrl: 'assets/doctor/Icon/notification blue.png',
                      title: Strings.NOTIFICATION,
                      color: ColorResources.COLOR_MAYA_BLUE,
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: DoctorNotificationScreen(),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                  PageButton(
                      imageUrl: 'assets/doctor/Icon/language.png',
                      title: Strings.LANGUAGE,
                      color: ColorResources.COLOR_CONFLOWER_BLUE,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: SelectALanguageWidget(),
                            );
                          });
                    },
                  ),
                  PageButton(
                      imageUrl: 'assets/doctor/Icon/user yellow.png',
                      title: Strings.INVITE,
                      color: ColorResources.COLOR_SPECIALIST_CARD_PRICE,
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: InviteAFriendScreen(),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                        PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                  PageButton(
                      imageUrl: 'assets/doctor/Icon/love green.png',
                      title: Strings.FAVOURTITE_DOCTORS,
                      color: ColorResources.COLOR_DEEP_SEA,
                    onTap: (){
                      pushNewScreen(
                        context,
                        screen: FavouriteDoctors(),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                  PageButton(
                      imageUrl: 'assets/doctor/Icon/FAQ.png',
                      title: Strings.FAQ, color: ColorResources.COLOR_ROYAL_BLUE,
                    onTap: (){
                      pushNewScreen(
                        context,
                        screen: FAQScreen(),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                  PageButton(
                      imageUrl: 'assets/doctor/Icon/question.png',
                      title: Strings.HELP,
                      color: ColorResources.COLOR_COLUMBIA_BLUE),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class PageButton extends StatelessWidget {
  final String imageUrl;
  final Color color;
  final String title;
  final Function onTap;
  PageButton({@required this.imageUrl, @required this.color, @required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_DEFAULT),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: 50,
          height: 50,
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: color.withOpacity(.14),
              borderRadius: BorderRadius.circular(15)),
          child: Image.asset(imageUrl),
        ),
        title: Text(title, style: khulaSemiBold.copyWith(color: ColorResources.COLOR_GREY, fontSize: 16)),
      ),
    );
  }
}

