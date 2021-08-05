import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/restaurant/helper/product_type.dart';
import 'package:flutter_ui_kit/restaurant/provider/product_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/view/base/no_data_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/base/product_shimmer.dart';
import 'package:flutter_ui_kit/restaurant/view/base/product_widget.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
  final ProductType productType;
  final ScrollController scrollController;
  ProductView({@required this.productType, this.scrollController});

  @override
  Widget build(BuildContext context) {
    if(productType == ProductType.POPULAR_PRODUCT) {
      Provider.of<RestProductProvider>(context, listen: false).getPopularProductList(context, '1');
    }

    int offset = 1;
    scrollController?.addListener(() {
      if(scrollController.position.maxScrollExtent == scrollController.position.pixels
          && Provider.of<RestProductProvider>(context, listen: false).popularProductList != null
          && !Provider.of<RestProductProvider>(context, listen: false).isLoading) {
        int pageSize;
        if(productType == ProductType.POPULAR_PRODUCT) {
          pageSize = (Provider.of<RestProductProvider>(context, listen: false).popularPageSize / 10).ceil();
        }
        if(offset < pageSize) {
          offset++;
          print('end of the page');
          Provider.of<RestProductProvider>(context, listen: false).showBottomLoader();
          Provider.of<RestProductProvider>(context, listen: false).getPopularProductList(context, offset.toString());
        }
      }
    });
    return Consumer<RestProductProvider>(
      builder: (context, prodProvider, child) {
        List<Product> productList;
        if(productType == ProductType.POPULAR_PRODUCT) {
          productList = prodProvider.popularProductList;
        }

        return Column(children: [

          productList != null ? productList.length > 0 ? ListView.builder(
            itemCount: productList.length,
            padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return ProductWidget(product: productList[index]);
            },
          ) : NoDataScreen() : ListView.builder(
            itemCount: 10,
            padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return ProductShimmer(isEnabled: productList == null);
            },
          ),

          prodProvider.isLoading ? Center(child: Padding(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
          )) : SizedBox.shrink(),

        ]);
      },
    );
  }
}
