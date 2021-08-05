import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/utility/images.dart';
import 'package:flutter_ui_kit/food/utility/strings.dart';

import 'onboarding_widget.dart';

class FoodOnBoardScreen extends StatefulWidget {
  @override
  FoodOnBoardScreenState createState() {
    return FoodOnBoardScreenState();
  }
}

class FoodOnBoardScreenState extends State<FoodOnBoardScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == 2) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (currentPage < 2 && !lastPage) {
        currentPage++;
      } else {
        currentPage = 2;
        timer.cancel();
      }

      controller.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: PageView(
            children: <Widget>[
              OnBoardingWidget(
                imageUrl: Images.onBoard_burger,
                title: Strings.CHOOSE_YOUR,
                subtitle: Strings.FAVOURITE_FOOD,
                description: Strings.DESCRIPTION_FIRST_PAGE,
                index: 0,
              ),
              OnBoardingWidget(
                imageUrl: Images.onBoard_phone,
                title: Strings.ADD_YOUR,
                subtitle: Strings.ORDERS_TO_CART,
                description: Strings.DESCRIPTION_SECOND_PAGE,
                index: 1,
              ),
              OnBoardingWidget(
                imageUrl: Images.onBoard_bike,
                title: Strings.ORDERS_DELIVERD,
                subtitle: Strings.ON_TIME,
                description: Strings.DESCRIPTION_THIRD_PAGE,
                index: 2,
              ),
            ],
            controller: controller,
            onPageChanged: _onPageChanged,
          ),
        ),
      ),
    );
  }
}
