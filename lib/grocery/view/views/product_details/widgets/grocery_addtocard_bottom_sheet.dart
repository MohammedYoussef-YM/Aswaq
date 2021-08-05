import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/data/models/product.dart';
import 'package:flutter_ui_kit/grocery/provider/product_provider.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/images.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_button.dart';
import 'package:provider/provider.dart';

void groceryAddToCardBottomSheet(BuildContext context,GroceryProduct product, Function callback) {
  Provider.of<ProductProvider>(context, listen: false).setCounter(1);
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        return new Container(
          height: 385.0,
          color: Colors.transparent, //could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child: new Container(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(topLeft: const Radius.circular(10.0), topRight: const Radius.circular(10.0))),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.clear, size: 18),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Expanded(
                          child: Center(
                              child: Text(Strings.add_new_items, style: poppinsRegular.copyWith(fontSize: 17, color: ColorResources.COLOR_GRAY))))
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(children: [
                    Container(
                      width: 64,
                      height: 64,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage.assetNetwork(
                              placeholder: Images.place_holder,
                              image: product.imageUrl, fit: BoxFit.fill)),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(product.name, style: poppinsRegular.copyWith(fontSize: 17, color: ColorResources.COLOR_GRAY)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.quantity,
                              style: poppinsRegular.copyWith(fontSize: 13, color: ColorResources.COLOR_GRAY.withOpacity(.5)),
                            ),
                            Text(
                              product.runningPrice,
                              style: poppinsRegular.copyWith(fontSize: 15, color: ColorResources.COLOR_BLACK),
                            )
                          ],
                        ),
                      ]),
                    ),
                  ]),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Strings.amount,
                        style: poppinsRegular.copyWith(fontSize: 15, color: ColorResources.COLOR_GRAY),
                      ),
                      Text(
                        product.runningPrice,
                        style: poppinsRegular.copyWith(fontSize: 15, color: ColorResources.COLOR_BLACK),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Strings.total_price,
                        style: poppinsRegular.copyWith(fontSize: 15, color: ColorResources.COLOR_GRAY),
                      ),
                      Text(
                        product.runningPrice,
                        style: poppinsRegular.copyWith(fontSize: 22, color: ColorResources.COLOR_PRIMARY),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Consumer<ProductProvider>(
                    builder: (context, productProvider, child) {
                      return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        IconButton(
                          icon: Icon(Icons.remove, color: ColorResources.COLOR_PRIMARY),
                          onPressed: productProvider.decrementCountProduct,
                        ),
                        Text(productProvider.countProduct.toString()),
                        IconButton(
                          icon: Icon(Icons.add, color: ColorResources.COLOR_PRIMARY),
                          onPressed: productProvider.incrementCountProduct,
                        ),
                        Expanded(child: SizedBox.shrink()),
                        Expanded(
                          flex: 2,
                          child: CustomButton(
                            btnTxt: Strings.add_to_cart,
                            onTap: () {
                              Navigator.pop(context);
                              callback();
                            },
                          ),
                        ),
                      ]);
                    },
                  ),
                  SizedBox(height: 20),
                ],
              )),
        );
      });
}