import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/view/basewidget/card_widget.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui_kit/academy/provider/wish_list_provider.dart';
import 'package:flutter_ui_kit/academy/view/screen/wishlist/widget/wish_list_widget.dart';

class AcademyWishListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<AcademyWishListProvider>(context, listen: false).getWishLists();

    return Scaffold(
      appBar: AppBar(
        title: Text(AcademyStrings.wishlist, style: robotoBold.copyWith(fontSize: 20)),
        backgroundColor: AcademyColorResources.COLOR_WHITE,
        elevation: 0,
        actions: [CardWidget()],
      ),
      body: Consumer<AcademyWishListProvider>(
        builder: (context, wishlist, child) {
          return ListView.builder(
            itemCount: wishlist.wishLists.length,
            itemBuilder: (context, index) {
              return WishListWidget(wishListModel: wishlist.wishLists[index]);
            },
          );
        },
      ),
    );
  }
}
