import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';
import 'package:flutter_ui_kit/household_app/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_ui_kit/household_app/view/widget/custom_button.dart';

class OrderPlacedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HouseHoldColorResources.COLOR_PRIMARY,
        title: Text(Strings.order_placed),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: HouseHoldColorResources.COLOR_WHITE), onPressed: () => Navigator.pop(context)),
      ),
      body: Column(children: [
        Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.check_box, color: HouseHoldColorResources.COLOR_CRANBERRY, size: 100),
          SizedBox(height: 5),
          Text(Strings.awesome, style: manropeMedium.copyWith(
            fontSize: HouseHoldDimensions.FONT_SIZE_LARGE,
            color: HouseHoldColorResources.COLOR_CRANBERRY,
          )),
          SizedBox(height: 10),
          Text(Strings.order_placed_successfully, style: manropeRegular.copyWith(
            fontSize: HouseHoldDimensions.FONT_SIZE_SMALL,
          )),
          SizedBox(height: 30),
          Text(Strings.will_reach, style: manropeMedium.copyWith(
            fontSize: HouseHoldDimensions.FONT_SIZE_LARGE,
          )),
        ])),
        Padding(
          padding: EdgeInsets.all(HouseHoldDimensions.PADDING_SIZE_LARGE),
          child: CustomButton(btnTxt: Strings.done, onTap: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => HouseDashboardScreen()), (route) => false);
          }),
        ),
      ]),
    );
  }
}
