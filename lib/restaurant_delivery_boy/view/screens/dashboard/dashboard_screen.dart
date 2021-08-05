import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/all_app_screen.dart';
import 'package:flutter_ui_kit/main/app.dart';
import 'package:flutter_ui_kit/main/main_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/profile_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/screens/home/home_screen.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/screens/order/order_history_screen.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';

class RestaurantDeliveryBoyDashboardScreen extends StatefulWidget {
  @override
  _RestaurantDeliveryBoyDashboardScreenState createState() => _RestaurantDeliveryBoyDashboardScreenState();
}

class _RestaurantDeliveryBoyDashboardScreenState extends State<RestaurantDeliveryBoyDashboardScreen> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  List<Widget> _screens;

  @override
  void initState() {
    super.initState();

    _screens = [
      RestaurantDeliveryBoyHomeScreen(),
      OrderHistoryScreen(),
      RestaurantDeliveryBoyProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<RestaurantDeliveryBoyProfileProvider>(context, listen: false).getUserInfo();
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {
          Provider.of<MainProvider>(context, listen: false).setThemeAndLocale(App.MAIN, context);
          return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => AllAppScreen()), (route) => false) ?? false;
        }
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: RestaurantDeliveryBoyColorResources.COLOR_GREY,
          backgroundColor: Theme.of(context).cardColor,
          showUnselectedLabels: true,
          currentIndex: _pageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            _barItem(Icons.home, getTranslated('home', context), 0),
            _barItem(Icons.history, getTranslated('order_history', context), 1),
            _barItem(Icons.person, getTranslated('profile', context), 2),
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
      icon: Icon(icon, color: index == _pageIndex ? Theme.of(context).primaryColor : RestaurantDeliveryBoyColorResources.COLOR_GREY, size: 20),
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
