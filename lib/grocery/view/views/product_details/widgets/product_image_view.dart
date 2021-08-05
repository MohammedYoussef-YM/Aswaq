import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/data/models/product.dart';
import 'package:flutter_ui_kit/grocery/provider/product_provider.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/images.dart';
import 'package:provider/provider.dart';

class ProductImageView extends StatelessWidget {
  final GroceryProduct productModel;
  final int tagId;

  ProductImageView(this.tagId,{@required this.productModel});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tagId??1,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width - 50,
            padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                colors: [
                  ColorResources.COLOR_ICE_COLD.withOpacity(.9),
                  ColorResources.COLOR_ICE_COLD.withOpacity(.8),
                  ColorResources.COLOR_ICE_COLD.withOpacity(.7)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Stack(children: [
                    Column(
                      children: [
                        Expanded(
                          child: PageView.builder(
                            controller: _controller,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.all(40.0),
                                width: 20,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                    child: FadeInImage.assetNetwork(placeholder: Images.place_holder, image: productModel.imageUrl,fit: BoxFit.fill,width: 20,height: 20)),
                              );
                            },
                            onPageChanged: (index) {
                              Provider.of<ProductProvider>(context, listen: false).setImageSliderIndex(index);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _indicators(context),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ),
          Positioned(
              child: IconButton(
            icon: Icon(Icons.arrow_back, color: ColorResources.COLOR_WHITE),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ))
        ],
      ),
    );
  }

  List<Widget> _indicators(BuildContext context) {
    List<Widget> indicators = [];
    for (int index = 0; index < 3; index++) {
      indicators.add(TabPageSelectorIndicator(
        backgroundColor: index == Provider.of<ProductProvider>(context).imageSliderIndex ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_WHITE,
        borderColor: ColorResources.COLOR_WHITE,
        size: index == Provider.of<ProductProvider>(context).imageSliderIndex ? 12 : 8,
      ));
    }
    return indicators;
  }
}
