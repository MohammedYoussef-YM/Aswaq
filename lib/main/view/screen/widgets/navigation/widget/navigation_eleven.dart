import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/strings.dart';
import 'package:flutter_ui_kit/sixvalley/provider/localization_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/theme_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/dashboard/widget/fancy_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/splash_provider.dart';

class NavigationEleven extends StatelessWidget {
  final PageController _pageController = PageController();
  final List<Widget> _screens = [
    HomeScreenNav(),
    InboxScreenNav(),
    OrderScreenNav(),
    NotificationScreenNav(),
    MoreScreenNav(),
  ];
  final GlobalKey<FancyBottomNavBarState> _bottomNavKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    int _pageIndex;
    if (Provider.of<SixSplashProvider>(context, listen: false).fromSetting) {
      _pageIndex = 4;
    } else {
      _pageIndex = 0;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('NavigationBar'),
        backgroundColor: Color(0xff5050D5),
      ),

      bottomNavigationBar: FancyBottomNavBar(
        key: _bottomNavKey,
        initialSelection: _pageIndex,
        isLtr: Provider.of<SixLocalizationProvider>(context).isLtr,
        isDark: Provider.of<SixThemeProvider>(context).darkTheme,
        tabs: [
          FancyTabData(imagePath: Images.home_image, title: 'home',),
          FancyTabData(imagePath: Images.message_image, title: 'inbox'),
          FancyTabData(imagePath: Images.shopping_image, title: 'orders'),
          FancyTabData(imagePath: Images.notification, title: 'notification'),
          FancyTabData(imagePath: Images.more_image, title: 'more'),
        ],
        onTabChangedListener: (int index) {
          _pageController.jumpToPage(index);
          _pageIndex = index;
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
    );
  }
}


class HomeScreenNav extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}

class InboxScreenNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Chat Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}

class OrderScreenNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Order Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}

class NotificationScreenNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Notification Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}

class MoreScreenNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('More Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}