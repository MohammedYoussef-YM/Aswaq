import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_ui_kit/grocery/provider/home_provider.dart';
import 'package:flutter_ui_kit/grocery/provider/search_provider.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/views/home/widgets/search_widget.dart';
import 'package:flutter_ui_kit/grocery/view/views/search/search_screen_two.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/product_item_widget.dart';
import 'package:provider/provider.dart';

class GrocerySearchScreen extends StatefulWidget {
  @override
  _GrocerySearchScreenState createState() => _GrocerySearchScreenState();
}

class _GrocerySearchScreenState extends State<GrocerySearchScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;
  double _crossAxisSpacing = 12, _mainAxisSpacing = 12;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _tabController = new TabController(length: list.length, vsync: this);
    super.initState();
  }

  List<Widget> list = [
    Tab(text: Strings.for_you),
    Tab(
      text: Strings.popular,
    ),
    Tab(
      text: Strings.chepest,
    ),
    Tab(
      text: Strings.discount,
    ),
  ];

  Widget _searchTabWidget(BuildContext context) {
    return Consumer<GroceryHomeProvider>(
      builder: (context, groceryHomeProvider, child) => StaggeredGridView.countBuilder(
          shrinkWrap: true,
          // 1st add
          physics: NeverScrollableScrollPhysics(),
          // 2nd add
          itemCount: groceryHomeProvider.popularProducts.length,
          crossAxisCount: 4,
          staggeredTileBuilder: (int index) => new StaggeredTile.count(2, 2.65),
          mainAxisSpacing: _mainAxisSpacing,
          crossAxisSpacing: _crossAxisSpacing,
          itemBuilder: (context, index) => ProductItemWidget(
                product: groceryHomeProvider.popularProducts[index],
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SearchProvider>(context, listen: false).initalizeAllSearchCategory();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<SearchProvider>(
                      builder: (context, searchProvider, child) => Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),

                        // dropdown below..
                        child: DropdownButton<String>(
                            value: searchProvider.dropdownInitializeValue,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              size: 20,
                            ),
                            iconSize: 42,
                            underline: SizedBox(),
                            onChanged: searchProvider.updateDropDownValue,
                            items: searchProvider.getAllSearchCategory.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList()),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreenTwo()));
                        },
                        child: SearchWidget(
                          hintText: Strings.type_what_you_want,
                        )),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_DEFAULT,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Strings.history, style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK, fontSize: 15)),
                        Text(Strings.clear, style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY, fontSize: 15)),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_DEFAULT,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Strings.eggs, style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY, fontSize: 15)),
                        Icon(
                          Icons.clear,
                          size: 16,
                        )
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_SMALL,
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: ColorResources.COLOR_GRAY.withOpacity(.2),
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_SMALL,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Strings.apple, style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY, fontSize: 15)),
                        Icon(Icons.clear, size: 16)
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_SMALL,
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: ColorResources.COLOR_GRAY.withOpacity(.2),
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_SMALL,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Strings.banana, style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY, fontSize: 15)),
                        Icon(Icons.clear, size: 16)
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_SMALL,
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: ColorResources.COLOR_GRAY.withOpacity(.2),
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_LARGE,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        Strings.show_more,
                        style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY),
                      ),
                    ),
                    TabBar(
                      onTap: (index) {
                        // Should not used it as it only called when tab options are clicked,
                        // not when user swapped
                      },
                      isScrollable: true,
                      indicatorColor: ColorResources.COLOR_PRIMARY,
                      controller: _tabController,
                      labelColor: ColorResources.COLOR_PRIMARY,
                      unselectedLabelColor: ColorResources.COLOR_GRAY,
                      tabs: list,
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                    Container(
                      height: 1580,
                      child: TabBarView(
                        children: [
                          _searchTabWidget(context),
                          _searchTabWidget(context),
                          _searchTabWidget(context),
                          _searchTabWidget(context),
                        ],
                        controller: _tabController,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
