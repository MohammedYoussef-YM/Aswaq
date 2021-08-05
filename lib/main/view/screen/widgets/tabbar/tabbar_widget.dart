import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/view/basewidget/arrow_button.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/tabbar/widget/custom_tabbar.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/tabbar/widget/icon_tabbar.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/tabbar/widget/simple_tabbar.dart';

class TabBarWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('TabBar Widget'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              WidgetArrowButton(widget:SimpleTabBar() ,title: 'SimpleTabBar'),
              WidgetArrowButton(widget:IconTabBar() ,title: 'IconTabBar'),
              WidgetArrowButton(widget:CustomTabBar() ,title: 'CustomTabBar'),

            ],
          )),
    );
  }
}
