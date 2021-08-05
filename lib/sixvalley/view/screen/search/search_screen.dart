import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/helper/network_info.dart';
import 'package:flutter_ui_kit/sixvalley/localization/language_constrants.dart';
import 'package:flutter_ui_kit/sixvalley/provider/search_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/no_internet_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/product_shimmer.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/search_widget.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/search/widget/search_product_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<SixSearchProvider>(context, listen: false).cleanSearchProduct();
    NetworkInfo.checkConnectivity(context);

    return Scaffold(
      backgroundColor: ColorResources.getIconBg(context),
      body: Column(
        children: [

          SizedBox(height: 8),
          // for tool bar
          SearchWidget(
            hintText: getTranslated('SEARCH_HINT', context),
            onSubmit: (String text) {
              Provider.of<SixSearchProvider>(context, listen: false).searchProduct(text);
              Provider.of<SixSearchProvider>(context, listen: false).saveSearchAddress(text);
            },
            onClearPressed: () {
              Provider.of<SixSearchProvider>(context, listen: false).cleanSearchProduct();
            },
          ),

          Consumer<SixSearchProvider>(
            builder: (context, searchProvider, child) {
              return !searchProvider.isClear ? searchProvider.searchProductList != null ? searchProvider.searchProductList.length > 0
                  ? Expanded(child: SearchProductWidget(products: searchProvider.searchProductList, isViewScrollable: true))
                  : Expanded(child: NoInternetOrDataScreen(isNoInternet: false))
                  : Expanded(child: ProductShimmer(isEnabled: Provider.of<SixSearchProvider>(context).searchProductList == null))
                  : Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Consumer<SixSearchProvider>(
                        builder: (context, searchProvider, child) => StaggeredGridView.countBuilder(
                          crossAxisCount: 3,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: searchProvider.historyList.length,
                          itemBuilder: (context, index) => Container(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  Provider.of<SixSearchProvider>(context, listen: false).searchProduct(searchProvider.historyList[index]);
                                },
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: ColorResources.getGrey(context)),
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      Provider.of<SixSearchProvider>(context, listen: false).historyList[index] ?? "",
                                      style: titilliumItalic.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                    ),
                                  ),
                                ),
                              )),
                          staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                        ),
                      ),
                      Positioned(
                        top: -5,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(getTranslated('SEARCH_HISTORY', context), style: robotoBold),
                            InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  Provider.of<SixSearchProvider>(context, listen: false).clearSearchAddress();
                                },
                                child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      getTranslated('REMOVE', context),
                                      style: titilliumRegular.copyWith(
                                          fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLUMBIA_BLUE),
                                    )))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
