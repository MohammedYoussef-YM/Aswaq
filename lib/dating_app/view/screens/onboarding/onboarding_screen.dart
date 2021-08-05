import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/dating_app/provider/dating_app_onboarding_provider.dart';
import 'package:flutter_ui_kit/dating_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/dating_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/strings.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/auth/welcome_screen.dart';
import 'package:flutter_ui_kit/dating_app/view/widget/custom_button.dart';
import 'package:provider/provider.dart';

class DatingAppOnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<DatingAppOnBoardingProvider>(context, listen: false).initializeOnBoardingData();
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Consumer<DatingAppOnBoardingProvider>(
                  builder: (context, onBoardingList, child) => Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          itemCount: onBoardingList.getAllOnBoardingData.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                                onBoardingList.getAllOnBoardingData[onBoardingList.selectedIndex],
                                fit: BoxFit.scaleDown,
                                width: MediaQuery.of(context).size.width);
                          },
                          onPageChanged: onBoardingList.changeOnboardingIndex,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_DEFAULT),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _pageIndicators(onBoardingList.getAllOnBoardingData, onBoardingList.selectedIndex, context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_LARGE),
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                    Text(Strings.get_connection_with_your_pair, style: robotoMedium.copyWith(fontSize: Dimensions.FONT_SIZE_OVER_LARGE)),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                    Text(Strings.lorem__cont, textAlign: TextAlign.center, style: robotoLight.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
                    SizedBox(height: 80),
                    CustomButton(btnTxt: Strings.find_your_pair,onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>WelcomeScreen()));
                    },)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _pageIndicators(var onboardingList, int index, BuildContext context) {
    List<Container> _indicators = [];
    for (int i = 0; i < onboardingList.length; i++) {
      _indicators.add(Container(
        width: i == index ? 20 : 8,
        height: 6,
        margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_EXTRA_SMALL),
        decoration: BoxDecoration(
            color: i == index ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_GREY_GONDOLA.withOpacity(.7),
            borderRadius: BorderRadius.circular(10)),
      ));
    }
    return _indicators;
  }
}
