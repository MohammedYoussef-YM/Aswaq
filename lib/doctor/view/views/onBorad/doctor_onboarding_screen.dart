import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/provider/onboarding_provider.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/views/auth/auth_screen.dart';
import 'package:provider/provider.dart';

class DoctorOnBoardingScreen extends StatefulWidget {
  final Color indicatorColor;
  final Color selectedIndicatorColor;

  DoctorOnBoardingScreen({
    this.indicatorColor = Colors.grey,
    this.selectedIndicatorColor = Colors.black,
  });

  @override
  _DoctorOnBoardingScreenState createState() => _DoctorOnBoardingScreenState();
}

class _DoctorOnBoardingScreenState extends State<DoctorOnBoardingScreen> {
  PageController _pageController = PageController();
  int selectedIndex = 0;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: Consumer<OnBoardingProvider>(
        builder: (context, onboardingList, child) => Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: onboardingList.getOnBoardingList().length,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return SafeArea(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          onboardingList.getOnBoardingList()[index].imageUrl,
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height*0.80,
                        ),

                        Positioned(
                          bottom:10,
                          left:0,
                          right:0,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: Dimensions.MARGIN_SIZE_EXTRA_LARGE,
                              right: Dimensions.MARGIN_SIZE_EXTRA_LARGE,
                              bottom: Dimensions.MARGIN_SIZE_EXTRA_LARGE,
                              top: 100,
                            ),
                            decoration: BoxDecoration(color: ColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  onboardingList.getOnBoardingList()[index].title,
                                  style: khulaBold.copyWith(fontSize: 20, color: ColorResources.COLOR_GREY),
                                ),
                                Text(
                                  onboardingList.getOnBoardingList()[index].description,
                                  textAlign: TextAlign.center,
                                  style: khulaRegular.copyWith(
                                    color: ColorResources.COLOR_GREY,
                                  ),
                                ),
                                SizedBox(
                                  height: Dimensions.MARGIN_SIZE_LARGE,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: _pageIndicators(onboardingList.getOnBoardingList()),
                                  ),
                                ),
                                Container(
                                  height: 45,
                                  width: double.infinity,
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: ColorResources.COLOR_PRIMARY,
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      if (selectedIndex == onboardingList.getOnBoardingList().length - 1) {
                                        Navigator.of(context)
                                            .pushReplacement(MaterialPageRoute(builder: (BuildContext context) => AuthScreen()));
                                      } else {
                                        setState(() {
                                          _pageController.jumpToPage(++selectedIndex);
                                        });
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      child: Text(
                                        selectedIndex == onboardingList.getOnBoardingList().length - 1
                                            ? Strings.GET_STARTED
                                            : Strings.NEXT,
                                        style: khulaSemiBold.copyWith(
                                            color: ColorResources.COLOR_WHITE, fontSize: Dimensions.FONT_SIZE_DEFAULT),
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) => AuthScreen()));
                                  },
                                  child: Text(
                                    Strings.SKIP_FOR_NOW,
                                    style: khulaRegular.copyWith(
                                      fontSize: Dimensions.FONT_SIZE_SMALL,
                                      color: ColorResources.COLOR_GREY,
                                    ),
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
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _pageIndicators(var onboardingList) {
    List<Container> _indicators = [];
    for (int i = 0; i < onboardingList.length; i++) {
      _indicators.add(Container(
        width: i == selectedIndex ? 18 : 7,
        height: 7,
        margin: EdgeInsets.only(right: 5),
        child: i == selectedIndex
            ? Image.asset(
                'assets/doctor/images/onboard_dot_active.png',
                width: 9,
                height: 9,
                color: ColorResources.COLOR_PRIMARY,
              )
            : Image.asset(
                'assets/doctor/images/onboard_dot_active.png',
                width: 9,
                height: 9,
                color: ColorResources.COLOR_PRIMARY.withOpacity(.5),
              ),
      ));
    }
    return _indicators;
  }
}

