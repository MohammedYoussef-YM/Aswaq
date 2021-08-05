import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/view/views/cart/grocery_cart_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/dashboard/widget/bottom_nav_item.dart';
import 'package:flutter_ui_kit/grocery/view/views/favourite/favourite_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/home/grocery_home_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/profile/grocery_profile_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/search/search_screen.dart';
import 'package:flutter_ui_kit/all_app_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> children = [
    GroceryHomeScreen(),
    GrocerySearchScreen(),
    GroceryCartScreen(),
    FavouriteScreen(),
    GroceryProfileScreen(),
  ];


  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(_selectedIndex != 0) {
          _pageController.jumpToPage(0);
          setState(() {
            _selectedIndex = 0;
          });
          return false;
        }else {
          return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => AllAppScreen()), (route) => false) ?? false;
        }
      },
      child: Scaffold(

        bottomNavigationBar: BottomAppBar(
          elevation: 5,
          notchMargin: 5,
          shape: CircularNotchedRectangle(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BottomNavItem(icon: Icons.menu_book, title: Strings.recipes, isSelected: _selectedIndex == 0, onTap: () {
                    _pageController.jumpToPage(0);
                    setState(() {
                      _selectedIndex = 0;
                    });
                  }),
                ),
                Expanded(
                  child: BottomNavItem(icon: Icons.search, title: Strings.search, isSelected: _selectedIndex == 1, onTap: () {
                    _pageController.jumpToPage(1);
                    setState(() {
                      _selectedIndex = 1;
                    });
                  }),
                ),
                Expanded(
                  child: BottomNavItem(icon: Icons.shopping_cart_outlined, title: Strings.cart, isSelected: _selectedIndex == 2, onTap: () {
                    _pageController.jumpToPage(2);
                    setState(() {
                      _selectedIndex = 2;
                    });
                  }),
                ),
                Expanded(
                  child: BottomNavItem(icon: Icons.favorite_border, title: Strings.favourite, isSelected: _selectedIndex == 3, onTap: () {
                    _pageController.jumpToPage(3);
                    setState(() {
                      _selectedIndex = 3;
                    });
                  }),
                ),
                Expanded(
                  child: BottomNavItem(icon: Icons.person_outline, title: Strings.profile, isSelected: _selectedIndex == 4, onTap: () {
                    _pageController.jumpToPage(4);
                    setState(() {
                      _selectedIndex = 4;
                    });
                  }),
                ),
              ],
            ),
          ),
        ),

        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: children,
        ),
      ),
    );
  }
}
