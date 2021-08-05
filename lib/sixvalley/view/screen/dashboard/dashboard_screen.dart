import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/all_app_screen.dart';
import 'package:flutter_ui_kit/sixvalley/localization/language_constrants.dart';
import 'package:flutter_ui_kit/sixvalley/provider/localization_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/theme_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/chat/inbox_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/dashboard/widget/fancy_bottom_nav_bar.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/home/home_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/more/more_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/notification/notification_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/order/order_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui_kit/main/main_provider.dart';
import 'package:flutter_ui_kit/main/app.dart';
import 'package:flutter_ui_kit/sixvalley/provider/splash_provider.dart';

class SixDashBoardScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  final List<Widget> _screens = [
    HomePage(),
    InboxScreen(isBackButtonExist: false),
    OrderScreen(isBacButtonExist: false),
    NotificationScreen(isBacButtonExist: false),
    MoreScreen(),
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
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _bottomNavKey.currentState.setPage(0);
          return false;
        } else {
          Provider.of<MainProvider>(context, listen: false).setThemeAndLocale(App.MAIN, context);
          return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => AllAppScreen()), (route) => false) ?? false;
        }
      },
      child: Scaffold(
        bottomNavigationBar: FancyBottomNavBar(
          key: _bottomNavKey,
          initialSelection: _pageIndex,
          isLtr: Provider.of<SixLocalizationProvider>(context).isLtr,
          isDark: Provider.of<SixThemeProvider>(context).darkTheme,
          tabs: [
            FancyTabData(imagePath: Images.home_image, title: getTranslated('home', context)),
            FancyTabData(imagePath: Images.message_image, title: getTranslated('inbox', context)),
            FancyTabData(imagePath: Images.shopping_image, title: getTranslated('orders', context)),
            FancyTabData(imagePath: Images.notification, title: getTranslated('notification', context)),
            FancyTabData(imagePath: Images.more_image, title: getTranslated('more', context)),
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
      ),
    );
  }
}
