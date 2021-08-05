import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/data/models/product.dart';
import 'package:flutter_ui_kit/grocery/provider/home_provider.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/images.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/views/detail_meal/detail_meal_screen.dart';
import 'package:provider/provider.dart';

class LikeProductWidget extends StatelessWidget {
  final GroceryProduct product;
  final int index;

  LikeProductWidget({this.product, this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailMealScreen()));
      },
      child: Container(
        //color: ColorResources.COLOR_BLACK,
        height: 120,
        width: 210,
        margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                child: FadeInImage.assetNetwork(
                  placeholder: Images.place_holder,
                  image: product.imageUrl,
                  height: 120,
                  width: 210,
                  fit: BoxFit.fill,)),
            Positioned(
                bottom: 0,
                child: Container(
                  height: 41,
                  width: 210,
                  padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT),
                  decoration: BoxDecoration(
                      color: ColorResources.COLOR_BLACK.withOpacity(.3), borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: poppinsRegular.copyWith(color: ColorResources.COLOR_YELLOW_SEA, fontSize: Dimensions.FONT_SIZE_SMALL),
                      ),
                      Text(
                        product.runningPrice,
                        style: poppinsRegular.copyWith(color: ColorResources.COLOR_WHITE, fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL),
                      ),
                    ],
                  ),
                )),
            Consumer<GroceryHomeProvider>(
              builder: (context, homeProvider, child) => Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(
                      homeProvider.likeProducts[index].isFabourite ? Icons.favorite : Icons.favorite_border,
                      color: ColorResources.COLOR_YELLOW_SEA,
                    ),
                    onPressed: () {
                      homeProvider.updateLikeFabouriteCondition(index);
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
