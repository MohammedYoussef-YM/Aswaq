import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/search_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_text_field.dart';
import 'package:flutter_ui_kit/restaurant/view/base/no_data_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/base/product_shimmer.dart';
import 'package:flutter_ui_kit/restaurant/view/base/product_widget.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/search/widget/filter_widget.dart';
import 'package:provider/provider.dart';

class SearchResultScreen extends StatelessWidget {
  final String searchString;

  SearchResultScreen({this.searchString});

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    int atamp = 0;
    if (atamp == 0) {
      _searchController.text = searchString;
      atamp = 1;
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
            child: Consumer<RestSearchProvider>(
              builder: (context, searchProvider, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          hintText: getTranslated('search_items_here', context),
                          isShowBorder: true,
                          isShowSuffixIcon: true,
                          suffixIconUrl: Images.filter,
                          controller: _searchController,
                          isShowPrefixIcon: true,
                          prefixIconUrl: Images.search,
                          inputAction: TextInputAction.search,
                          isIcon: true,
                          onSuffixTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0)),
                                    child: FilterWidget(onTap: () {

                                    }),
                                  );
                                });

                          },
                        ),
                      ),
                      SizedBox(width: 12),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 10,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 24),
                  searchProvider.searchProductList != null
                      ? Text(
                          '${searchProvider.searchProductList.length} ${getTranslated('product_found', context)}',
                          style: Theme.of(context).textTheme.headline2.copyWith(color: ColorResources.getGreyBunkerColor(context)),
                        )
                      : SizedBox.shrink(),
                  SizedBox(height: 13),
                  Expanded(
                    child: searchProvider.searchProductList != null
                        ? searchProvider.searchProductList.length > 0
                            ? ListView.builder(
                                itemCount: searchProvider.searchProductList.length,
                                itemBuilder: (context, index) => ProductWidget(product: searchProvider.searchProductList[index]))
                            : NoDataScreen()
                        : ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => ProductShimmer(isEnabled: searchProvider.searchProductList == null),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
