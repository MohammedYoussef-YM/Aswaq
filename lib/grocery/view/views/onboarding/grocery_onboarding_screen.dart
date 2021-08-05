import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/grocery/provider/onboarding_provider.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/view/views/auth/grocery_login_screen.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class GroceryOnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<OnboardingProvider>(context, listen: false).initializeBoardingList();

    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      body: Consumer<OnboardingProvider>(
        builder: (context, onBoardingList, child) => Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: onBoardingList.onBoardingList.length,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _pageIndicators(onBoardingList.onBoardingList, onBoardingList.selectedIndex, context),
                          ),
                        ),
                        Positioned(
                          top: 150,
                          left: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                          right: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                          child: Image.asset(
                            onBoardingList.onBoardingList[onBoardingList.selectedIndex].imageUrl,
                            fit: BoxFit.scaleDown,
                            height: 200,),
                        ),
                        Positioned(
                          bottom: 10,
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
                                  style: khulaBold.copyWith(fontSize: 25, color: ColorResources.COLOR_LIGHT_BLACK),
                                ),
                                Text(
                                  onBoardingList.onBoardingList[onBoardingList.selectedIndex].subTitle,
                                  textAlign: TextAlign.center,
                                  style: khulaRegular.copyWith(
                                    color: ColorResources.COLOR_GRAY,
                                  ),
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
            Container(
              margin: EdgeInsets.only(left: 20, right: 20,bottom: 40),
              child: CustomButton(
                btnTxt: onBoardingList.selectedIndex == onBoardingList.onBoardingList.length - 1
                    ? Strings.shopping_now
                    : Strings.shopping_now,
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ( context) => GroceryLoginScreen()));
                },
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
        width: MediaQuery.of(context).size.width / onboardingList.length - 10,
        height: 3,
        decoration:
            BoxDecoration(color: i == index ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_WHITE_GRAY, borderRadius: BorderRadius.circular(5)),
      ));
    }
    return _indicators;
  }
}
