import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui_kit/household_app/provider/house_home_provider.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';

class AllServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.all_services, style: manropeMedium.copyWith(color: HouseHoldColorResources.COLOR_WHITE, fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),
        automaticallyImplyLeading: false,
        backgroundColor: HouseHoldColorResources.COLOR_PRIMARY,
      ),
      body: Consumer<HouseHomeProvider>(
        builder: (context, home, child) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: (1/1.3),
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.all(HouseHoldDimensions.PADDING_SIZE_LARGE),
            itemCount: home.serviceList.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(color: HouseHoldColorResources.COLOR_PRIMARY, borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  Expanded(flex: 7, child: Image.asset(home.serviceList[index].icon)),
                  Expanded(
                    flex: 3,
                    child: Text(home.serviceList[index].title, style: manropeRegular.copyWith(
                      fontSize: HouseHoldDimensions.FONT_SIZE_LARGE,
                      color: HouseHoldColorResources.COLOR_WHITE,
                    )),
                  ),
                ]),
              );
            },
          );
        },
      ),
    );
  }
}
