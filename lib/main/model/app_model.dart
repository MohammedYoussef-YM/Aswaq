import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/app.dart';

class AppModel {
  final String title;
  final String description;
  final int screens;
  final Color color;
  final Widget widget;
  final App app;
  final String icons;
  final String version;
  final bool isHome;

  AppModel({this.title, this.description, this.screens, this.color, this.widget, this.app,this.icons,this.version,this.isHome});
}

class ScreenListModel {
  final String screenName;
  final int numOfScreenName;
  final Widget widget;
  final Function onTap;
  final App app;

  ScreenListModel({this.screenName,this.numOfScreenName, this.widget, this.onTap, this.app = App.MAIN});
}

class WidgetsModel{
   final String widgetName;
   final IconData icon;
   final Color iconColor;
   final Widget widgetData;

   WidgetsModel({this.widgetName,this.icon,this.iconColor,this.widgetData});
}