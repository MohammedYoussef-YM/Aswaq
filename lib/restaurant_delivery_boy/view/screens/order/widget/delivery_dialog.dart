import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/app.dart';
import 'package:flutter_ui_kit/main/main_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/order_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/images.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/base/custom_button.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/screens/order/order_place_screen.dart';
import 'package:provider/provider.dart';

class DeliveryDialog extends StatelessWidget {
  final Function onTap;
  final int orderId;
  final double totalPrice;
  final int index;
  final bool isFromAllAppScreen;

  DeliveryDialog({@required this.onTap, this.totalPrice, this.orderId, this.index, this.isFromAllAppScreen = false});

  @override
  Widget build(BuildContext context) {
    //Provider.of<MainProvider>(context, listen: false).setThemeAndLocale(App.RESTAURANT_DELIVERY_BOY, context);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(RestaurantDeliveryBoyDimensions.PADDING_SIZE_SMALL),
            border: Border.all(color: Theme.of(context).primaryColor, width: 0.2)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Image.asset(RestaurantDeliveryBoyImages.money),
                SizedBox(height: 30),
                Center(
                    child: Text(
                  isFromAllAppScreen?"Do You Collect Money":getTranslated('do_you_collect_money', context),
                  style: Theme.of(context).textTheme.headline3.copyWith(color: Theme.of(context).focusColor),
                )),
                SizedBox(height: 25),
                Center(
                    child: Text(
                  '\$ $totalPrice',
                  style: Theme.of(context).textTheme.headline3.copyWith(color: Theme.of(context).focusColor, fontSize: 30),
                )),
                SizedBox(height: 45),
                Row(
                  children: [
                    Expanded(
                        child: CustomButton(
                      btnTxt: isFromAllAppScreen?"No":getTranslated('no', context),
                      isShowBorder: true,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    )),
                    SizedBox(width: RestaurantDeliveryBoyDimensions.PADDING_SIZE_DEFAULT),
                    Expanded(
                        child: Consumer<RestaurantDeliveryBoyOrderProvider>(
                      builder: (context, order, child) => CustomButton(
                        btnTxt: isFromAllAppScreen?"Yes":getTranslated('yes', context),
                        onTap: () {
                          if(isFromAllAppScreen){
                            Provider.of<MainProvider>(context, listen: false).setThemeAndLocale(App.MAIN, context);
                            Navigator.of(context).pop();
                          }else{
                            Provider.of<RestaurantDeliveryBoyOrderProvider>(context, listen: false).removeOrder(index: index);
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => OrderPlaceScreen(orderID: orderId.toString())));
                          }

                        },
                      ),
                    )),
                  ],
                ),
              ],
            ),
            Positioned(
              right: -20,
              top: -20,
              child: IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.clear, size: RestaurantDeliveryBoyDimensions.PADDING_SIZE_LARGE),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
