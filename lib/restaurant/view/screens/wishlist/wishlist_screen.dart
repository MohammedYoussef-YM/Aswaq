import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/wishlist_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_app_bar.dart';
import 'package:flutter_ui_kit/restaurant/view/base/no_data_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/base/product_widget.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatefulWidget {
  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: getTranslated('my_favourite', context), isBackButtonExist: false),
      body: Consumer<RestWishListProvider>(
        builder: (context, wishlistProvider, child) => wishlistProvider.wishList != null
            ? wishlistProvider.wishIdList.length > 0 ? ListView.builder(
                itemCount: wishlistProvider.wishList.length,
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                itemBuilder: (context, index) {
                  return ProductWidget(product: wishlistProvider.wishList[index]);
                }) : NoDataScreen()
            : Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(ColorResources.COLOR_PRIMARY))),
      ),
    );
  }
}
