import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/driver_app/view/widget/custom_button.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/driver_app/provider/driverapp_onboarding_provider.dart';
import 'package:flutter_ui_kit/driver_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/driver_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/driver_app/utility/strings.dart';
import 'package:flutter_ui_kit/driver_app/view/view/auth/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DriverAppOnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<DriveAppOnBoardingProvider>(context, listen: false).initializeBoardingList();
    Provider.of<DriveAppOnBoardingProvider>(context, listen: false).changeOnboardingIndex(0);
    PageController controller = PageController(viewportFraction: 1, keepPage: true);
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      body: Consumer<DriveAppOnBoardingProvider>(
        builder: (context, onBoardingList, child) => Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: onBoardingList.onBoardingList.length,
                controller: controller,
                itemBuilder: (context, index) {
                  return SafeArea(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                              left: Dimensions.PADDING_SIZE_DEFAULT,
                              right: Dimensions.PADDING_SIZE_DEFAULT),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              onBoardingList.selectedIndex == 2
                                  ? SizedBox.shrink()
                                  : InkWell(
                                      onTap: () {
                                        onBoardingList.changeOnboardingIndex(2);
                                        controller.jumpToPage(2);
                                      },
                                      child: Text(Strings.skip, style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_GRAY_LIGHT))),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 100,
                          left: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                          right: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                          child:Image.asset(
                              onBoardingList.onBoardingList[onBoardingList.selectedIndex].imageUrl,
                              fit: BoxFit.scaleDown,
                              height: 200) ,
                        ),
                        Positioned(
                          top: 250,
                          left: 0,
                          right: 0,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: Dimensions.PADDING_SIZE_LARGE,
                              right: Dimensions.PADDING_SIZE_LARGE,
                              bottom: Dimensions.PADDING_SIZE_LARGE,
                              top: 100,
                            ),
                            decoration: BoxDecoration(color: ColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              children: [
                                Text(
                                  onBoardingList.onBoardingList[onBoardingList.selectedIndex].title,
                                  style: poppinsSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE, color: ColorResources.COLOR_GRAY_LIGHT),
                                ),
                                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                                Text(
                                  onBoardingList.onBoardingList[onBoardingList.selectedIndex].description,
                                  textAlign: TextAlign.center,
                                  style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                onPageChanged: onBoardingList.changeOnboardingIndex,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: onBoardingList.selectedIndex == 0
                      ? SizedBox.shrink()
                      : InkWell(
                          onTap: () {
                            int selectIndex = onBoardingList.selectedIndex;
                            onBoardingList.changeOnboardingIndex(selectIndex--);
                            controller.jumpToPage(selectIndex--);
                          },
                          child: Text(Strings.previous,
                              textAlign: TextAlign.center,
                              style: poppinsSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: ColorResources.COLOR_GRAY_LIGHT)),
                        ),
                ),
                Expanded(
                  child: Container(
                    width: 80,
                    height: 80,
                    child: SfRadialGauge(axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: 1,
                        showLabels: false,
                        showTicks: false,
                        startAngle: 90,
                        endAngle: 90,
                        radiusFactor: 0.7,
                        axisLineStyle: AxisLineStyle(
                          thickness: 0.2,
                          color: ColorResources.COLOR_GRAY.withOpacity(.1),
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                        pointers: <GaugePointer>[
                          RangePointer(
                            value: (onBoardingList.selectedIndex + 1) / onBoardingList.onBoardingList.length,
                            width: 0.2,
                            pointerOffset: 0.07,
                            color: ColorResources.COLOR_PRIMARY,
                            sizeUnit: GaugeSizeUnit.factor,
                          )
                        ],
                      ),
                    ]),
                  ),
                ),
                Expanded(
                  child: onBoardingList.selectedIndex == 2
                      ? SizedBox.shrink()
                      : InkWell(
                          onTap: () {
                            int selectIndex = onBoardingList.selectedIndex;
                            onBoardingList.changeOnboardingIndex(selectIndex++);
                            controller.jumpToPage(selectIndex++);
                          },
                          child: Text(Strings.next,
                              textAlign: TextAlign.center,
                              style: poppinsSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: ColorResources.COLOR_GRAY_LIGHT)),
                        ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 40),
              child: onBoardingList.selectedIndex != 2
                  ? Container(
                      height: 45,
                    )
                  : CustomButton(
                      btnTxt: onBoardingList.selectedIndex == onBoardingList.onBoardingList.length - 1 ? Strings.lets_enjoy : Strings.lets_enjoy,
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => WelcomeScreen()));
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
