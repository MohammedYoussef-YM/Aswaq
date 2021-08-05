import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_button.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/track/order_tracking_screen.dart';

class OrderSuccessfulScreen extends StatelessWidget {
  final String orderID;
  final int status;
  OrderSuccessfulScreen({@required this.orderID, this.status = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

        Container(
          height: 100, width: 100,
          decoration: BoxDecoration(
            color: ColorResources.getPrimaryColor(context).withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            status == 0 ? Icons.check_circle : status == 1 ? Icons.sms_failed : Icons.cancel,
            color: ColorResources.getPrimaryColor(context), size: 80,
          ),
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

        Text(
          getTranslated(status == 0 ? 'order_placed_successfully' : status == 1 ? 'order_failed' : 'order_cancelled', context),
          style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('${getTranslated('order_id', context)}:', style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          Text(orderID, style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
        ]),
        SizedBox(height: 30),

        Padding(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
          child: CustomButton(btnTxt: getTranslated(status == 0 ? 'track_order' : 'back_home', context), onTap: () {
            if(status == 0) {
              Navigator.push(context, MaterialPageRoute(builder: (_) => OrderTrackingScreen(orderID: orderID)));
            }else {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => RestDashboardScreen()), (route) => false);
            }
          }),
        ),

      ]),
    );
  }
}
