import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/images.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';
import 'package:flutter_ui_kit/household_app/view/screens/location/location_screen.dart';
import 'package:flutter_ui_kit/household_app/view/widget/custom_button.dart';

class ChoiceLocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(HouseHoldDimensions.PADDING_SIZE_LARGE),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             Image.asset(Images.onboarding_map,fit: BoxFit.fill,),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: HouseHoldDimensions.PADDING_SIZE_LARGE, right: HouseHoldDimensions.PADDING_SIZE_LARGE),
                child: Text(
                  Strings.set_your_location_where_you,
                  textAlign: TextAlign.center,
                  style: manropeLight.copyWith(
                    color: HouseHoldColorResources.COLOR_CHARCOAL_HINT,
                  ),
                ),
              ),
              SizedBox(height: 80),
              CustomButton(
                btnTxt: Strings.choose_location_on_map,
                isIcon: true,
                imageUrl: Images.my_location,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => LocationScreen()));
                },
              ),
              SizedBox(height: 25),
              CustomButton(
                btnTxt: Strings.at_my_current_location,
                isIcon: true,
                imageUrl: Images.map_view,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
