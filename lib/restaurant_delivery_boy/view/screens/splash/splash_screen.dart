import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/language_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/location_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/order_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/profile_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/images.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/screens/language/choose_language_screen.dart';
import 'package:provider/provider.dart';

class RestaurantDeliveryBoySplashScreen extends StatefulWidget {
  @override
  _RestaurantDeliveryBoySplashScreenState createState() => _RestaurantDeliveryBoySplashScreenState();
}

class _RestaurantDeliveryBoySplashScreenState extends State<RestaurantDeliveryBoySplashScreen> {

  @override
  void initState() {
    super.initState();

    Provider.of<RestaurantDeliveryBoyLanguageProvider>(context, listen: false).initializeAllLanguages(context);
    Provider.of<RestaurantDeliveryBoyOrderProvider>(context, listen: false).getAllOrders();
    Provider.of<RestaurantDeliveryBoyProfileProvider>(context, listen: false).getUserInfo();
    Provider.of<RestaurantDeliveryBoyLocationProvider>(context, listen: false).getUserLocation();

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
            Image.asset(RestaurantDeliveryBoyImages.efood_bike, height: 165),
            SizedBox(height: 45),
            Image.asset(
              RestaurantDeliveryBoyImages.efood,
              height: 33,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
