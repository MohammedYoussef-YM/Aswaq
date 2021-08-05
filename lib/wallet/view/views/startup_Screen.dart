import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/wallet/utility/colorResources.dart';
import 'package:flutter_ui_kit/wallet/view/views/home_screen.dart';
import 'package:flutter_ui_kit/wallet/view/views/insight_screen.dart';
import 'package:flutter_ui_kit/wallet/view/views/setting_screen.dart';
import 'package:flutter_ui_kit/all_app_screen.dart';

class WalletStartupScreen extends StatefulWidget {
  @override
  _WalletStartupScreenState createState() => _WalletStartupScreenState();
}

class _WalletStartupScreenState extends State<WalletStartupScreen> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  final List<Widget> _tabItems = [
    PixalletHomeScreen(),
    InsightScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if(_page != 0) {
          setState(() {
            _page = 0;
          });
          return Future.value(false);
        }else {
          return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => AllAppScreen()), (route) => false) ?? false;
        }
      },
      child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: _page,
            height: 50.0,
            items: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                child: Image.asset('assets/wallet/Icon/wallet white.png',
                  width: 30,
                  height: 30,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Image.asset(
                  'assets/wallet/Icon/insight.png',
                  width: 30,
                  height: 30,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Image.asset(
                  'assets/wallet/Icon/tools.png',
                  width: 30,
                  height: 30,
                ),
              ),
            ],
            color: ColorResources.COLOR_PRIMARY_DARK,
            buttonBackgroundColor: ColorResources.COLOR_PRIMARY_DARK,
            backgroundColor: ColorResources.COLOR_WHITE,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
          ),
          body: _tabItems[_page]),
    );
  }
}
