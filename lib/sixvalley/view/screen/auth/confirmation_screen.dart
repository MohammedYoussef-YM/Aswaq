import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/repository/onboarding_repo.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';
import 'package:flutter_ui_kit/sixvalley/utill/string_resources.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/dashboard/dashboard_screen.dart';

class ConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset('assets/images/onboarding_image_three.png'),
                  ),
                  Text(Strings.CONFIRM_YOUR_MAIL, style: titilliumBold.copyWith(fontSize: 30, color: ColorResources.BLACK)),
                  Text(description, textAlign: TextAlign.center, style: titilliumRegular),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 70),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(left: 70, right: 70),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: LinearGradient(colors: [ColorResources.COLOR_PRIMARY, ColorResources.COLOR_BLUE, ColorResources.COLOR_BLUE])),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SixDashBoardScreen()));
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(Strings.START, style: titilliumSemiBold.copyWith(
                        color: ColorResources.WHITE,
                        fontSize: Dimensions.FONT_SIZE_LARGE,
                      )),
                    ),
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
