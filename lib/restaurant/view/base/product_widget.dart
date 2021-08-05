import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/cart_model.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/restaurant/helper/price_converter.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/theme_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/wishlist_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_snackbar.dart';
import 'package:flutter_ui_kit/restaurant/view/base/rating_bar.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/home/widget/cart_bottom_sheet.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  ProductWidget({@required this.product});

  @override
  Widget build(BuildContext context) {

    void feedbackMessage(String message) {
      if (message != '') {
        showCustomSnackBar(message, context, isError: false);
      }
    }

    double _discountedPrice = PriceConverter.convertWithDiscount(context, double.parse(product.price), product.discount, product.discountType);

    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (con) => CartBottomSheet(
              product: product,
              callback: (CartModel cartModel) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(getTranslated('added_to_cart', context)), backgroundColor: Colors.green));
              },
            ),
        );
      },
      child: Container(
        height: 85,
        padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL, horizontal: Dimensions.PADDING_SIZE_SMALL),
        margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_DEFAULT),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(
            color: Colors.grey[Provider.of<RestThemeProvider>(context).darkTheme ? 700 : 300],
            blurRadius: 5, spreadRadius: 1,
          )],
        ),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:FadeInImage.assetNetwork(
                placeholder: Images.placeholder,
                image: product.image,
                height: 70,
                width: 85,
                fit: BoxFit.cover),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(product.name, style: rubikMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
              SizedBox(height: 2),
              RatingBar(rating: product.rating.length > 0 ? double.parse(product.rating[0].average) : 0.0, size: 12),
              SizedBox(height: 10),
              Row(children: [
                Text(
                  PriceConverter.convertPrice(context, double.parse(product.price), discount: product.discount, discountType: product.discountType),
                  style: rubikBold,
                ),
                SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                double.parse(product.price) > _discountedPrice ? Text(PriceConverter.convertPrice(context, double.parse(product.price)), style: rubikBold.copyWith(
                  color: ColorResources.COLOR_GREY,
                  decoration: TextDecoration.lineThrough,
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                )) : SizedBox(),
              ]),
            ]),
          ),
          Column(children: [
            Consumer<RestWishListProvider>(
              builder: (context, wishListProvider, child) {
                return InkWell(
                  onTap: () {
                    if(wishListProvider.wishIdList.contains(product.id)) {
                      wishListProvider.removeFromWishList(product, feedbackMessage);
                    }else {
                      wishListProvider.addToWishList(product, feedbackMessage);
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL, bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    child: Icon(
                      wishListProvider.wishIdList.contains(product.id) ? Icons.favorite : Icons.favorite_border,
                      color: wishListProvider.wishIdList.contains(product.id) ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_GREY,
                    ),
                  ),
                );
              },
            ),
            Expanded(child: SizedBox()),
            Icon(Icons.add),
          ]),
        ]),
      ),
    );
  }
}
