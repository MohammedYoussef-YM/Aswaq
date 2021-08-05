import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/data/models/product.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/utility/images.dart';
import 'package:flutter_ui_kit/grocery/view/views/product_details/product_details_screen.dart';

class ProductItemWidget extends StatelessWidget {
  final GroceryProduct product;

  ProductItemWidget({this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
                  product: product,
                )));
      },
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], color: ColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        topRight: Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL)),
                    child: FadeInImage.assetNetwork(
                        placeholder: Images.place_holder,
                        image:  product.imageUrl,
                      height: 130,
                      fit: BoxFit.fill,
                      width: double.infinity,),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 44,
                        height: 14,
                        decoration: BoxDecoration(
                            color: ColorResources.COLOR_DEEP_ORANGE.withOpacity(.9),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                topRight: Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL))),
                        child: Center(
                            child: Text(
                          product.off,
                          style: poppinsRegular.copyWith(color: ColorResources.COLOR_WHITE, fontSize: 9.0),
                        )),
                      ))
                ],
              ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
            Padding(
              padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
              child: Text(
                product.name,
                style: poppinsRegular.copyWith(fontSize: 13, color: ColorResources.COLOR_BLACK),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
              child: Text(
                product.quantity,
                style: poppinsRegular.copyWith(fontSize: 13, color: ColorResources.COLOR_BLACK),
              ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            Padding(
              padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL, right: Dimensions.PADDING_SIZE_SMALL),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        product.runningPrice,
                        style: poppinsRegular.copyWith(fontSize: 13, color: ColorResources.COLOR_CARROT_ORANGE),
                      ),
                      SizedBox(
                        width: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                      ),
                      Text(
                        product.previoudPrice,
                        style:
                            poppinsRegular.copyWith(decorationStyle: TextDecorationStyle.solid, fontSize: 9, decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        product.rating,
                        style: poppinsRegular.copyWith(fontSize: 11, color: ColorResources.COLOR_CARROT_ORANGE),
                      ),
                      Icon(
                        Icons.star,
                        color: ColorResources.COLOR_CARROT_ORANGE,
                        size: 9,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
