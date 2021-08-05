import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/all_app_screen.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/cart_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/profile_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/cart/cart_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/home/home_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/menu/menu_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/order/order_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/wishlist/wishlist_screen.dart';
import 'package:provider/provider.dart';

class RestDashboardScreen extends StatefulWidget {
  @override
  _RestDashboardScreenState createState() => _RestDashboardScreenState();
}

class _RestDashboardScreenState extends State<RestDashboardScreen> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    Provider.of<RestProfileProvider>(context, listen: false).getUserInfo();
    _screens = [
      HomeScreen(),
      CartScreen(),
      RestOrderScreen(),
      WishListScreen(),
      MenuScreen(onTap: (int pageIndex) {
        _setPage(pageIndex);
      }),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {
          return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => AllAppScreen()), (route) => false) ?? false;
        }
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: ColorResources.COLOR_GREY,
          showUnselectedLabels: true,
          currentIndex: _pageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            _barItem(Icons.home, getTranslated('home', context), 0),
            _barItem(Icons.shopping_cart, getTranslated('cart', context), 1),
            _barItem(Icons.shopping_bag, getTranslated('order', context), 2),
            _barItem(Icons.favorite, getTranslated('favourite', context), 3),
            _barItem(Icons.menu, getTranslated('menu', context), 4)
          ],
          onTap: (int index) {
            _setPage(index);
          },
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _screens[index];
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _barItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(icon, color: index == _pageIndex ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_GREY, size: 25),
          index == 1 ? Positioned(
            top: -7, right: -7,
            child: Container(
              padding: EdgeInsets.all(4),
              alignment: Alignment.center,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              child: Text(
                Provider.of<RestCartProvider>(context).cartList.length.toString(),
                style: rubikMedium.copyWith(color: ColorResources.COLOR_WHITE, fontSize: 8),
              ),
            ),
          ) : SizedBox(),
        ],
      ),
      label: label,
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}
