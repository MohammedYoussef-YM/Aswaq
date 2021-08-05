import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/cart_model.dart';
import 'package:flutter_ui_kit/restaurant/helper/price_converter.dart';
import 'package:flutter_ui_kit/restaurant/provider/cart_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/theme_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant/view/base/rating_bar.dart';
import 'package:provider/provider.dart';

class CartProductWidget extends StatelessWidget {
  final CartModel cart;
  CartProductWidget({@required this.cart});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_DEFAULT),
      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
      child: Stack(children: [
        Positioned(
          top: 0, bottom: 0, right: 0, left: 0,
          child: Icon(Icons.delete, color: ColorResources.COLOR_WHITE, size: 50),
        ),
        Dismissible(
          key: Key(cart.productId),
          onDismissed: (DismissDirection direction) => Provider.of<RestCartProvider>(context, listen: false).removeFromCart(cart),
          child: Container(
            height: cart.addOns.length > 0 ? 120 : 95,
            padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL, horizontal: Dimensions.PADDING_SIZE_SMALL),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(
                color: Colors.grey[Provider.of<RestThemeProvider>(context).darkTheme ? 700 : 300],
                blurRadius: 5, spreadRadius: 1,
              )],
            ),
            child: Column(
              children: [

                Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage.assetNetwork(
                        placeholder: Images.placeholder,
                        image: cart.image,
                      height: 70, width: 85, fit: BoxFit.cover,)
                  ),
                  SizedBox(width: Dimensions.PADDING_SIZE_SMALL),

                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(cart.name, style: rubikMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
                    SizedBox(height: 2),
                    RatingBar(rating: cart.rating.length > 0 ? double.parse(cart.rating[0].average) : 0.0, size: 12),
                    SizedBox(height: 10),
                    Row(children: [
                      Text(
                        PriceConverter.convertPrice(context, double.parse(cart.price), discount: cart.discountAmount.toString(), discountType: 'amount'),
                        style: rubikBold,
                      ),
                      SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      cart.discountAmount > 0 ? Text(PriceConverter.convertPrice(context, double.parse(cart.price)), style: rubikBold.copyWith(
                        color: ColorResources.COLOR_GREY,
                        fontSize: Dimensions.FONT_SIZE_SMALL,
                        decoration: TextDecoration.lineThrough,
                      )) : SizedBox(),
                    ]),
                  ])),

                  Container(
                    decoration: BoxDecoration(color: ColorResources.getBackgroundColor(context), borderRadius: BorderRadius.circular(5)),
                    child: Row(children: [
                      InkWell(
                        onTap: () {
                          if (cart.quantity > 1) {
                            Provider.of<RestCartProvider>(context, listen: false).setQuantity(false, cart);
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL, vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          child: Icon(Icons.remove, size: 20),
                        ),
                      ),
                      Text(cart.quantity.toString(), style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE)),
                      InkWell(
                        onTap: () => Provider.of<RestCartProvider>(context, listen: false).setQuantity(true, cart),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL, vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          child: Icon(Icons.add, size: 20),
                        ),
                      ),
                    ]),
                  ),

                ]),

                cart.addOns.length > 0 ? SizedBox(
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
                    itemCount: cart.addOns.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL),
                        child: Row(children: [
                          Text(cart.addOns[index].name, style: rubikRegular),
                          SizedBox(width: 2),
                          Text('${cart.addOns[index].price}\$', style: rubikMedium),
                        ]),
                      );
                    },
                  ),
                ) : SizedBox(),

              ],
            ),
          ),
        ),
      ]),
    );
  }
}
