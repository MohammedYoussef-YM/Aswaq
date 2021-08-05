import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/all_app_screen.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/view/screens/home/home_screen.dart';
import 'package:flutter_ui_kit/household_app/view/screens/cart/cart_list_screen.dart';
import 'package:flutter_ui_kit/household_app/provider/house_home_provider.dart';
import 'package:flutter_ui_kit/household_app/view/screens/profile/profile_screen.dart';
import 'package:flutter_ui_kit/household_app/view/screens/services/service_screen_one.dart';
import 'package:provider/provider.dart';

class HouseDashboardScreen extends StatefulWidget {
  @override
  _HouseDashboardScreenState createState() => _HouseDashboardScreenState();
}

class _HouseDashboardScreenState extends State<HouseDashboardScreen> {
  int _pageIndex = 0;
  List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(onTap: (pageIndex) {
        setState(() {
          _pageIndex = pageIndex;
        });
      }),
      ServiceScreenOne(),
      CartListScreen(),
      HouseProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HouseHomeProvider>(
      builder: (context, home, child) {
        return WillPopScope(
          onWillPop: () async {
            if(_pageIndex != 0) {
              setState(() {
                _pageIndex = 0;
              });
              return false;
            }else {
              return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => AllAppScreen()), (route) => false) ?? false;
            }
          },
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _pageIndex,
              selectedItemColor: HouseHoldColorResources.COLOR_WHITE,
              unselectedItemColor: HouseHoldColorResources.COLOR_SOLITUDE.withOpacity(0.5),
              showUnselectedLabels: true,
              items: [
                _barItem(0, Icons.home_outlined, Strings.home, context),
                _barItem(1, Icons.miscellaneous_services, Strings.service, context),
                _barItem(2, Icons.shopping_cart_outlined, Strings.cart, context),
                _barItem(3, Icons.person_outline, Strings.profile, context),
              ],
              onTap: (int index) {
                setState(() {
                  _pageIndex = index;
                });
              },
            ),
            body: PageView.builder(
              itemCount: _screens.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _screens[_pageIndex];
              },
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _barItem(int index, IconData icon, String label, BuildContext context) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: HouseHoldColorResources.COLOR_WHITE.withOpacity(index == _pageIndex ? 1 : 0.5), size: 30),
      label: label,
      backgroundColor: HouseHoldColorResources.COLOR_PRIMARY,
    );
  }
}
