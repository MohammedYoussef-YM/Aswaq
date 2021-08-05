import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/cart_model.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/order_details_model.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/track_model.dart';
import 'package:flutter_ui_kit/restaurant/helper/price_converter.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/order_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/theme_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_button.dart';
import 'package:flutter_ui_kit/restaurant/view/base/no_data_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/checkout/checkout_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/order/order_details_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/track/order_tracking_screen.dart';
import 'package:provider/provider.dart';

class OrderView extends StatelessWidget {
  final bool isRunning;
  OrderView({@required this.isRunning});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RestOrderProvider>(
        builder: (context, order, index) {
          List<OrderModel> orderList;
          if(order.runningOrderList != null) {
            orderList = isRunning ? order.runningOrderList.reversed.toList() : order.historyOrderList.reversed.toList();
          }

          return orderList != null ? orderList.length > 0 ? ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
            itemCount: orderList.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_LARGE),
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  boxShadow: [BoxShadow(
                    color: Colors.grey[Provider.of<RestThemeProvider>(context).darkTheme ? 700 : 300],
                    spreadRadius: 1, blurRadius: 5,
                  )],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: [

                  Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage.assetNetwork(
                        placeholder: Images.placeholder,
                        image: Images.product_3,
                        height: 70, width: 80, fit: BoxFit.cover,)
                    ),
                    SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Row(children: [
                        Text('${getTranslated('order_id', context)}:', style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
                        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        Text(orderList[index].id.toString(), style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
                      ]),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      Text(
                        '1 ${getTranslated('items', context)}',
                        style: rubikRegular.copyWith(color: ColorResources.COLOR_GREY),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      Row(children: [
                        Icon(Icons.check_circle, color: ColorResources.COLOR_PRIMARY, size: 15),
                        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        Text(
                          '${orderList[index].orderStatus[0].toUpperCase()}${orderList[index].orderStatus.substring(1).replaceAll('_', ' ')}',
                          style: rubikRegular.copyWith(color: ColorResources.COLOR_PRIMARY),
                        ),
                      ]),
                    ]),
                  ]),
                  SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                  SizedBox(
                    height: 50,
                    child: Row(children: [
                      Expanded(child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(width: 2, color: ColorResources.DISABLE_COLOR)),
                          padding: EdgeInsets.all(15),
                        ),
                          onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => OrderDetailsScreen(orderModel: orderList[index])));
                        },
                        child: Text(getTranslated('details', context), style: Theme.of(context).textTheme.headline3.copyWith(
                          color: ColorResources.DISABLE_COLOR,
                          fontSize: Dimensions.FONT_SIZE_LARGE,
                        )),
                      )),
                      SizedBox(width: 30),
                      Expanded(child: CustomButton(
                        btnTxt: getTranslated(isRunning ? 'track_order' : 'reorder', context),
                        onTap: () async {
                          if(isRunning) {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => OrderTrackingScreen(orderID: orderList[index].id.toString())));
                          }else {
                            List<OrderDetailsModel> orderDetails = await order.getOrderDetails(orderList[index].id.toString());
                            List<CartModel> _cartList = [];
                            orderDetails.forEach((orderDetail) => _cartList.add(CartModel(
                              orderDetail.productDetails.name, orderDetail.productDetails.image, orderDetail.productId, orderDetail.price,
                              PriceConverter.convertWithDiscount(context, double.parse(orderDetail.price), orderDetail.discountOnProduct, 'amount'),
                              orderDetail.variant, [], double.parse(orderDetail.discountOnProduct), int.parse(orderDetail.quantity),
                              double.parse(orderDetail.taxAmount), [], [], orderDetail.productDetails.rating,
                            )));
                            Navigator.push(context, MaterialPageRoute(builder: (_) => CheckoutScreen(
                              cartList: _cartList,
                              amount: double.parse(orderList[index].orderAmount),
                            )));
                          }
                        },
                      )),
                    ]),
                  ),

                ]),
              );
            },
          ) : NoDataScreen(isOrder: true) : Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)));
        },
      ),
    );
  }
}
