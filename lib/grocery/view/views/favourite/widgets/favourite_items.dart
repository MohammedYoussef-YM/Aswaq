import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_ui_kit/grocery/provider/favourite_provider.dart';
import 'package:flutter_ui_kit/grocery/view/views/favourite/widgets/favourite_item_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FavouriteItems extends StatelessWidget {
  double _crossAxisSpacing = 12, _mainAxisSpacing = 10;


  final ScrollController _scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(
      builder: (context, favouriteProvider, child) => CustomScrollView(
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                  // 1st add
                  physics: ClampingScrollPhysics(),
                  // 2nd add
                  itemCount: favouriteProvider.getAllFavouriteList.length,
                  crossAxisCount: 4,
                  staggeredTileBuilder: (int index) => new StaggeredTile.count(2, 2.5),
                  mainAxisSpacing: _mainAxisSpacing,
                  crossAxisSpacing: _crossAxisSpacing,
                  itemBuilder: (context, index) => FavouriteItemsWidget(product: favouriteProvider.getAllFavouriteList[index],index: index,)),
            ],
          ),
        )
      ]),
    );
  }
}
