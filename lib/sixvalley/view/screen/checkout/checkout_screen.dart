import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/body/order_place_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/cart_model.dart';
import 'package:flutter_ui_kit/sixvalley/helper/network_info.dart';
import 'package:flutter_ui_kit/sixvalley/helper/price_converter.dart';
import 'package:flutter_ui_kit/sixvalley/localization/language_constrants.dart';
import 'package:flutter_ui_kit/sixvalley/provider/cart_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/coupon_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/order_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/profile_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/amount_widget.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/animated_custom_dialog.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/custom_app_bar.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/my_dialog.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/show_custom_snakbar.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/title_row.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/cart/cart_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/checkout/widget/address_bottom_sheet.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/checkout/widget/shipping_method_bottom_sheet.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/dashboard/dashboard_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/payment/payment_screen.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  final List<CartModel> cartList;
  final bool fromProductDetails;
  CheckoutScreen({@required this.cartList, this.fromProductDetails = false});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();
  double _order = 0;
  double _discount = 0;
  double _tax = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<SixProfileProvider>(context, listen: false).initAddressList();
    Provider.of<SixProfileProvider>(context, listen: false).initAddressTypeList();
    Provider.of<SixOrderProvider>(context, listen: false).initShippingList();
    Provider.of<SixCouponProvider>(context, listen: false).removePrevCouponData();
    NetworkInfo.checkConnectivity(context);

    widget.cartList.forEach((cart) {
      double amount = cart.price;
      _order = _order + (amount * cart.quantity);
      _discount = _discount + PriceConverter.calculation(amount, cart.discount, cart.discountType, cart.quantity);
      _tax = _tax + PriceConverter.calculation(amount, cart.tax, cart.taxType, cart.quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,

      bottomNavigationBar: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE, vertical: Dimensions.PADDING_SIZE_DEFAULT),
        decoration: BoxDecoration(
            color: ColorResources.getPrimary(context),
            borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
        ),
        child: Consumer<SixOrderProvider>(
          builder: (context, order, child) {
            double _shippingCost = order.shippingIndex != null ? double.parse(order.shippingList[order.shippingIndex].cost) : 0;
            double _couponDiscount = Provider.of<SixCouponProvider>(context).discount != null ? Provider.of<SixCouponProvider>(context).discount : 0;
            return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                PriceConverter.convertPrice(context, (_order + _shippingCost - _discount - _couponDiscount + _tax)),
                style: titilliumSemiBold.copyWith(color: Theme.of(context).accentColor),
              ),
              !Provider.of<SixOrderProvider>(context).isLoading ? Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () async {
                    if(order.addressIndex == null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Select a shipping address'), backgroundColor: Colors.red));
                    }else if(order.shippingIndex == null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Select a shipping method'), backgroundColor: Colors.red));
                    }else {
                      List<Cart> carts = [];
                      for(int index=0; index < widget.cartList.length; index++) {
                        CartModel cart = widget.cartList[index];
                        carts.add(Cart(
                          cart.id.toString(), PriceConverter.calculation(cart.price, cart.tax, cart.taxType, 1).toInt(), cart.quantity, cart.price.toInt(),
                          PriceConverter.calculation(cart.price, cart.discount, cart.discountType, 1).toInt(), 'amount',
                          index == 0 ? Provider.of<SixOrderProvider>(context, listen: false).shippingList[Provider.of<SixOrderProvider>(context, listen: false)
                              .shippingIndex].id : 1, cart.variant, cart.variation, index == 0 ? _shippingCost.toInt() : 0,
                        ));
                      }
                      double couponDiscount = Provider.of<SixCouponProvider>(context, listen: false).discount != null ? Provider.of<SixCouponProvider>(context, listen: false).discount : 0;
                      Provider.of<SixOrderProvider>(context, listen: false).placeOrder(OrderPlaceModel(
                        CustomerInfo(
                          Provider.of<SixProfileProvider>(context, listen: false).addressList[Provider.of<SixOrderProvider>(context, listen: false).addressIndex].id.toString(),
                          Provider.of<SixProfileProvider>(context, listen: false).addressList[Provider.of<SixOrderProvider>(context, listen: false).addressIndex].address,
                        ),
                        carts, 'visa', couponDiscount.toInt(),
                      ), _callback, widget.cartList);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(getTranslated('proceed', context), style: titilliumSemiBold.copyWith(
                    fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                    color: ColorResources.getPrimary(context),
                  )),
                ),
              ) : Container(height: 30, width: 100, alignment: Alignment.center, child: CircularProgressIndicator()),
            ]);
          },
        ),
      ),

      body: Column(
        children: [

          CustomAppBar(title: getTranslated('checkout', context)),

          Expanded(
            child: ListView(physics: BouncingScrollPhysics(), padding: EdgeInsets.all(0), children: [

              // Shipping Details
              Container(
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                decoration: BoxDecoration(color: Theme.of(context).accentColor),
                child: Column(children: [
                  InkWell(
                    onTap: () => showModalBottomSheet(context: context, isScrollControlled: true, builder: (context) => AddressBottomSheet()),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text(getTranslated('SHIPPING_TO', context), style: titilliumRegular),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Text(
                          Provider.of<SixOrderProvider>(context).addressIndex == null ? getTranslated('add_your_address', context)
                              : Provider.of<SixProfileProvider>(context, listen: false).addressList[Provider.of<SixOrderProvider>(context, listen: false).addressIndex].address,
                          style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        Image.asset(Images.EDIT_TWO, width: 15, height: 15, color: ColorResources.getPrimary(context)),
                      ]),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    child: Divider(height: 2, color: ColorResources.getHint(context)),
                  ),
                  InkWell(
                    onTap: () => showModalBottomSheet(context: context, isScrollControlled: true, builder: (context) => ShippingMethodBottomSheet()),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text(getTranslated('SHIPPING_PARTNER', context), style: titilliumRegular),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Text(
                          Provider.of<SixOrderProvider>(context).shippingIndex == null ? getTranslated('select_shipping_method', context)
                              : Provider.of<SixOrderProvider>(context, listen: false).shippingList[Provider.of<SixOrderProvider>(context, listen: false).shippingIndex].title,
                          style: titilliumSemiBold.copyWith(color: ColorResources.getPrimary(context)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        Image.asset(Images.EDIT_TWO, width: 15, height: 15, color: ColorResources.getPrimary(context)),
                      ]),
                    ]),
                  ),
                ]),
              ),

              // Order Details
              Container(
                margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                color: Theme.of(context).accentColor,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  TitleRow(title: getTranslated('ORDER_DETAILS', context), onTap: widget.fromProductDetails ? null : () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen(fromCheckout: true, checkoutCartList: widget.cartList)));
                  }),
                  Padding(
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                    child: Row(children: [
                      FadeInImage.assetNetwork(
                        placeholder: Images.placeholder_image,
                        image: widget.cartList[0].image,
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,),
                      SizedBox(width: Dimensions.MARGIN_SIZE_DEFAULT),
                      Expanded(
                        flex: 3,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(
                            widget.cartList[0].name,
                            style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL, color: ColorResources.getPrimary(context)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: Dimensions.MARGIN_SIZE_EXTRA_SMALL),
                          Row(children: [
                            Text(
                              PriceConverter.convertPrice(context, widget.cartList[0].price),
                              style: titilliumSemiBold.copyWith(color: ColorResources.getPrimary(context)),
                            ),
                            SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                            Text(widget.cartList[0].quantity.toString(), style: titilliumSemiBold.copyWith(color: ColorResources.getPrimary(context))),
                            Container(
                              height: 20,
                              padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_EXTRA_LARGE),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: ColorResources.getPrimary(context))),
                              child: Text(
                                PriceConverter.percentageCalculation(context, widget.cartList[0].price.toString(), widget.cartList[0].discount.toString(), widget.cartList[0].discountType),
                                style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL, color: ColorResources.getPrimary(context)),
                              ),
                            ),
                          ]),
                        ]),
                      ),
                    ]),
                  ),

                  // Coupon
                  Row(children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextField(controller: _controller, decoration: InputDecoration(
                          hintText: 'Have a coupon?',
                          hintStyle: titilliumRegular.copyWith(color: ColorResources.HINT_TEXT_COLOR),
                          filled: true,
                          fillColor: ColorResources.getIconBg(context),
                          border: InputBorder.none,
                        )),
                      ),
                    ),
                    SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                    !Provider.of<SixCouponProvider>(context).isLoading ? ElevatedButton(
                      onPressed: () {
                        if(_controller.text.isNotEmpty) {
                          double value = Provider.of<SixCouponProvider>(context, listen: false).initCoupon();
                          if(value > 0) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
                            Text('You got ${PriceConverter.convertPrice(context, value)} discount'), backgroundColor: ColorResources.getGreen(context)));
                          }else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to get discount'), backgroundColor: ColorResources.getRed(context)));
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: ColorResources.getGreen(context),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text(getTranslated('APPLY', context)),
                    ) : CircularProgressIndicator(),
                  ]),

                ]),
              ),

              // Total bill
              Container(
                margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                color: Theme.of(context).accentColor,
                child: Consumer<SixOrderProvider>(
                  builder: (context, order, child) {
                    double _shippingCost = order.shippingIndex != null ? double.parse(order.shippingList[order.shippingIndex].cost) : 0;
                    double _couponDiscount = Provider.of<SixCouponProvider>(context).discount != null ? Provider.of<SixCouponProvider>(context).discount : 0;

                    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      TitleRow(title: getTranslated('TOTAL', context)),
                      AmountWidget(title: getTranslated('ORDER', context), amount: PriceConverter.convertPrice(context, _order)),
                      AmountWidget(title: getTranslated('SHIPPING_FEE', context), amount: PriceConverter.convertPrice(context, _shippingCost)),
                      AmountWidget(title: getTranslated('DISCOUNT', context), amount: PriceConverter.convertPrice(context, _discount)),
                      AmountWidget(title: getTranslated('coupon_voucher', context), amount: PriceConverter.convertPrice(context, _couponDiscount)),
                      AmountWidget(title: getTranslated('TAX', context), amount: PriceConverter.convertPrice(context, _tax)),
                      Divider(height: 5, color: Theme.of(context).hintColor),
                      AmountWidget(title: getTranslated('TOTAL_PAYABLE', context), amount: PriceConverter.convertPrice(context, (_order + _shippingCost - _discount - _couponDiscount + _tax))),
                    ]);
                  },
                ),
              ),

              // Payment Method
              Container(
                margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                color: Theme.of(context).accentColor,
                child: Column(children: [
                  TitleRow(title: getTranslated('payment_method', context)),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  Row(children: [
                    Expanded(child: PaymentButton(image: Images.paypal, onTap: () {})),
                    Expanded(child: PaymentButton(image: Images.paytm, onTap: () {})),
                    Expanded(child: PaymentButton(image: Images.mastercard, onTap: () {})),
                    Expanded(child: PaymentButton(image: Images.visa, onTap: () {})),
                  ]),
                ]),
              ),

              // Terms
              Container(
                margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                color: Theme.of(context).accentColor,
                child: Column(children: [
                  TitleRow(title: getTranslated('TERMS_OF_DELIVERY', context)),
                  Row(children: [
                    Image.asset(Images.fast_delivery, color: Theme.of(context).textTheme.bodyText1.color, width: 30, height: 30),
                    SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    Text(getTranslated('fast_delivery_in', context), style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
                    SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    Text(getTranslated('one_day', context), style: titilliumRegular.copyWith(
                      fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.getPrimary(context),
                    )),
                  ]),
                  Row(children: [
                    Image.asset(Images.delivery, color: Theme.of(context).textTheme.bodyText1.color, width: 30, height: 30),
                    SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    Text(getTranslated('regular_delivery', context), style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
                    SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    Text(getTranslated('five_day', context), style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.getPrimary(context))),
                  ]),
                  Text(
                    getTranslated('terms_of_delivery_text', context),
                    style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL),
                    textAlign: TextAlign.justify,
                  ),
                ]),
              ),

            ]),
          ),
        ],
      ),
    );
  }

  void _callback(bool isSuccess, String message, List<CartModel> carts) async {
    if(isSuccess) {
      Provider.of<SixCartProvider>(context, listen: false).removeCheckoutProduct(carts);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => SixDashBoardScreen()), (route) => false);
      showAnimatedDialog(context, MyDialog(
        icon: Icons.done,
        title: getTranslated('payment_done', context),
        description: getTranslated('your_payment_successfully_done', context),
      ), dismissible: false, isFlip: true);
    }else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: ColorResources.RED));
    }
  }
}

class PaymentButton extends StatelessWidget {
  final String image;
  final Function onTap;
  PaymentButton({@required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        margin: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: ColorResources.getGrey(context)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(image,fit: BoxFit.cover),
      ),
    );
  }
}
