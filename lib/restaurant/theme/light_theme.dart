import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';

ThemeData restLight = ThemeData(
  fontFamily: 'Rubik',
  primaryColor: Color(0xFFFC6A57),
  brightness: Brightness.light,
  accentColor: Colors.white,
  focusColor: Color(0xFFADC4C8),
  hintColor: Color(0xFF52575C),
  textTheme: TextTheme(
    button: TextStyle(color: Colors.white),

    headline1: TextStyle(fontWeight: FontWeight.w300, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    headline2: TextStyle(fontWeight: FontWeight.w400, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    headline3: TextStyle(fontWeight: FontWeight.w500, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    headline4: TextStyle(fontWeight: FontWeight.w600, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    headline5: TextStyle(fontWeight: FontWeight.w700, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    headline6: TextStyle(fontWeight: FontWeight.w800, fontSize: Dimensions.FONT_SIZE_DEFAULT),
    caption: TextStyle(fontWeight: FontWeight.w900, fontSize: Dimensions.FONT_SIZE_DEFAULT),



    subtitle1: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
    bodyText2: TextStyle(fontSize: 12.0),
    bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
  ),
);