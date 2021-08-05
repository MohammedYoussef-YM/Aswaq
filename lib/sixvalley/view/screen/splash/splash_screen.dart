import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/helper/network_info.dart';
import 'package:flutter_ui_kit/sixvalley/provider/auth_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/cart_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/splash_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/theme_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/dashboard/dashboard_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/onboarding/onboarding_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/splash/widget/splash_painter.dart';
import 'package:provider/provider.dart';

class SixSplashScreen extends StatefulWidget {
  @override
  _SixSplashScreenState createState() => _SixSplashScreenState();
}

class _SixSplashScreenState extends State<SixSplashScreen> {

  @override
  void initState() {
    super.initState();
    NetworkInfo.checkConnectivity(context);

    Provider.of<SixSplashProvider>(context, listen: false).initSharedPrefData();
    Provider.of<SixCartProvider>(context, listen: false).getCartData();
    Provider.of<SixSplashProvider>(context, listen: false).initConfig().then((bool isSuccess) {
      if(isSuccess) {
        Timer(Duration(seconds: 1), () {
          if (Provider.of<SixAuthProvider>(context, listen: false).isLoggedIn()) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SixDashBoardScreen()));
          } else {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) =>
                    SixOnBoardingScreen(indicatorColor: ColorResources.GREY, selectedIndicatorColor: ColorResources.COLOR_PRIMARY)));
          }
        });
      }else {
        Provider.of<SixSplashProvider>(context, listen: false).initConfig().then((bool isSuccess) {
          if(isSuccess) {
            if (Provider.of<SixAuthProvider>(context, listen: false).isLoggedIn()) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SixDashBoardScreen()));
            } else {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      SixOnBoardingScreen(indicatorColor: ColorResources.GREY, selectedIndicatorColor: ColorResources.COLOR_PRIMARY)));
            }
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Provider.of<SixThemeProvider>(context).darkTheme ? Colors.black : ColorResources.COLOR_PRIMARY,
            child: CustomPaint(
              painter: SplashPainter(),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(Images.splash_logo, height: 250.0, fit: BoxFit.scaleDown, width: 250.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
