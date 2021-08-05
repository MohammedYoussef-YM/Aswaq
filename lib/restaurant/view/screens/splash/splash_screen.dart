import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/provider/cart_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/language/choose_language_screen.dart';
import 'package:provider/provider.dart';

class RestSplashScreen extends StatefulWidget {
  @override
  _RestSplashScreenState createState() => _RestSplashScreenState();
}

class _RestSplashScreenState extends State<RestSplashScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<RestCartProvider>(context, listen: false).getCartData();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => ChooseLanguageScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Images.efood_bike, height: 165),
            SizedBox(height: 45),
            Image.asset(Images.efood, height: 33),
          ],
        ),
      ),
    );
  }
}
