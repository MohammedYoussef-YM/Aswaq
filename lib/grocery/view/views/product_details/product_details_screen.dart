import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/data/models/product.dart';
import 'package:flutter_ui_kit/grocery/provider/product_provider.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/views/checkout/checkout_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/product_details/widgets/grocery_addtocard_bottom_sheet.dart';
import 'package:flutter_ui_kit/grocery/view/views/product_details/widgets/product_image_view.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_ui_kit/grocery/provider/home_provider.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/product_item_widget.dart';

// ignore: must_be_immutable
class ProductDetailsScreen extends StatelessWidget {
  final GroceryProduct product;

  ProductDetailsScreen({this.product});

  double _crossAxisSpacing = 12, _mainAxisSpacing = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_ICE_COLD,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ProductImageView(product.id??1,productModel: product,),
                  Container(
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                    decoration: BoxDecoration(
                        color: ColorResources.COLOR_WHITE,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.PADDING_SIZE_DEFAULT), topRight: Radius.circular(Dimensions.PADDING_SIZE_DEFAULT))),
                    child: ListView(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      children: [
                        Text(
                          product.name,
                          style: poppinsRegular.copyWith(
                            color: ColorResources.COLOR_BLACK,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  product.runningPrice,
                                  style: poppinsRegular.copyWith(fontSize: 17, color: ColorResources.COLOR_PRIMARY),
                                ),
                                SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
                                Text(
                                  product.previoudPrice,
                                  style: poppinsRegular.copyWith(
                                      decorationStyle: TextDecorationStyle.solid, fontSize: 13, decoration: TextDecoration.lineThrough),
                                ),
                              ],
                            ),
                            Container(
                              width: 80,
                              height: 25,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0), color: ColorResources.COLOR_DODGER_BLUE),
                              child: Center(
                                  child: Text(Strings.free_ship,
                                      style: poppinsRegular.copyWith(color: ColorResources.COLOR_WHITE, fontSize: Dimensions.FONT_SIZE_SMALL))),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        // for condition like safe,quality
                        Padding(
                          padding: const EdgeInsets.only(right: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.data_usage,
                                    color: ColorResources.COLOR_PRIMARY,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: Dimensions.PADDING_SIZE_SMALL,
                                  ),
                                  Text(
                                    Strings.safe,
                                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY, fontSize: 15.0),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.equalizer,
                                    color: ColorResources.COLOR_PRIMARY,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: Dimensions.PADDING_SIZE_SMALL,
                                  ),
                                  Text(
                                    Strings.quality,
                                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY, fontSize: 15.0),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.fiber_smart_record_sharp,
                                    color: ColorResources.COLOR_PRIMARY,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: Dimensions.PADDING_SIZE_SMALL,
                                  ),
                                  Text(
                                    Strings.fresh,
                                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY, fontSize: 15.0),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          Strings.everybody_enjoy_indulging_in_juicy_red,
                          style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY, fontSize: 13),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Container(
                            margin: EdgeInsets.only(left: 70),
                            child: Builder(
                              builder: (context) => CustomButton(
                                btnTxt: Strings.add_to_cart,
                                onTap: () {
                                  groceryAddToCardBottomSheet(context, product, () {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to cart'), backgroundColor: Colors.green));
                                  });
                                },
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          Strings.similar_products,
                          style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY, fontSize: 17),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Consumer<GroceryHomeProvider>(
                          builder: (context, groceryHomeProvider, child) =>
                              StaggeredGridView.countBuilder(
                                  shrinkWrap: true,
                                  // 1st add
                                  physics: ClampingScrollPhysics(),
                                  // 2nd add
                                  itemCount: groceryHomeProvider.popularProducts.length,
                                  crossAxisCount: 4,
                                  staggeredTileBuilder: (int index) => new StaggeredTile.count(2, 2.65),
                                  mainAxisSpacing: _mainAxisSpacing,
                                  crossAxisSpacing: _crossAxisSpacing,
                                  itemBuilder: (context, index) => ProductItemWidget(
                                    product: groceryHomeProvider.popularProducts[index],
                                  )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Consumer<ProductProvider>(
              builder: (context, productProvider, child) => productProvider.countProduct != 0
                  ? InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckoutScreen()));
                },
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(color: ColorResources.COLOR_WHITE),
                  child: Container(
                    margin: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                    padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT),
                    decoration: BoxDecoration(color: ColorResources.COLOR_PRIMARY, borderRadius: BorderRadius.circular(8.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.runningPrice,
                          style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: ColorResources.COLOR_WHITE),
                        ),
                        Row(
                          children: [
                            Text(Strings.check_out,
                                style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: ColorResources.COLOR_WHITE)),
                            SizedBox(
                              width: Dimensions.PADDING_SIZE_LARGE,
                            ),
                            Icon(Icons.arrow_forward, color: ColorResources.COLOR_WHITE, size: 18)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
                  : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
