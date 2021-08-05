import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/model/response/order_details_model.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/model/response/order_model.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/helper/price_converter.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/localization_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/location_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/order_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/images.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/base/custom_button.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/screens/home/widget/order_widget.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/screens/order/widget/delivery_dialog.dart';
import 'package:provider/provider.dart';
import 'package:slider_button/slider_button.dart';

class RestaurantDeliveryBoyOrderDetailsScreen extends StatelessWidget {
  final OrderModel orderModel;
  final int index;

  RestaurantDeliveryBoyOrderDetailsScreen({this.orderModel, this.index});

  @override
  Widget build(BuildContext context) {
    Provider.of<RestaurantDeliveryBoyOrderProvider>(context, listen: false).getOrderDetails();
    double deliveryCharge = double.parse('120');

    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).focusColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          getTranslated('order_details', context),
          style: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE, color: Theme.of(context).focusColor),
        ),
      ),
      body: Consumer<RestaurantDeliveryBoyOrderProvider>(
        builder: (context, order, child) {
          double _subTotal = 0;
          double _discount = 0;
          double _tax = 0;
          double _addOns = 0;
          if (order.orderDetails != null) {
            order.orderDetails.forEach((orderDetails) {
              orderDetails.addOnIds.forEach((addOnId) {
                orderDetails.productDetails.addOns.forEach((addOn) {
                  if (addOn.id == addOnId) {
                    _addOns = _addOns + double.parse(addOn.price);
                  }
                });
              });
              _subTotal = _subTotal + (double.parse(orderDetails.price) * int.parse(orderDetails.quantity));
              _discount = _discount + double.parse(orderDetails.discountOnProduct);
              _tax = _tax + double.parse(orderDetails.taxAmount);
            });
          }
          double totalPrice = _subTotal + _addOns - _discount + _tax + deliveryCharge - double.parse(orderModel.couponDiscountAmount);

          return order.orderDetails != null
              ? Padding(
                  padding: const EdgeInsets.all(RestaurantDeliveryBoyDimensions.PADDING_SIZE_LARGE),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(RestaurantDeliveryBoyDimensions.PADDING_SIZE_SMALL),
                    children: [
                      Row(children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('${getTranslated('order_id', context)}', style: rubikRegular.copyWith(color: Theme.of(context).accentColor)),
                              Text(' # ${orderModel.id}', style: rubikMedium.copyWith(color: Theme.of(context).accentColor)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.watch_later, size: 17),
                              SizedBox(width: RestaurantDeliveryBoyDimensions.PADDING_SIZE_EXTRA_SMALL),
                              Text('122221', style: rubikRegular.copyWith(color: Theme.of(context).accentColor)),
                            ],
                          ),
                        ),
                      ]),
                      SizedBox(height: RestaurantDeliveryBoyDimensions.PADDING_SIZE_LARGE),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Text('${getTranslated('item', context)}:', style: rubikRegular.copyWith(color: Theme.of(context).accentColor)),
                            SizedBox(width: RestaurantDeliveryBoyDimensions.PADDING_SIZE_EXTRA_SMALL),
                            Text(order.orderDetails.length.toString(), style: rubikMedium.copyWith(color: Theme.of(context).primaryColor)),
                          ]),
                          orderModel.orderStatus == 'processing' || orderModel.orderStatus == 'out_for_delivery'
                              ? Row(children: [
                                  Text('${getTranslated('payment_status', context)}:',
                                      style: rubikRegular.copyWith(color: Theme.of(context).accentColor)),
                                  SizedBox(width: RestaurantDeliveryBoyDimensions.PADDING_SIZE_EXTRA_SMALL),
                                  Text(getTranslated('${orderModel.paymentStatus}', context),
                                      style: rubikMedium.copyWith(color: Theme.of(context).primaryColor)),
                                ])
                              : SizedBox.shrink(),
                        ],
                      ),
                      Divider(height: 40),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: order.orderDetails.length,
                        itemBuilder: (context, index) {
                          List<AddOns> _addOns = [];
                          order.orderDetails[index].productDetails.addOns.forEach((addOn) {
                            if (order.orderDetails[index].addOnIds.contains(addOn.id)) {
                              _addOns.add(addOn);
                            }
                          });
                          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Row(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: FadeInImage.assetNetwork(placeholder: RestaurantDeliveryBoyImages.placeholder, image:  order.orderDetails[index].productDetails.image, height: 70, width: 80, fit: BoxFit.cover)
                              ),
                              SizedBox(width: RestaurantDeliveryBoyDimensions.PADDING_SIZE_SMALL),
                              Expanded(
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          order.orderDetails[index].productDetails.name,
                                          style: rubikMedium.copyWith(
                                              fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_SMALL, color: Theme.of(context).accentColor),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(getTranslated('amount', context), style: rubikRegular.copyWith(color: Theme.of(context).accentColor)),
                                    ],
                                  ),
                                  SizedBox(height: RestaurantDeliveryBoyDimensions.PADDING_SIZE_EXTRA_SMALL),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                    Row(
                                      children: [
                                        Text('${getTranslated('quantity', context)}:',
                                            style: rubikRegular.copyWith(color: Theme.of(context).accentColor)),
                                        Text(' ${order.orderDetails[index].quantity}',
                                            style: rubikMedium.copyWith(color: Theme.of(context).primaryColor)),
                                      ],
                                    ),
                                    Text('\$ ${order.orderDetails[index].price}', style: rubikMedium.copyWith(color: Theme.of(context).primaryColor)),
                                  ]),
                                  SizedBox(height: RestaurantDeliveryBoyDimensions.PADDING_SIZE_SMALL),
                                  Row(children: [
                                    Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).textTheme.bodyText1.color)),
                                    SizedBox(width: RestaurantDeliveryBoyDimensions.PADDING_SIZE_EXTRA_SMALL),
                                    Text(
                                      '${getTranslated('order_at', context)}',
                                      style: rubikRegular.copyWith(
                                          fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_SMALL, color: Theme.of(context).accentColor),
                                    ),
                                  ]),
                                ]),
                              ),
                            ]),
                            _addOns.length > 0
                                ? SizedBox(
                                    height: 30,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics: BouncingScrollPhysics(),
                                      padding: EdgeInsets.only(top: RestaurantDeliveryBoyDimensions.PADDING_SIZE_SMALL),
                                      itemCount: _addOns.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(right: RestaurantDeliveryBoyDimensions.PADDING_SIZE_SMALL),
                                          child: Row(children: [
                                            Text(_addOns[index].name, style: rubikRegular.copyWith(color: Theme.of(context).accentColor)),
                                            SizedBox(width: 2),
                                            Text('${_addOns[index].price}\$', style: rubikMedium.copyWith(color: Theme.of(context).accentColor)),
                                          ]),
                                        );
                                      },
                                    ),
                                  )
                                : SizedBox(),
                            Divider(height: 40),
                          ]);
                        },
                      ),

                      // Total
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text(getTranslated('subtotal', context),
                            style: rubikRegular.copyWith(
                                fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE, color: Theme.of(context).accentColor)),
                        Text(PriceConverter.convertPrice(context, _subTotal),
                            style: rubikRegular.copyWith(
                                fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE, color: Theme.of(context).accentColor)),
                      ]),
                      SizedBox(height: 10),

                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text(getTranslated('addons', context),
                            style: rubikRegular.copyWith(
                                fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE, color: Theme.of(context).accentColor)),
                        Text('(+) ${PriceConverter.convertPrice(context, _addOns)}',
                            style: rubikRegular.copyWith(
                                fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE, color: Theme.of(context).accentColor)),
                      ]),
                      SizedBox(height: 10),

                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text(getTranslated('discount', context),
                            style: rubikRegular.copyWith(
                                fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE, color: Theme.of(context).accentColor)),
                        Text('(-) ${PriceConverter.convertPrice(context, _discount)}',
                            style: rubikRegular.copyWith(
                                fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE, color: Theme.of(context).accentColor)),
                      ]),
                      SizedBox(height: 10),

                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text(getTranslated('tax', context),
                            style: rubikRegular.copyWith(
                                fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE, color: Theme.of(context).accentColor)),
                        Text('(+) ${PriceConverter.convertPrice(context, _tax)}',
                            style: rubikRegular.copyWith(
                                fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE, color: Theme.of(context).accentColor)),
                      ]),
                      SizedBox(height: 10),

                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text(getTranslated('coupon_discount', context),
                            style: rubikRegular.copyWith(
                                fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE, color: Theme.of(context).accentColor)),
                        Text(
                          '(-) ${PriceConverter.convertPrice(context, double.parse(orderModel.couponDiscountAmount))}',
                          style:
                              rubikRegular.copyWith(fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE, color: Theme.of(context).accentColor),
                        ),
                      ]),
                      SizedBox(height: 10),

                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text(getTranslated('delivery_fee', context),
                            style: rubikRegular.copyWith(
                                fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE, color: Theme.of(context).accentColor)),
                        Text('(+) ${PriceConverter.convertPrice(context, deliveryCharge)}',
                            style: rubikRegular.copyWith(
                                fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE, color: Theme.of(context).accentColor)),
                      ]),
                      SizedBox(height: 10),
                      Divider(),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text(getTranslated('total_amount', context),
                            style: rubikMedium.copyWith(
                                fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE, color: Theme.of(context).primaryColor)),
                        Text(
                          PriceConverter.convertPrice(context, totalPrice),
                          style:
                              rubikMedium.copyWith(fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE, color: Theme.of(context).primaryColor),
                        ),
                      ]),
                      SizedBox(height: 30),

                      orderModel.orderStatus == 'processing' || orderModel.orderStatus == 'out_for_delivery'
                          ? Consumer<RestaurantDeliveryBoyLocationProvider>(
                              builder: (context, locationProvider, child) => CustomButton(
                                  btnTxt: getTranslated('direction', context),
                                  onTap: () {
                                    MapUtils.openMap(
                                        double.parse(orderModel.deliveryAddress.latitude) ?? 23.8103,
                                        double.parse(orderModel.deliveryAddress.longitude) ?? 90.4125,
                                        locationProvider.currentLocation.latitude ?? 23.81,
                                        locationProvider.currentLocation.longitude ?? 90.4125);
                                  }),
                            )
                          : SizedBox.shrink(),

                      // for swipe to start delivery
                      SizedBox(height: 40),
                      orderModel.orderStatus == 'processing'
                          ? Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(RestaurantDeliveryBoyDimensions.PADDING_SIZE_SMALL),
                                border: Border.all(color: Theme.of(context).dividerColor.withOpacity(.05)),
                                color: Theme.of(context).backgroundColor,
                              ),
                              child: Transform.rotate(
                                angle: Provider.of<RestaurantDeliveryBoyLocalizationProvider>(context).isLtr ? pi * 2 : pi, // in radians
                                child: Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: SliderButton(
                                    action: () {
                                      Provider.of<RestaurantDeliveryBoyOrderProvider>(context, listen: false)
                                          .updateOrderStatus(status: 'out_for_delivery', index: index);
                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(builder: (_) => RestaurantDeliveryBoyDashboardScreen()));
                                    },

                                    ///Put label over here
                                    label: Text(
                                      getTranslated('swip_to_deliver_order', context),
                                      style: Theme.of(context).textTheme.headline3.copyWith(color: Theme.of(context).primaryColor),
                                    ),
                                    icon: Center(
                                        child: Icon(
                                      Icons.double_arrow_sharp,
                                      color: Colors.white,
                                      size: 20.0,
                                      semanticLabel: 'Text to announce in accessibility modes',
                                    )),

                                    ///Change All the color and size from here.
                                    radius: 10,
                                    boxShadow: BoxShadow(blurRadius: 0.0),
                                    buttonColor: Theme.of(context).primaryColor,
                                    backgroundColor: Theme.of(context).backgroundColor,
                                    baseColor: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            )
                          : orderModel.orderStatus == 'out_for_delivery'
                              ? Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(RestaurantDeliveryBoyDimensions.PADDING_SIZE_SMALL),
                                    border: Border.all(color: Theme.of(context).dividerColor.withOpacity(.05)),
                                    color: Theme.of(context).backgroundColor,
                                  ),
                                  child: Transform.rotate(
                                    angle: Provider.of<RestaurantDeliveryBoyLocalizationProvider>(context).isLtr ? pi * 2 : pi, // in radians
                                    child: Directionality(
                                      textDirection: TextDirection.ltr, // set it to rtl
                                      child: SliderButton(
                                        action: () {
                                          if (orderModel.paymentStatus == 'paid') {
                                            Provider.of<RestaurantDeliveryBoyOrderProvider>(context, listen: false)
                                                .updateOrderStatus(status: 'delivered', index: index);
                                            Provider.of<RestaurantDeliveryBoyOrderProvider>(context, listen: false).removeOrder(index: index,id: orderModel.id.toString());

                                            Navigator.of(context)
                                                .push(MaterialPageRoute(builder: (_) => RestaurantDeliveryBoyDashboardScreen()));
                                          } else {
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return Dialog(
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                                    child: DeliveryDialog(
                                                      onTap: () {},
                                                      totalPrice: totalPrice,
                                                      orderId: orderModel.id,
                                                      index: index,
                                                    ),
                                                  );
                                                });
                                          }
                                        },

                                        ///Put label over here
                                        label: Text(
                                          getTranslated('swip_to_confirm_order', context),
                                          style: Theme.of(context).textTheme.headline3.copyWith(color: Theme.of(context).primaryColor),
                                        ),
                                        icon: Center(
                                            child: Icon(
                                          Icons.double_arrow_sharp,
                                          color: Colors.white,
                                          size: 20.0,
                                          semanticLabel: 'Text to announce in accessibility modes',
                                        )),

                                        ///Change All the color and size from here.
                                        radius: 10,
                                        boxShadow: BoxShadow(blurRadius: 0.0),
                                        buttonColor: Theme.of(context).primaryColor,
                                        backgroundColor: Theme.of(context).backgroundColor,
                                        baseColor: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox.shrink(),
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)));
        },
      ),
    );
  }
}
