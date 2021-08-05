import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/cart_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/sixvalley/helper/price_converter.dart';
import 'package:flutter_ui_kit/sixvalley/localization/language_constrants.dart';
import 'package:flutter_ui_kit/sixvalley/provider/cart_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/product_details_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/seller_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/button/custom_button.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/checkout/checkout_screen.dart';
import 'package:provider/provider.dart';

class SixCartBottomSheet extends StatelessWidget {
  final Product product;
  final bool isBuy;
  final Function callback;
  SixCartBottomSheet({@required this.product, @required this.isBuy, this.callback});

  @override
  Widget build(BuildContext context) {
    Variation _variation = Variation();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Color(0xff757575),
          child: Container(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
            child: Consumer<SixProductDetailsProvider>(
              builder: (context, details, child) {

                String _variantName = product.colors.length != 0 ? product.colors[details.variantIndex].name : null;
                List<String> _variationList = [];
                for(int index=0; index < product.choiceOptions.length; index++) {
                  _variationList.add(product.choiceOptions[index].options[details.variationIndex[index]].replaceAll(' ', ''));
                }
                String variationType;
                if(_variantName != null) {
                  variationType = _variantName;
                  _variationList.forEach((variation) => variationType = '$variationType-$variation');
                }else {
                  bool isFirst = true;
                  _variationList.forEach((variation) {
                    if(isFirst) {
                      variationType = '$variationType$variation';
                      isFirst = false;
                    }else {
                      variationType = '$variationType-$variation';
                    }
                  });
                }
                double price = double.parse(product.unitPrice);
                for(Variation variation in product.variation) {
                  if(variation.type == variationType) {
                    price = double.parse(variation.price);
                    _variation = variation;
                    break;
                  }
                }
                double priceWithDiscount = PriceConverter.convertWithDiscount(context, price, product.discount, product.discountType);
                double priceWithQuantity = priceWithDiscount * details.quantity;

                return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                  // Close Button
                  Align(alignment: Alignment.centerRight, child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).accentColor, boxShadow: [BoxShadow(
                        color: Colors.grey[200],
                        spreadRadius: 1,
                        blurRadius: 5,
                      )]),
                      child: Icon(Icons.clear, size: Dimensions.ICON_SIZE_SMALL),
                    ),
                  )),

                  // Product details
                  Row(children: [
                    Container(
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                      decoration: BoxDecoration(
                        color: ColorResources.getImageBg(context),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FadeInImage.assetNetwork(
                          placeholder: Images.placeholder_image,
                          image: product.thumbnail,fit: BoxFit.cover,),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(product.name ?? '', style: titilliumSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE), maxLines: 2, overflow: TextOverflow.ellipsis),
                        Text(
                          PriceConverter.convertPrice(context, double.parse(product.unitPrice), discountType: product.discountType, discount: product.discount),
                          style: titilliumBold.copyWith(color: ColorResources.getPrimary(context), fontSize: 16),
                        ),
                        Text(
                          PriceConverter.convertPrice(context, double.parse(product.unitPrice)),
                          style: titilliumRegular.copyWith(color: Theme.of(context).hintColor, decoration: TextDecoration.lineThrough),
                        ),
                      ]),
                    ),
                    Expanded(child: SizedBox.shrink()),

