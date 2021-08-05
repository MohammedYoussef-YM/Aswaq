import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';
import 'package:flutter_ui_kit/household_app/utility/images.dart';

class HouseProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HouseHoldColorResources.COLOR_SOLITUDE,
      appBar: AppBar(
        title: Text(Strings.my_profile, style: manropeMedium.copyWith(
          color: HouseHoldColorResources.COLOR_WHITE,
          fontSize: HouseHoldDimensions.FONT_SIZE_LARGE,
        )),
        automaticallyImplyLeading: false,
        backgroundColor: HouseHoldColorResources.COLOR_PRIMARY,
      ),

      body: Padding(
        padding: EdgeInsets.all(HouseHoldDimensions.PADDING_SIZE_LARGE),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

            Align(alignment: Alignment.center, child: ClipOval(child: FadeInImage.assetNetwork(placeholder: Images.place_holder, image: Images.person, width: 200, height: 200, fit: BoxFit.cover))),
            SizedBox(height: HouseHoldDimensions.PADDING_SIZE_LARGE),

            Text(Strings.james_matinia, style: manropeBold.copyWith(fontSize: 25, color: HouseHoldColorResources.COLOR_PRIMARY)),
            SizedBox(height: HouseHoldDimensions.PADDING_SIZE_LARGE),

            Row(children: [
              Icon(Icons.location_on, color: HouseHoldColorResources.COLOR_CRANBERRY, size: 20),
              SizedBox(width: HouseHoldDimensions.PADDING_SIZE_SMALL),
              Text(Strings.new_york_city_town, style: manropeRegular.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),
            ]),
            SizedBox(height: 30),

            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text(Strings.ordered, style: manropeLight),
              Text(Strings.service, style: manropeLight),
              Text(Strings.review, style: manropeLight),
            ]),
            Divider(height: HouseHoldDimensions.PADDING_SIZE_SMALL),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text('45+', style: manropeSemiBold.copyWith(color: HouseHoldColorResources.COLOR_PRIMARY, fontSize: 22)),
              Text('12+', style: manropeSemiBold.copyWith(color: HouseHoldColorResources.COLOR_PRIMARY, fontSize: 22)),
              Text('20+', style: manropeSemiBold.copyWith(color: HouseHoldColorResources.COLOR_PRIMARY, fontSize: 22)),
            ]),
            SizedBox(height: 50),

            Text(Strings.address, style: manropeMedium.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),
            SizedBox(height: HouseHoldDimensions.PADDING_SIZE_SMALL),
            Row(children: [
              Expanded(child: Row(children: [
                Icon(Icons.home_outlined, size: 25),
                SizedBox(width: HouseHoldDimensions.PADDING_SIZE_SMALL),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(Strings.home, style: manropeRegular.copyWith(color: HouseHoldColorResources.COLOR_CRANBERRY)),
                  Text('52, Desai Village', style: manropeLight.copyWith(color: HouseHoldColorResources.COLOR_GREY)),
                ]),
              ])),
              SizedBox(width: HouseHoldDimensions.PADDING_SIZE_SMALL),
              Expanded(child: Row(children: [
                Icon(Icons.work_outline, size: 25),
                SizedBox(width: HouseHoldDimensions.PADDING_SIZE_SMALL),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(Strings.workshop, style: manropeRegular.copyWith(color: HouseHoldColorResources.COLOR_CRANBERRY)),
                  Text('Sector 125, Noida', style: manropeLight.copyWith(color: HouseHoldColorResources.COLOR_GREY)),
                ]),
              ])),
            ]),

          ]),
        ),
      ),
    );
  }
}
