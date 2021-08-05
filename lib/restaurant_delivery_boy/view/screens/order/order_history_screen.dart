import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/helper/date_converter.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/order_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/screens/order/order_details_screen.dart';
import 'package:provider/provider.dart';

class OrderHistoryScreen extends StatelessWidget {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    Provider.of<RestaurantDeliveryBoyOrderProvider>(context, listen: false).getOrderHistory();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: SizedBox.shrink(),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).cardColor,
        title: Text(
          getTranslated('order_history', context),
          style: Theme.of(context).textTheme.headline3.copyWith(color: Theme.of(context).focusColor, fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE),
        ),
      ),
      body: Consumer<RestaurantDeliveryBoyOrderProvider>(
        builder: (context, order, child) => order.allOrderHistory != null
            ? RefreshIndicator(
                child: order.allOrderHistory.length > 0
                    ? ListView.builder(
                        itemCount: order.allOrderHistory.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) => RestaurantDeliveryBoyOrderDetailsScreen(orderModel: order.allOrderHistory[index])));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 13, horizontal: 10),
                                margin: EdgeInsets.only(
                                  bottom: RestaurantDeliveryBoyDimensions.PADDING_SIZE_SMALL,
                                  right: RestaurantDeliveryBoyDimensions.PADDING_SIZE_LARGE,
                                  left: RestaurantDeliveryBoyDimensions.PADDING_SIZE_LARGE,
                                  top: RestaurantDeliveryBoyDimensions.PADDING_SIZE_SMALL,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Theme.of(context).shadowColor.withOpacity(.5), spreadRadius: 1, blurRadius: 2, offset: Offset(0, 1))
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Row(children: [
                                    SizedBox(width: RestaurantDeliveryBoyDimensions.PADDING_SIZE_SMALL),
                                    Expanded(
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${getTranslated('order_id', context)} #${order.allOrderHistory[index].id}',
                                                style:
                                                    rubikMedium.copyWith(fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_SMALL, color: Theme.of(context).focusColor),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Text(getTranslated('amount', context), style: rubikRegular.copyWith(color: Theme.of(context).focusColor)),
                                          ],
                                        ),
                                        SizedBox(height: RestaurantDeliveryBoyDimensions.PADDING_SIZE_EXTRA_SMALL),
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                          Row(
                                            children: [
                                              Text(getTranslated('status', context),
                                                  style: rubikRegular.copyWith(color: Theme.of(context).focusColor)),
                                              Text(getTranslated('${order.allOrderHistory[index].orderStatus}', context),
                                                  style: rubikMedium.copyWith(color: Theme.of(context).primaryColor)),
                                            ],
                                          ),
                                          Text('\$ ${order.allOrderHistory[index].orderAmount}',
                                              style: rubikMedium.copyWith(color: Theme.of(context).primaryColor)),
                                        ]),
                                        SizedBox(height: RestaurantDeliveryBoyDimensions.PADDING_SIZE_SMALL),
                                        Row(children: [
                                          Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).textTheme.bodyText1.color)),
                                          SizedBox(width: RestaurantDeliveryBoyDimensions.PADDING_SIZE_EXTRA_SMALL),
                                          Text(
                                            '${getTranslated('order_at', context)}${DateConverter.isoStringToLocalDateOnly(order.allOrderHistory[index].updatedAt)}',
                                            style: rubikRegular.copyWith(fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_SMALL, color: Theme.of(context).focusColor),
                                          ),
                                        ]),
                                      ]),
                                    ),
                                  ]),
                                ]),
                              ),
                            ))
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 130),
                          child: Text(
                            getTranslated('no_order_found', context)??'',
                            style: Theme.of(context).textTheme.headline3.copyWith(color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                onRefresh: order.refresh,
                displacement: 20,
                color: RestaurantDeliveryBoyColorResources.COLOR_WHITE,
                backgroundColor: Theme.of(context).primaryColor,
                key: _refreshIndicatorKey,
              )
            : Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor))),
      ),
    );
  }
}
