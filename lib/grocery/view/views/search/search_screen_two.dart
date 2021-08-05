import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/provider/search_provider.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/product_item_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SearchScreenTwo extends StatelessWidget {
  double _crossAxisSpacing = 12, _mainAxisSpacing = 12, _aspectRatio = 0.7;
  int _crossAxisCount = 2;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Provider.of<SearchProvider>(context, listen: false).initializeProducts();
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
            controller: _scrollController,
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.search,
                        style: poppinsRegular.copyWith(
                            color: ColorResources.COLOR_LIGHT_BLACK,
                            fontSize: 22),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Container(
                          height: 54,
                          decoration: BoxDecoration(
                              color: ColorResources.COLOR_GOOGLE,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Row(
                            children: [
                              Consumer<SearchProvider>(
                                builder: (context, searchProvider, child) =>
                                    Expanded(
                                  child: TextField(
                                    style: poppinsRegular.copyWith(
                                        color: ColorResources.COLOR_BLACK),
                                    cursorColor: ColorResources.COLOR_PRIMARY,
                                    autofocus: true,
                                    onChanged: searchProvider.searchProduct,
                                    decoration: InputDecoration(
                                      hintText: Strings.search,
                                      contentPadding: EdgeInsets.only(
                                          left:
                                              Dimensions.PADDING_SIZE_DEFAULT),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintStyle: poppinsRegular,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.only(
                                    right: Dimensions.PADDING_SIZE_SMALL),
                                decoration: BoxDecoration(
                                    color: ColorResources.COLOR_PRIMARY,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Icon(
                                  Icons.search,
                                  color: ColorResources.COLOR_WHITE,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Consumer<SearchProvider>(
                        builder: (context, searchProvider, child) =>
                            GridView.builder(
                                shrinkWrap: true,
                                // 1st add
                                physics: ClampingScrollPhysics(),
                                // 2nd add
                                itemCount: searchProvider.products.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: _crossAxisCount,
                                  crossAxisSpacing: _crossAxisSpacing,
                                  mainAxisSpacing: _mainAxisSpacing,
                                  childAspectRatio: _aspectRatio,
                                ),
                                itemBuilder: (context, index) =>
                                    ProductItemWidget(
                                      product: searchProvider.products[index],
                                    )),
                      ),
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
