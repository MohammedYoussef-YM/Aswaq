import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_ui_kit/grocery/provider/choose_category_provider.dart';
import 'package:flutter_ui_kit/grocery/provider/home_provider.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/views/home/widgets/category_widget.dart';
import 'package:flutter_ui_kit/grocery/view/views/home/widgets/home_slider_widget.dart';
import 'package:flutter_ui_kit/grocery/view/views/home/widgets/like_product_widget.dart';
import 'package:flutter_ui_kit/grocery/view/views/home/widgets/search_widget.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/product_item_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class GroceryHomeScreen extends StatelessWidget {
  double _crossAxisSpacing = 10, _mainAxisSpacing = 10;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Provider.of<GroceryHomeProvider>(context, listen: false).initializeBannerList();
    Provider.of<GroceryHomeProvider>(context, listen: false).initializeCategoryList();
    Provider.of<GroceryHomeProvider>(context, listen: false).initializeLikeProducts();
    Provider.of<GroceryHomeProvider>(context, listen: false).initializePopularProducts();
    Provider.of<ChooseCategoryProvider>(context, listen: false).initializeChooseCateoryList();
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          slivers: [
            // App Bar
            SliverAppBar(
              floating: true,
              elevation: 0,
              centerTitle: false,
              toolbarHeight: 10,
              automaticallyImplyLeading: false,
              backgroundColor: ColorResources.COLOR_WHITE,
            ),

            // Search Button
            SliverPersistentHeader(
                pinned: true,
                delegate: SliverDelegate(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL, vertical: 2),
                  color: ColorResources.COLOR_WHITE,
                  alignment: Alignment.center,
                  child: SearchWidget(
                    hintText: Strings.type_what_you_want,
                  ),
                ))),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          CarouselSlider.builder(
                            itemCount: Provider.of<GroceryHomeProvider>(context, listen: false).bannerList.length,
                            itemBuilder: (context, index, _) => HomeSliderWidget(
                              imageUrl: Provider.of<GroceryHomeProvider>(context, listen: false).bannerList[index],
                            ),
                            options: CarouselOptions(
                              autoPlay: true,
                              //aspectRatio: 3,
                              height: 160,
                              disableCenter: true,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                              initialPage: Provider.of<GroceryHomeProvider>(context, listen: false).bannerIndex,
                              viewportFraction: 1.0,
                              onPageChanged: (int index, reason) {
                                Provider.of<GroceryHomeProvider>(context, listen: false).updateBannerIndex(index);
                              },
                            ),
                          ),
                          Positioned(
                            bottom: 2,
                            left: 0,
                            right: 0,
                            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: _indicator(context)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                    Text(Strings.category, style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK)),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    Container(
                      height: 80,
                      //color: ColorResources.COLOR_CARROT_ORANGE,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: Provider.of<GroceryHomeProvider>(context, listen: false).categoryList.length,
                        itemBuilder: (context, index) => CategoryWidget(
                          categoryModel: Provider.of<GroceryHomeProvider>(context, listen: false).categoryList[index],
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                    Text(
                      Strings.you_may_like,
                      style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    Container(
                      height: 120,
                      //color: ColorResources.COLOR_CARROT_ORANGE,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: Provider.of<GroceryHomeProvider>(context, listen: false).likeProducts.length,
                        itemBuilder: (context, index) => LikeProductWidget(
                          product: Provider.of<GroceryHomeProvider>(context, listen: false).likeProducts[index],
                          index: index,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                    Text(
                      Strings.popular_items,
                      style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    Consumer<GroceryHomeProvider>(
                      builder: (context, groceryHomeProvider, child) => StaggeredGridView.countBuilder(
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
                    SizedBox(height: 30),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _indicator(BuildContext context) {
    List<Widget> indicator = [];
    for (int i = 0; i < Provider.of<GroceryHomeProvider>(context).bannerList.length; i++) {
      indicator.add(TabPageSelectorIndicator(
        backgroundColor: i == Provider.of<GroceryHomeProvider>(context).bannerIndex ? Colors.orange : ColorResources.COLOR_WHITE,
        borderColor: i == Provider.of<GroceryHomeProvider>(context).bannerIndex ? Colors.orange : ColorResources.COLOR_WHITE,
        size: 8,
      ));
    }
    return indicator;
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  SliverDelegate({@required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 55;

  @override
  double get minExtent => 55;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 50 || oldDelegate.minExtent != 50 || child != oldDelegate.child;
  }
}
