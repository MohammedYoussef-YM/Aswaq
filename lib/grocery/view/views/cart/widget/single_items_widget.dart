import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/data/models/product.dart';
import 'package:flutter_ui_kit/grocery/provider/cart_provider.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/images.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:provider/provider.dart';

class SingleItemsWidget extends StatelessWidget {
  final int index;
  final GroceryProduct product;

  SingleItemsWidget({this.index, this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 80,
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: ColorResources.COLOR_PRIMARY.withOpacity(.5),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: FadeInImage.assetNetwork(placeholder: Images.place_holder, image: product.imageUrl, width: 80, height: 80, fit: BoxFit.fill)),
          ),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL,),
      Consumer<CartProvider>(
        builder: (context, cartProvider, child) =>Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
            Text(product.name, style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK, fontSize: Dimensions.FONT_SIZE_DEFAULT),),
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.runningPrice, style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY),),
                SizedBox(width: 60,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: Icon(Icons.remove, color: ColorResources.COLOR_PRIMARY,), onPressed: () {
                      cartProvider.decrementSingleItem(index);
                    }),
                    Text(product.count.toString(),style: poppinsRegular,),
                    IconButton(icon: Icon(Icons.add, color: ColorResources.COLOR_PRIMARY,), onPressed: () {
                      cartProvider.incrementSingleItem(index);
                    }),
                  ],
                ),
              ],
            ),
          ],
        ),),

        ],
      ),
    );
  }
}
