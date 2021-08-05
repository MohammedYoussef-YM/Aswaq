import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/images.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/base/custom_button.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/screens/dashboard/dashboard_screen.dart';

class OrderPlaceScreen extends StatelessWidget {
  final String orderID;

  OrderPlaceScreen({this.orderID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                RestaurantDeliveryBoyImages.done_with_full_background,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(height: 32),
              Text(
                getTranslated('order_successfully_delivered', context),
                style: Theme.of(context).textTheme.headline3.copyWith(fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE, color: Theme.of(context).accentColor),
              ),
              SizedBox(height: 17),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getTranslated('order_id', context),
                    style: Theme.of(context).textTheme.headline2.copyWith(color: Theme.of(context).accentColor),
                  ),
                  Text(
                    ' #$orderID',
                    style: Theme.of(context).textTheme.headline3.copyWith(color: Theme.of(context).accentColor),
                  ),
                ],
              ),
              SizedBox(height: 85),
              CustomButton(
                btnTxt: getTranslated('back_home', context),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>RestaurantDeliveryBoyDashboardScreen()), (route) => false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