                    Container(
                      height: 20,
                      margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: ColorResources.getPrimary(context)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        PriceConverter.percentageCalculation(context, product.unitPrice, product.discount, product.discountType),
                        style: titilliumRegular.copyWith(color: Theme.of(context).hintColor, fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL),
                      ),
                    ),

                  ]),

                  // Quantity
                  Row(children: [
                    Text(getTranslated('quantity', context), style: robotoBold),
                    QuantityButton(isIncrement: false, quantity: details.quantity),
                    Text(details.quantity.toString(), style: titilliumSemiBold),
                    QuantityButton(isIncrement: true, quantity: details.quantity),
                  ]),

                  // Variant
                  product.colors.length > 0 ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text(getTranslated('select_variant', context), style: robotoBold),
                    SizedBox(
                      height: 25,
                      child: ListView.builder(
                        itemCount: product.colors.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          String colorString = '0xff' + product.colors[index].code.substring(1, 7);
                          return InkWell(
                            onTap: () {
                              Provider.of<SixProductDetailsProvider>(context, listen: false).setCartVariantIndex(index);
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              margin: EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(int.parse(colorString)),
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [BoxShadow(color: Colors.grey[200], spreadRadius: 1, blurRadius: 5)],
                              ),
                              child: details.variantIndex == index ? Icon(Icons.done_all, color: ColorResources.WHITE, size: 12) : null,
                            ),
                          );
                        },
                      ),
                    ),
                  ]) : SizedBox(),
                  product.colors.length > 0 ? SizedBox(height: Dimensions.PADDING_SIZE_SMALL) : SizedBox(),

                  // Variation
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: product.choiceOptions.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(product.choiceOptions[index].title, style: robotoBold),
                        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 10,
                            childAspectRatio: (1 / 0.25),
                          ),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: product.choiceOptions[index].options.length,
                          itemBuilder: (context, i) {
                            return InkWell(
                              onTap: () {
                                Provider.of<SixProductDetailsProvider>(context, listen: false).setCartVariationIndex(index, i);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                decoration: BoxDecoration(
                                  color: details.variationIndex[index] != i ? Theme.of(context).accentColor : Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                  border: details.variationIndex[index] != i ? Border.all(color: Theme.of(context).hintColor, width: 2) : null,
                                ),
                                child: Text(product.choiceOptions[index].options[i], maxLines: 1, overflow: TextOverflow.ellipsis, style: titilliumRegular.copyWith(
                                  fontSize: Dimensions.FONT_SIZE_SMALL,
                                  color: details.variationIndex[index] != i ? Theme.of(context).hintColor : Colors.white,
                                )),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      ]);
                    },
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                  Row(children: [
                    Text(getTranslated('total_price', context), style: robotoBold),
                    SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                    Text(
                      PriceConverter.convertPrice(context, priceWithQuantity),
                      style: titilliumBold.copyWith(color: ColorResources.getPrimary(context), fontSize: 16),
                    ),
                  ]),
                  SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                  // Cart button
                  CustomButton(buttonText: isBuy ? getTranslated('buy_now', context) : getTranslated('add_to_cart', context), onTap: () {
                    CartModel _cartModel = CartModel(
                      product.id, product.thumbnail, product.name, product.addedBy == 'seller' ?
                    '${Provider.of<SixSellerProvider>(context, listen: false).sellerModel.fName} ${Provider.of<SixSellerProvider>(context, listen: false)
                        .sellerModel.lName}' : 'admin', price, priceWithDiscount, details.quantity, product.colors.length > 0 ? product.colors[details.variantIndex].name : '',
                      jsonEncode(_variation.toJson()), double.parse(product.discount), product.discountType, double.parse(product.tax), product.taxType, 1
                    );
                    Navigator.pop(context);
                    if(isBuy) {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => CheckoutScreen(cartList: [_cartModel], fromProductDetails: true)));
                    }else {
                      Provider.of<SixCartProvider>(context, listen: false).addToCart(_cartModel);
                      callback();
                    }
                  }),
                ]);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class QuantityButton extends StatelessWidget {
  final bool isIncrement;
  final int quantity;
  final bool isCartWidget;

  QuantityButton({
    @required this.isIncrement,
    @required this.quantity,
    this.isCartWidget = false,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (!isIncrement && quantity > 1) {
          Provider.of<SixProductDetailsProvider>(context, listen: false).setQuantity(quantity - 1);
        } else if (isIncrement) {
          Provider.of<SixProductDetailsProvider>(context, listen: false).setQuantity(quantity + 1);
        }
      },
      icon: Icon(
        isIncrement ? Icons.add_circle : Icons.remove_circle,
        color: isIncrement
            ? ColorResources.getPrimary(context)
            : quantity > 1
            ? ColorResources.getPrimary(context)
            : ColorResources.getLowGreen(context),
        size: isCartWidget?26:20,
      ),
    );
  }
}


