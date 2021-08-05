import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/data/models/product.dart';
import 'package:flutter_ui_kit/grocery/provider/favourite_provider.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/images.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/views/product_details/product_details_screen.dart';
import 'package:provider/provider.dart';

class FavouriteItemsWidget extends StatelessWidget {
  final GroceryProduct product;
  final int index;
  FavouriteItemsWidget({this.product,this.index});

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
        //width: 165,
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
            Consumer<FavouriteProvider>(
              builder: (context, favouriteProvider, child) => Container(
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
                        image: product.imageUrl,
                        height: 130,
                        fit: BoxFit.fill,
                        width: double.infinity,),
                    ),
                    Positioned(
                        top: 10,
                        right: 8,
                        child: InkWell(
                          onTap: (){
                            favouriteProvider.changeFavouriteStatus(index);
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(color: ColorResources.COLOR_BLACK.withOpacity(.15), borderRadius: BorderRadius.circular(10)),
                            child: Icon(
                              product.isFabourite ? Icons.favorite : Icons.favorite_border,
                              color: product.isFabourite ? Colors.red : ColorResources.COLOR_PRIMARY,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT,),
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
                style: poppinsRegular.copyWith(fontSize: 13, color: ColorResources.COLOR_DIM_GRAY),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
