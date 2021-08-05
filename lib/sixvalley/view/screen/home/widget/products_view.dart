import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/sixvalley/helper/product_type.dart';
import 'package:flutter_ui_kit/sixvalley/provider/product_provider.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/product_shimmer.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/product_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
  final ProductType productType;
  final ScrollController scrollController;
  final String sellerId;
  ProductView({@required this.productType, this.scrollController, this.sellerId});

  @override
  Widget build(BuildContext context) {
    if(productType == ProductType.LATEST_PRODUCT) {
      Provider.of<SixProductProvider>(context, listen: false).initLatestProductList();
    }else if(productType == ProductType.SELLER_PRODUCT) {
      Provider.of<SixProductProvider>(context, listen: false).clearSellerData();
      Provider.of<SixProductProvider>(context, listen: false).initSellerProductList();
    }

    int offset = 1;
    scrollController?.addListener(() {
      if(scrollController.position.maxScrollExtent == scrollController.position.pixels
          && Provider.of<SixProductProvider>(context, listen: false).latestProductList.length != 0) {
        int pageSize;
        if(offset < pageSize) {
          offset++;
          print('end of the page');
        }
      }
    });

    return Consumer<SixProductProvider>(
      builder: (context, prodProvider, child) {
        List<Product> productList;
        if(productType == ProductType.LATEST_PRODUCT) {
          productList = prodProvider.latestProductList;
        }else if(productType == ProductType.SELLER_PRODUCT) {
          productList = prodProvider.sellerProductList;
        }

        return Column(children: [

          !prodProvider.firstLoading ? productList.length != 0 ? StaggeredGridView.countBuilder(
            itemCount: productList.length,
            crossAxisCount: 2,
            padding: EdgeInsets.all(0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
            itemBuilder: (BuildContext context, int index) {
              return ProductWidget(productModel: productList[index]);
            },
          ) : SizedBox.shrink() : ProductShimmer(isEnabled: prodProvider.firstLoading),

        ]);
      },
    );
  }
}

