import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/utility/images.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:flutter_ui_kit/academy/view/screen/onboarding/widget/arrow_button.dart';
import 'package:flutter_ui_kit/academy/view/screen/onboarding/widget/on_boarding_widget.dart';
import 'package:flutter_ui_kit/academy/view/screen/auth/log_in_screen.dart';

class AcademyOnBoardingScreen extends StatefulWidget {
  @override
  _AcademyOnBoardingScreenState createState() => _AcademyOnBoardingScreenState();
}

class _AcademyOnBoardingScreenState extends State<AcademyOnBoardingScreen> {
  final List<String> _images = [Images.onboard_1, Images.onboard_2, Images.onboard_3];
  final List<String> _titles = [AcademyStrings.on_board_1, AcademyStrings.on_board_2, AcademyStrings.on_board_3];
  final PageController _pageController = PageController();
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AcademyColorResources.PRIMARY_LIGHT, AcademyColorResources.COLOR_PRIMARY],
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(children: [

            Padding(
              padding: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_LARGE),
              child: Text(AcademyStrings.e_academy, style: robotoBold.copyWith(
                fontSize: 22, color: AcademyColorResources.COLOR_WHITE,
                fontStyle: FontStyle.italic, decoration: TextDecoration.underline,
              )),
            ),

            Expanded(child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return OnBoardingWidget(image: _images[index], title: _titles[index]);
              },
              onPageChanged: (int index) {
                setState(() {
                  _pageIndex = index;
                });
              },
            )),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _indicators(_pageIndex),
            ),

            Padding(
              padding: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_LARGE),
              child: Row(children: [
                _pageIndex != 0 ? ArrowButton(bgColor: AcademyColorResources.COLOR_GREY, icon: Icons.arrow_left, onTap: () {
                  _pageController.animateToPage(_pageIndex - 1, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                }) : SizedBox(),
                Expanded(child: SizedBox()),
                ArrowButton(bgColor: AcademyColorResources.COLOR_ORANGE, icon: _pageIndex == _images.length-1 ? Icons.check : Icons.arrow_right, onTap: () {
                  if(_pageIndex < 2) {
                    _pageController.animateToPage(_pageIndex + 1, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                  }else {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AcademyLogInScreen()));
                  }
                }),
              ]),
            ),

          ]),
        ),
      ),
    );
  }

  List<Widget> _indicators(int _pageIndex) {
    List<Widget> indicatorList = [];
    for(int index = 0; index < 3; index++) {
      indicatorList.add(TabPageSelectorIndicator(
        backgroundColor: index == _pageIndex ? AcademyColorResources.COLOR_ORANGE : AcademyColorResources.COLOR_WHITE,
        borderColor: index == _pageIndex ? AcademyColorResources.COLOR_ORANGE : AcademyColorResources.COLOR_WHITE,
        size: 15,
      ));
    }
    return indicatorList;
  }
}
