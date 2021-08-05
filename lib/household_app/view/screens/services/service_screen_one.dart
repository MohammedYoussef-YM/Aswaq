import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/provider/service_provider.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';
import 'package:flutter_ui_kit/household_app/view/screens/services/service_screen_two.dart';
import 'package:flutter_ui_kit/household_app/view/screens/services/widget/service_widget.dart';
import 'package:provider/provider.dart';

class ServiceScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _crossAxisSpacing = 16, _mainAxisSpacing = 16, _aspectRatio = 0.78125;
    int _crossAxisCount = 3;

    return Scaffold(
      backgroundColor: HouseHoldColorResources.COLOR_WHITE,
      appBar: AppBar(
        title: Text(
          Strings.all_services,
          style: manropeMedium.copyWith(
            color: HouseHoldColorResources.COLOR_WHITE,
            fontSize: HouseHoldDimensions.FONT_SIZE_LARGE,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: HouseHoldColorResources.COLOR_PRIMARY,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: HouseHoldDimensions.PADDING_SIZE_LARGE,right: HouseHoldDimensions.PADDING_SIZE_LARGE),
        child: Consumer<ServiceProvider>(
          builder: (context, orderDetailsProvider, child) => GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: HouseHoldDimensions.PADDING_SIZE_LARGE,bottom: HouseHoldDimensions.PADDING_SIZE_LARGE),
              physics: BouncingScrollPhysics(),
              itemCount: orderDetailsProvider.getAllService.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _crossAxisCount,
                crossAxisSpacing: _crossAxisSpacing,
                mainAxisSpacing: _mainAxisSpacing,
                childAspectRatio: _aspectRatio,
              ),
              itemBuilder: (context, index) {
                return ServiceWidget(service: orderDetailsProvider.getAllService[index],onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ServiceScreenTwo(selectIndex: index,)));
                },);
              }),
        ),
      ),
    );
  }
}
