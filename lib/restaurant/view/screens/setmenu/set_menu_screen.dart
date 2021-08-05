import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/cart_model.dart';
import 'package:flutter_ui_kit/restaurant/helper/price_converter.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/set_menu_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_app_bar.dart';
import 'package:flutter_ui_kit/restaurant/view/base/no_data_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/base/rating_bar.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/home/widget/cart_bottom_sheet.dart';
import 'package:provider/provider.dart';

class RestSetMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: getTranslated('set_menu', context)),
      body: Consumer<RestSetMenuProvider>(
        builder: (context, setMenu, child) {
          return setMenu.setMenuList.length > 0 ? GridView.builder(
            itemCount: setMenu.setMenuList.length,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2, childAspectRatio: 1/1.2),
            itemBuilder: (context, index) {
              double _discount = double.parse(setMenu.setMenuList[index].price) - PriceConverter.convertWithDiscount(context,
                  double.parse(setMenu.setMenuList[index].price), setMenu.setMenuList[index].discount, setMenu.setMenuList[index].discountType);

              return InkWell(
                onTap: () {
                  showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: Colors.transparent, builder: (con) => CartBottomSheet(
                    product: setMenu.setMenuList[index], fromSetMenu: true,
                    callback: (CartModel cartModel) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to cart'), backgroundColor: Colors.green));
                    },
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: Colors.grey[300], blurRadius: 5, spreadRadius: 1)]
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                      child: FadeInImage.assetNetwork(
                        placeholder: Images.placeholder,
                        image: setMenu.setMenuList[index].image,
                          height: 110, width: MediaQuery.of(context).size.width/2, fit: BoxFit.cover,
                      )
                    ),

                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                          Text(
                            setMenu.setMenuList[index].name,
                            style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                            maxLines: 2, overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          RatingBar(
                            rating: setMenu.setMenuList[index].rating.length > 0 ? double.parse(setMenu.setMenuList[index].rating[0].average) : 0.0,
                            size: 12,
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                PriceConverter.convertPrice(context, double.parse(setMenu.setMenuList[index].price),
                                    discount: setMenu.setMenuList[index].discount, discountType: setMenu.setMenuList[index].discountType),
                                style: rubikBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                              ),
                              _discount < 1 ? Icon(Icons.add, color: Theme.of(context).textTheme.bodyText1.color) : SizedBox(),
                            ],
                          ),
                          _discount > 0 ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            Text(
                              PriceConverter.convertPrice(context, double.parse(setMenu.setMenuList[index].price)),
                              style: rubikBold.copyWith(
                                fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                                color: ColorResources.getGreyColor(context),
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Icon(Icons.add, color: Theme.of(context).textTheme.bodyText1.color),
                          ]) : SizedBox(),
                        ]),
                      ),
                    ),

                  ]),
                ),
              );
            },
          ) : NoDataScreen();
        },
      ),
    );
  }
}
