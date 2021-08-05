import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/provider/cart_provider.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/views/cart/widget/single_items_widget.dart';
import 'package:flutter_ui_kit/grocery/view/views/cart/widget/single_items_widget_two.dart';
import 'package:flutter_ui_kit/grocery/view/views/checkout/checkout_screen.dart';
import 'package:provider/provider.dart';

class GroceryCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<CartProvider>(context, listen: false).iniatializeSingleItems();
    Provider.of<CartProvider>(context, listen: false).iniatializeFreshSaladItems();
    final ScrollController _scrollController = ScrollController();

    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT, top: Dimensions.PADDING_SIZE_DEFAULT),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.cart,
                style: poppinsRegular.copyWith(color: ColorResources.COLOR_LIGHT_BLACK, fontSize: 22),
              ),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              Expanded(
                child: Consumer<CartProvider>(
                  builder: (context, cartProvider, child) =>
                      CustomScrollView(controller: _scrollController, physics: BouncingScrollPhysics(), slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Strings.single_items, style: poppinsRegular),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: cartProvider.singleItems.length,
                              itemBuilder: (context, index) => SingleItemsWidget(
                                    index: index,
                                    product: cartProvider.singleItems[index],
                                  )),
                          Container(
                              height: 1,
                              width: double.infinity,
                              color: ColorResources.COLOR_GRAY.withOpacity(.2),
                              margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_DEFAULT, bottom: Dimensions.PADDING_SIZE_DEFAULT)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(Strings.fresh_salad_pasta, style: poppinsRegular),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      icon: Icon(
                                        Icons.remove,
                                        color: ColorResources.COLOR_PRIMARY,
                                      ),
                                      onPressed: () {}),
                                  Text(
                                    '2',
                                    style: poppinsRegular,
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: ColorResources.COLOR_PRIMARY,
                                      ),
                                      onPressed: () {}),
                                ],
                              ),
                            ],
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: cartProvider.getFreshSaladItems.length,
                              itemBuilder: (context, index) => SingleItemsWidgetTwo(
                                    index: index,
                                    product: cartProvider.getFreshSaladItems[index],
                                  )),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckoutScreen()));
                },
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(color: ColorResources.COLOR_WHITE),
                  child: Container(
                    margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_DEFAULT, top: Dimensions.PADDING_SIZE_DEFAULT),
                    padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT),
                    decoration: BoxDecoration(color: ColorResources.COLOR_PRIMARY, borderRadius: BorderRadius.circular(8.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.dollar_5,
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
            ],
          ),
        ),
      ),
    );
  }
}
