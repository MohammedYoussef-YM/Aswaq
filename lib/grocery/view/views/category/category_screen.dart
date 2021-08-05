import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/product_items.dart';
import 'package:flutter_ui_kit/grocery/view/views/search/search_screen_two.dart';

class GroceryCategoryScreen extends StatefulWidget {
  final String categoryName;
  GroceryCategoryScreen({this.categoryName});

  @override
  _GroceryCategoryScreenState createState() => _GroceryCategoryScreenState();
}

class _GroceryCategoryScreenState extends State<GroceryCategoryScreen> with SingleTickerProviderStateMixin{

  TabController _controller;

  List<Widget> list = [
    Tab(text: Strings.all,),
    Tab(text: Strings.for_you,),
    Tab(text: Strings.apple,),
    Tab(text: Strings.banana,),
    Tab(text: Strings.watermelon,),
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchScreenTwo()));
        })],
        bottom: TabBar(
          onTap: (index) {
            // Should not used it as it only called when tab options are clicked,
            // not when user swapped
          },
          isScrollable: true,
          indicatorColor: ColorResources.COLOR_PRIMARY,
          controller: _controller,
          labelColor: ColorResources.COLOR_PRIMARY,
          unselectedLabelColor: ColorResources.COLOR_GRAY,
          tabs: list,
        ),
        title: Text(widget.categoryName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        child: TabBarView(
          controller: _controller,
          children: [
            ProductItems(),
            ProductItems(),
            ProductItems(),
            ProductItems(),
            ProductItems(),
          ],
        ),
      ),
    );
  }
}
