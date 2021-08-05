import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/view/basewidget/arrow_button.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/navigation/widget/navigation_eight.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/navigation/widget/navigation_eleven.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/navigation/widget/navigation_five.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/navigation/widget/navigation_four.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/navigation/widget/navigation_nine.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/navigation/widget/navigation_one.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/navigation/widget/navigation_seven.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/navigation/widget/navigation_six.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/navigation/widget/navigation_ten.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/navigation/widget/navigation_twelve.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/navigation/widget/navigation_two.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/navigation/widget/navigation_three.dart';

class NavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('BottomNavigationBar'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          physics: BouncingScrollPhysics(),
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetArrowButton( widget: NavigationOne(), title: 'Bottom NavigationBar 1'),
              WidgetArrowButton( widget: NavigationTwo(), title: 'Bottom NavigationBar 2'),
              WidgetArrowButton( widget: NavigationThree(), title: 'Bottom NavigationBar 3'),
              WidgetArrowButton( widget: NavigationFour(), title: 'Bottom NavigationBar 4'),
              WidgetArrowButton( widget: NavigationFive(), title: 'Bottom NavigationBar 5'),
              WidgetArrowButton( widget: NavigationSix(), title: 'Bottom NavigationBar 6'),
              WidgetArrowButton( widget: NavigationSeven(), title: 'Bottom NavigationBar 7'),
              WidgetArrowButton( widget: NavigationEight(), title: 'Bottom NavigationBar 8'),
              WidgetArrowButton( widget: NavigationNine(), title: 'Bottom NavigationBar 9'),
              WidgetArrowButton( widget: NavigationTen(), title: 'Bottom NavigationBar 10'),
              WidgetArrowButton( widget: NavigationEleven(), title: 'Bottom NavigationBar 11'),
              WidgetArrowButton( widget: NavigationTwelve(), title: 'Bottom NavigationBar 12'),
            ],
          ),
        ),
      ),
    );
  }
}
