import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/images.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/startup_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/write_a_review_screen.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/button/custom_button.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class VideoCallingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .80,
            alignment: Alignment.center,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(Strings.CALL_ENDED, style: khulaRegular.copyWith(color: ColorResources.COLOR_GREY, fontSize: 12)),
                  Text(
                    Strings.AUDIO_TIME_23_12,
                    style: khulaSemiBold.copyWith(fontSize: 16, color: ColorResources.COLOR_PRIMARY),
                  ),
                  SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: FadeInImage.assetNetwork(
                      placeholder: Images.place_holder,
                      image: Images.doc_one,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,),
                  ),
                  SizedBox(height: 10),
                  Text(
                    Strings.DOCTOR_NAME3,
                    style: khulaSemiBold.copyWith(color: ColorResources.COLOR_GREY, fontSize: 16),
                  ),
                  SizedBox(height: 20),

                  Container(
                    margin: EdgeInsets.only(left: 40, right: 40),
                    child: CustomButton(
                      btnTxt: Strings.WRITE_A_REVIEW,
                      onTap: () {
                        pushNewScreen(
                          context,
                          screen: WriteAReviewScreen(),
                          withNavBar: false, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation: PageTransitionAnimation.cupertino,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 40),
                    child: CustomButton(
                      btnTxt: Strings.GO_TO_DASHBOARD,
                      isWhiteBackground: true,
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => StartupScreen()), (route) => false);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
