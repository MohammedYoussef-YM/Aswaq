import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/provider/favourite_provider.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/views/favourite/widgets/favourite_items.dart';
import 'package:flutter_ui_kit/wallet/utility/dimensions.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> with SingleTickerProviderStateMixin {
  TabController _controller;

  List<Widget> list = [
    Tab(text: Strings.ingredients),
    Tab(text: Strings.meals),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<FavouriteProvider>(context, listen: false).initializeFavouriteList();
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 0,
        bottom: TabBar(
          onTap: (index) {
            // Should not used it as it only called when tab options are clicked,
            // not when user swapped
          },
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: ColorResources.COLOR_PRIMARY,
          controller: _controller,
          labelColor: ColorResources.COLOR_PRIMARY,
          unselectedLabelColor: ColorResources.COLOR_GRAY,
          tabs: list,
        ),
        leading: SizedBox.shrink(),
        title: Text(
          Strings.favourites,
          style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK, fontSize: Dimensions.FONT_SIZE_LARGE),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        child: TabBarView(
          controller: _controller,
          children: [
            FavouriteItems(),
            FavouriteItems(),
          ],
        ),
      ),
    );
  }
}
