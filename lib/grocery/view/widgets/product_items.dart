import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_ui_kit/grocery/provider/home_provider.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/product_item_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProductItems extends StatelessWidget {
  double _crossAxisSpacing = 12, _mainAxisSpacing = 12;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer<GroceryHomeProvider>(
      builder: (context, groceryHomeProvider, child) => CustomScrollView(controller: _scrollController, physics: BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
            ],
          ),
        )
      ]),
    );
  }
}
