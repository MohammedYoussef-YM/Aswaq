import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/track_model.dart';
import 'package:flutter_ui_kit/restaurant/helper/date_converter.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_button.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/order/order_details_screen.dart';

class CancelDialog extends StatelessWidget {
  final String orderID;
  final String userID;
  final String couponAmount;
  CancelDialog({@required this.orderID, @required this.userID, @required this.couponAmount});
  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
        child: Column(mainAxisSize: MainAxisSize.min, children: [

          Container(
            height: 70, width: 70,
            decoration: BoxDecoration(
              color: ColorResources.getPrimaryColor(context).withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check_circle,
              color: ColorResources.getPrimaryColor(context), size: 50,
            ),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

          Text(
            getTranslated('order_placed_successfully', context),
            style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: Theme.of(context).primaryColor),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('${getTranslated('order_id', context)}:', style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
            SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            Text(orderID, style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
          ]),
          SizedBox(height: 30),

          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.info, color: Theme.of(context).primaryColor),
            Text(
              getTranslated('payment_failed', context),
              style: rubikMedium.copyWith(color: Theme.of(context).primaryColor),
            ),
          ]),
          SizedBox(height: 10),

          Text(
            getTranslated('payment_process_is_interrupted', context),
            style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),

          Row(children: [
            Expanded(child: SizedBox(
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(width: 2, color: Theme.of(context).primaryColor))
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => RestDashboardScreen()), (route) => false);
                },
                child: Text(getTranslated('maybe_later', context), style: rubikBold.copyWith(color: Theme.of(context).primaryColor)),
              ),
            )),
            SizedBox(width: 10),
            Expanded(child: CustomButton(btnTxt: 'Order Details', onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => OrderDetailsScreen(
                orderModel: OrderModel(
                  paymentMethod: '', id: int.parse(orderID), userId: userID, addOnIds: [], couponDiscountAmount: couponAmount,
                  createdAt: DateConverter.localDateToIsoString(DateTime.now()), updatedAt: DateConverter.localDateToIsoString(DateTime.now()),
                  orderStatus: 'pending', paymentStatus: 'unpaid',
                ),
              )));
            })),
          ]),

        ]),
      ),
    );
  }
}
