import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/startup_screen.dart';

import 'button/custom_button.dart';

class CompleteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      decoration: BoxDecoration(
          color: ColorResources.COLOR_WHITE,
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 82,
              alignment: Alignment.center,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 82,
                    height: 82,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorResources.COLOR_HOME_BACKGROUND,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(Icons.call, color: ColorResources.COLOR_PRIMARY, size: 34),
                  ),
                  Positioned(
                    top: -5,
                    right: -5,
                    child: CircleAvatar(
                      radius: 13,
                      backgroundColor: ColorResources.COLOR_SPECIALIST_CARD_PRICE,
                      child: Icon(Icons.done, color: ColorResources.COLOR_WHITE,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 62),
            Text(
              Strings.COMPLETED,
              style: khulaBold.copyWith(color: ColorResources.COLOR_GREY, fontSize: 16),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: Strings.YOUR_APPIONTMENT_WITH,
                    style: khulaRegular.copyWith(color: ColorResources.COLOR_GREY),
                  ),
                  TextSpan(
                      text: Strings.DOCTOR_NAME3,
                      style: khulaBold.copyWith(color: ColorResources.COLOR_GREY)),
                  TextSpan(
                    text: Strings.HAS_BEEN__DOCTOR,
                    style: khulaRegular.copyWith(color: ColorResources.COLOR_GREY),
                  ),
                ]),
              ),
            ),
            SizedBox(height: 60),
            Container(
              margin: EdgeInsets.all(15),
              child: CustomButton(
                btnTxt: Strings.GO_TO_DASHBOARD,
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
