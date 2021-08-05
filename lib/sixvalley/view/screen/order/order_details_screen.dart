import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/order_details.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/order_model.dart';
import 'package:flutter_ui_kit/sixvalley/helper/network_info.dart';
import 'package:flutter_ui_kit/sixvalley/helper/price_converter.dart';
import 'package:flutter_ui_kit/sixvalley/localization/language_constrants.dart';
import 'package:flutter_ui_kit/sixvalley/provider/order_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/profile_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/seller_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/app_constants.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/amount_widget.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/button/custom_button.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/custom_app_bar.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/custom_loader.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/title_row.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/order/widget/order_details_widget.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/payment/payment_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/seller/seller_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/support/support_ticket_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/tracking/tracking_screen.dart';
import 'package:provider/provider.dart';

class OrderDetails extends StatelessWidget {
  final OrderModel order;
  OrderDetails({@required this.order});

  @override
  Widget build(BuildContext context) {
    Provider.of<SixSellerProvider>(context, listen: false).removePrevOrderSeller();
    Provider.of<SixOrderProvider>(context, listen: false).getOrderDetails();
    Provider.of<SixProfileProvider>(context, listen: false).initAddressList();
    Provider.of<SixOrderProvider>(context, listen: false).initShippingList();
    NetworkInfo.checkConnectivity(context);

    return Scaffold(
      backgroundColor: ColorResources.getIconBg(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CustomAppBar(title: getTranslated('ORDER_DETAILS', context)),

          Expanded(
            child: Consumer<SixOrderProvider>(
              builder: (context, orderDetails, child) {
                List<String> sellerList = [];
                List<List<OrderDetailsModel>> sellerProductList = [];
                double _order = 0;
                double _discount = 0;
                double _tax = 0;
                String shippingPartner = '';
                double _shippingFee = 0;
                String shippingAddress = '';

                if(orderDetails.orderDetails != null) {
                  orderDetails.orderDetails.forEach((orderDetails) {
                    if(!sellerList.contains(orderDetails.productDetails.userId)) {
                      sellerList.add(orderDetails.productDetails.userId);
                    }
                  });
                  sellerList.forEach((seller) {
                    if(seller != '1') {
                      Provider.of<SixSellerProvider>(context, listen: false).initSeller(seller);
                    }
                    List<OrderDetailsModel> orderList = [];
                    orderDetails.orderDetails.forEach((orderDetails) {
                      if(seller == orderDetails.productDetails.userId) {
                        orderList.add(orderDetails);
                      }
                    });
                    sellerProductList.add(orderList);
                  });

                  orderDetails.orderDetails.forEach((orderDetails) {
                    _order = _order + (double.parse(orderDetails.price) * double.parse(orderDetails.qty));
                    _discount = _discount + double.parse(orderDetails.discount);
                    _tax = _tax + (double.parse('10') * double.parse(orderDetails.qty));
                  });

                  if(orderDetails.shippingList != null) {
                    orderDetails.shippingList.forEach((shipping) {
                      if(shipping.id.toString() == orderDetails.orderDetails[0].shippingMethodId) {
                        shippingPartner = shipping.title;
                        _shippingFee = double.parse(shipping.cost);
                      }
                    });
                  }
                }

                return orderDetails.orderDetails != null ? ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  children: [

                    Container(
                      margin: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL, horizontal: Dimensions.PADDING_SIZE_SMALL),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: getTranslated('ORDER_ID', context), style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
                            TextSpan(text: order.id.toString(), style: titilliumSemiBold.copyWith(color: ColorResources.getPrimary(context))),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(Dimensions.MARGIN_SIZE_SMALL),
                      decoration: BoxDecoration(color: Theme.of(context).accentColor),
                      child: Column(
                        children: [
                          Row(children: [
                            Expanded(child: Text(getTranslated('SHIPPING_TO', context), style: titilliumRegular)),
                            Consumer<SixProfileProvider>(
                              builder: (context, profile, child) {
                                if(profile.addressList != null) {
                                  profile.addressList.forEach((address) {
                                    if(address.id.toString() == order.shippingAddress) {
                                      shippingAddress = address.address ?? '';
                                    }
                                  });
                                }
                                return Text(shippingAddress, style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL));
                              },
                            ),
                          ]),
                          Divider(),
                          Row(children: [
                            Expanded(child: Text(getTranslated('SHIPPING_PARTNER', context), style: titilliumRegular)),
                            Text(shippingPartner, style: titilliumSemiBold.copyWith(color: ColorResources.getPrimary(context))),
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),

                    ListView.builder(
                      itemCount: sellerList.length,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.MARGIN_SIZE_EXTRA_LARGE, vertical: Dimensions.MARGIN_SIZE_SMALL),
                          color: Theme.of(context).accentColor,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            InkWell(
                              onTap: () {
                                if(Provider.of<SixSellerProvider>(context, listen: false).orderSellerList.length != 0 && sellerList[index] != '1') {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                                    return SellerScreen(seller: Provider.of<SixSellerProvider>(context, listen: false).orderSellerList[index]);
                                  }));
                                }
                              },
                              child: Row(children: [
                                Expanded(child: Text(getTranslated('seller', context), style: robotoBold)),
                                Text(
                                  sellerList[index] == '1' ? 'Admin'
                                      : Provider.of<SixSellerProvider>(context).orderSellerList.length == 0 ? sellerList[index]
                                      : '${Provider.of<SixSellerProvider>(context).orderSellerList[index].fName} ${Provider.of<SixSellerProvider>(context).orderSellerList[index].lName}',
                                  style: titilliumRegular.copyWith(color: Theme.of(context).hintColor),
                                ),
                                SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                Icon(Icons.chat, color: ColorResources.getColombiaBlue(context), size: 20),
                              ]),
                            ),
                            Text(getTranslated('ORDERED_PRODUCT', context), style: robotoBold.copyWith(color: ColorResources.getHint(context))),
                            Divider(),
                            ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.all(0),
                              itemCount: orderDetails.orderDetails.length,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, i) => OrderDetailsWidget(orderDetailsModel: sellerProductList[index][i]),
                            ),
                          ]),
                        );
                      },
                    ),
                    SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),

                    // Amounts
                    Container(
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                      color: Theme.of(context).accentColor,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        TitleRow(title: getTranslated('TOTAL', context)),
                        AmountWidget(title: getTranslated('ORDER', context), amount: PriceConverter.convertPrice(context, _order)),
                        AmountWidget(title: getTranslated('SHIPPING_FEE', context), amount: PriceConverter.convertPrice(context, _shippingFee)),
                        AmountWidget(title: getTranslated('DISCOUNT', context), amount: PriceConverter.convertPrice(context, _discount)),
                        AmountWidget(title: getTranslated('coupon_voucher', context), amount: PriceConverter.convertPrice(context, double.parse(order.discountAmount))),
                        AmountWidget(title: getTranslated('TAX', context), amount: PriceConverter.convertPrice(context, _tax)),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          child: Divider(height: 2, color: ColorResources.HINT_TEXT_COLOR),
                        ),
                        AmountWidget(title: getTranslated('TOTAL_PAYABLE', context), amount: PriceConverter.convertPrice(context, (_order + _shippingFee - _discount + _tax))),
                      ]),
                    ),
                    SizedBox(height: Dimensions.MARGIN_SIZE_DEFAULT),

                    // Payment
                    Container(
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                      decoration: BoxDecoration(color: Theme.of(context).accentColor),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(getTranslated('PAYMENT', context), style: robotoBold),
                        SizedBox(height: Dimensions.MARGIN_SIZE_EXTRA_SMALL),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text(getTranslated('PAYMENT_STATUS', context), style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
                          Text(
                            orderDetails.orderDetails != null ? orderDetails.orderDetails[0].paymentStatus : '',
                            style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                          ),
                        ]),
                        SizedBox(height: Dimensions.MARGIN_SIZE_EXTRA_SMALL),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text(getTranslated('PAYMENT_PLATFORM', context), style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
                          order.orderStatus == SixAppConstants.PENDING
                              ? InkWell(
                                onTap: () async {
                                  String userID = await Provider.of<SixProfileProvider>(context, listen: false).getUserInfo();
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => PaymentScreen(orderID: order.id.toString(), customerID: userID)));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                  decoration: BoxDecoration(
                                    color: ColorResources.getPrimary(context),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(getTranslated('pay_now', context), style: titilliumSemiBold.copyWith(
                                    fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL, color: Theme.of(context).accentColor,
                                  )),
                                ),
                              )
                              : Text(order.paymentMethod.replaceAll('_', ' '), style: titilliumBold.copyWith(color: Theme.of(context).primaryColor)),
                        ]),
                      ]),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                    // Buttons
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE, vertical: Dimensions.PADDING_SIZE_SMALL),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              buttonText: getTranslated('TRACK_ORDER', context),
                              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => TrackingScreen())),
                            ),
                          ),
                          SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                          Expanded(
                            child: SizedBox(
                              height: 45,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6), side: BorderSide(color: ColorResources.getPrimary(context))),
                                ),
                                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SupportTicketScreen())),
                                child: Text(getTranslated('SUPPORT_CENTER', context), style: titilliumSemiBold.copyWith(fontSize: 16, color: ColorResources.getPrimary(context))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ) : Center(child: CustomLoader(color: ColorResources.COLOR_PRIMARY));
              },
            ),
          )
        ],
      ),
    );
  }
}
