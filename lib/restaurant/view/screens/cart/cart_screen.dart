import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/helper/price_converter.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/cart_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/coupon_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_app_bar.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_button.dart';
import 'package:flutter_ui_kit/restaurant/view/base/no_data_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/cart/widget/cart_product_widget.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/checkout/checkout_screen.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<RestCouponProvider>(context, listen: false).removeCouponData();
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final TextEditingController _couponController = TextEditingController();

    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(title: getTranslated('my_cart', context), isBackButtonExist: false),
      body: Consumer<RestCartProvider>(
        builder: (context, cart, child) {
          double _subTotal = cart.amount;
          double _discount = 0;
          double _tax = 0;
          double _addOns = 0;
          cart.cartList.forEach((cartModel) {
            cartModel.addOns.forEach((addOn) => _addOns = _addOns + double.parse(addOn.price));
            _discount = _discount + (cartModel.discountAmount * cartModel.quantity);
            _tax = _tax + (cartModel.taxAmount * cartModel.quantity);
          });
          double _total = _subTotal + _addOns - _discount + _tax + 10 - Provider.of<RestCouponProvider>(context).discount;

          return cart.cartList.length > 0 ? ListView(padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL), physics: BouncingScrollPhysics(), children: [

            // Product
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: cart.cartList.length,
              itemBuilder: (context, index) {
                return CartProductWidget(cart: cart.cartList[index]);
              },
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

            // Coupon
            Consumer<RestCouponProvider>(
              builder: (context, coupon, child) {
                return Row(children: [
                  Expanded(
                    child: TextField(
                      controller: _couponController,
                      style: rubikRegular,
                      decoration: InputDecoration(
                          hintText: getTranslated('enter_promo_code', context),
                          hintStyle: rubikRegular.copyWith(color: ColorResources.getHintColor(context)),
                          isDense: true,
                          filled: true,
                          enabled: coupon.discount == 0,
                          fillColor: Theme.of(context).accentColor,
                          border: OutlineInputBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(10)), borderSide: BorderSide.none)
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if(_couponController.text.isNotEmpty && !coupon.isLoading) {
                        if(coupon.discount < 1) {
                          coupon.applyCoupon(_couponController.text, _total).then((discount) {
                            if (discount > 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('You got \$$discount discount'), backgroundColor: Colors.green));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to get discount'), backgroundColor: Colors.red));
                            }
                          });
                        } else {
                          coupon.removeCouponData();
                        }
                      }
                    },
                    child: Container(
                      height: 50, width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
                      ),
                      child: coupon.discount <= 0 ? !coupon.isLoading ? Text(
                        getTranslated('apply', context),
                        style: rubikMedium.copyWith(color: Colors.white),
                      ) : CircularProgressIndicator(backgroundColor: Colors.white) : Icon(Icons.clear, color: Colors.white),
                    ),
                  ),
                ]);
              },
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

            // Total
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(getTranslated('subtotal', context), style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
              Text(PriceConverter.convertPrice(context, _subTotal), style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
            ]),
            SizedBox(height: 10),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(getTranslated('addons', context), style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
              Text('(+) ${PriceConverter.convertPrice(context, _addOns)}', style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
            ]),
            SizedBox(height: 10),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(getTranslated('discount', context), style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
              Text('(-) ${PriceConverter.convertPrice(context, _discount)}', style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
            ]),
            SizedBox(height: 10),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(getTranslated('tax', context), style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
              Text('(+) ${PriceConverter.convertPrice(context, _tax)}', style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
            ]),
            SizedBox(height: 10),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(getTranslated('coupon_discount', context), style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
              Text(
                '(-) ${PriceConverter.convertPrice(context, Provider.of<RestCouponProvider>(context).discount)}',
                style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),
              ),
            ]),
            SizedBox(height: 10),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(getTranslated('delivery_fee', context), style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
              Text('(+) ${PriceConverter.convertPrice(context, 10)}', style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
            ]),
            SizedBox(height: 10),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(getTranslated('total_amount', context), style: rubikMedium.copyWith(
                fontSize: Dimensions.FONT_SIZE_LARGE, color: Theme.of(context).primaryColor,
              )),
              Text(
                PriceConverter.convertPrice(context, _total),
                style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: Theme.of(context).primaryColor),
              ),
            ]),
            SizedBox(height: 30),

            CustomButton(btnTxt: getTranslated('place_order', context), onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => CheckoutScreen(
                cartList: cart.cartList,
                amount: _total,
              )));
            }),

          ]) : NoDataScreen(isCart: true);
        },
      ),
    );
  }
}
