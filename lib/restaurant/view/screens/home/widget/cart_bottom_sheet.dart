
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/cart_model.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/restaurant/helper/price_converter.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/cart_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/product_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/wishlist_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_button.dart';
import 'package:flutter_ui_kit/restaurant/view/base/rating_bar.dart';
import 'package:provider/provider.dart';

class CartBottomSheet extends StatelessWidget {
  final Product product;
  final bool fromSetMenu;
  final Function callback;
  CartBottomSheet({@required this.product, this.fromSetMenu = false, this.callback});

  @override
  Widget build(BuildContext context) {
    Provider.of<RestProductProvider>(context, listen: false).initData(product);
    Variation _variation = Variation();
    bool isExistInCart = Provider.of<RestCartProvider>(context, listen: false).isExistInCart(product.id);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Consumer<RestProductProvider>(
            builder: (context, productProvider, child) {

              List<String> _variationList = [];
              for(int index=0; index < product.choiceOptions.length; index++) {
                _variationList.add(product.choiceOptions[index].options[productProvider.variationIndex[index]].replaceAll(' ', ''));
              }
              String variationType = '';
              bool isFirst = true;
              _variationList.forEach((variation) {
                if(isFirst) {
                  variationType = '$variationType$variation';
                  isFirst = false;
                }else {
                  variationType = '$variationType-$variation';
                }
              });

              double price = double.parse(product.price);
              for(Variation variation in product.variations) {
                if(variation.type == variationType) {
                  price = variation.price;
                  _variation = variation;
                  break;
                }
              }
              double priceWithDiscount = PriceConverter.convertWithDiscount(context, price, product.discount, product.discountType);
              double priceWithQuantity = priceWithDiscount * productProvider.quantity;
              double addonsCost = 0;
              productProvider.addOnList.forEach((addOn) => addonsCost = addonsCost + double.parse(addOn.price));
              double priceWithAddons = priceWithQuantity + addonsCost;

              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                //Product
                Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:FadeInImage.assetNetwork(
                        placeholder: Images.placeholder,
                        image: product.image,
                      width: 150, height: 100, fit: BoxFit.cover,)
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(
                        product.name, maxLines: 2, overflow: TextOverflow.ellipsis,
                        style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE),
                      ),
                      RatingBar(rating: product.rating.length > 0 ? double.parse(product.rating[0].average) : 0.0, size: 15),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            PriceConverter.convertPrice(context, double.parse(product.price), discount: product.discount, discountType: product.discountType),
                            style: rubikBold.copyWith(fontSize: 20),
                          ),
                          price == priceWithDiscount ? Consumer<RestWishListProvider>(
                              builder: (context, wishList, child) {
                                return InkWell(
                                  onTap: () {
                                    wishList.wishIdList.contains(product.id)
                                        ? wishList.removeFromWishList(product, (message) {})
                                        : wishList.addToWishList(product, (message) {});
                                  },
                                  child: Icon(
                                    wishList.wishIdList.contains(product.id) ? Icons.favorite : Icons.favorite_border,
                                    color: wishList.wishIdList.contains(product.id) ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_GREY,
                                  ),
                                );
                              }
                          ) : SizedBox(),
                        ],
                      ),
                      price > priceWithDiscount ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text(PriceConverter.convertPrice(context, double.parse(product.price)), style: rubikBold.copyWith(
                          fontSize: 18,
                          color: ColorResources.COLOR_GREY,
                          decoration: TextDecoration.lineThrough,
                        )),
                        Consumer<RestWishListProvider>(
                          builder: (context, wishList, child) {
                            return InkWell(
                              onTap: () {
                                wishList.wishIdList.contains(product.id)
                                    ? wishList.removeFromWishList(product, (message) {})
                                    : wishList.addToWishList(product, (message) {});
                              },
                              child: Icon(
                                wishList.wishIdList.contains(product.id) ? Icons.favorite : Icons.favorite_border,
                                color: wishList.wishIdList.contains(product.id) ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_GREY,
                              ),
                            );
                          }
                        ),
                      ]) : SizedBox(),
                    ]),
                  ),
                ]),
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                // Quantity
                Row(children: [
                  Text(getTranslated('quantity', context), style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
                  Expanded(child: SizedBox()),
                  Container(
                    decoration: BoxDecoration(color: ColorResources.getBackgroundColor(context), borderRadius: BorderRadius.circular(5)),
                    child: Row(children: [
                      InkWell(
                        onTap: () {
                          if (productProvider.quantity > 1) {
                            productProvider.setQuantity(false);
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL, vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          child: Icon(Icons.remove, size: 20),
                        ),
                      ),
                      Text(productProvider.quantity.toString(), style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE)),
                      InkWell(
                        onTap: () => productProvider.setQuantity(true),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL, vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          child: Icon(Icons.add, size: 20),
                        ),
                      ),
                    ]),
                  ),
                ]),
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                // Variation
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: product.choiceOptions.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(product.choiceOptions[index].title, style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 10,
                          childAspectRatio: (1 / 0.35),
                        ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: product.choiceOptions[index].options.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              productProvider.setCartVariationIndex(index, i);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              decoration: BoxDecoration(
                                color: productProvider.variationIndex[index] != i ? ColorResources.BACKGROUND_COLOR : ColorResources.COLOR_PRIMARY,
                                borderRadius: BorderRadius.circular(5),
                                border: productProvider.variationIndex[index] != i ? Border.all(color: ColorResources.BORDER_COLOR, width: 2) : null,
                              ),
                              child: Text(
                                product.choiceOptions[index].options[i], maxLines: 1, overflow: TextOverflow.ellipsis,
                                style: rubikRegular.copyWith(color: productProvider.variationIndex[index] != i ? ColorResources.COLOR_BLACK : ColorResources.COLOR_WHITE),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: index != product.choiceOptions.length-1 ? Dimensions.PADDING_SIZE_LARGE : 0),
                    ]);
                  },
                ),
                product.choiceOptions.length > 0 ? SizedBox(height: Dimensions.PADDING_SIZE_LARGE) : SizedBox(),

                fromSetMenu ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(getTranslated('description', context), style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  Text(product.description ?? '', style: rubikRegular),
                  SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                ]) : SizedBox(),

                // Addons
                product.addOns.length > 0 ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(getTranslated('addons', context), style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10,
                      childAspectRatio: (1 / 1),
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: product.addOns.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if(productProvider.addOnIdList.contains(product.addOns[index].id)) {
                            productProvider.addAddOn(false, product.addOns[index]);
                          }else {
                            productProvider.addAddOn(true, product.addOns[index]);
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          decoration: BoxDecoration(
                            color: productProvider.addOnIdList.contains(product.addOns[index].id) ? ColorResources.COLOR_PRIMARY : ColorResources.BACKGROUND_COLOR,
                            borderRadius: BorderRadius.circular(5),
                            border: productProvider.addOnIdList.contains(product.addOns[index].id) ? null : Border.all(color: ColorResources.BORDER_COLOR, width: 2),
                          ),
                          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Text(product.addOns[index].name, maxLines: 1, overflow: TextOverflow.ellipsis, style: rubikRegular.copyWith(
                              color: productProvider.addOnIdList.contains(product.addOns[index].id) ? ColorResources.COLOR_WHITE : ColorResources.COLOR_BLACK,
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                            )),
                            SizedBox(height: 10),
                            Text('\$${product.addOns[index].price}', maxLines: 1, overflow: TextOverflow.ellipsis, style: rubikMedium.copyWith(
                              color: productProvider.addOnIdList.contains(product.addOns[index].id) ? ColorResources.COLOR_WHITE : ColorResources.COLOR_BLACK,
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                            )),
                          ]),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                ]) : SizedBox(),

                Row(children: [
                  Text('${getTranslated('total_amount', context)}:', style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
                  SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  Text(PriceConverter.convertPrice(context, priceWithAddons), style: rubikBold.copyWith(
                    color: ColorResources.COLOR_PRIMARY, fontSize: Dimensions.FONT_SIZE_LARGE,
                  )),
                ]),
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                CustomButton(
                  btnTxt: getTranslated(isExistInCart ? 'already_added_in_cart' : 'add_to_cart', context),
                  backgroundColor: Theme.of(context).primaryColor,
                  onTap: isExistInCart ? null : () {
                    if(!isExistInCart) {
                      CartModel _cartModel = CartModel(
                        product.name, product.image, product.id.toString(), product.price, priceWithDiscount, '', [_variation],
                        (double.parse(product.price) - PriceConverter.convertWithDiscount(context, double.parse(product.price), product.discount, product.discountType)),
                        productProvider.quantity, price-PriceConverter.convertWithDiscount(context, price, product.tax, product.taxType),
                        productProvider.addOnIdList, productProvider.addOnList, product.rating,
                      );
                      Navigator.pop(context);
                      Provider.of<RestCartProvider>(context, listen: false).addToCart(_cartModel);
                      callback(_cartModel);
                    }
                  },
                ),

              ]);
            },
          ),
        ),
      ],
    );
  }
}


