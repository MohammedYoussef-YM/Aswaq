import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/strings.dart';
import 'package:flutter_ui_kit/wallet/utility/colorResources.dart';

class NavigationTwelve extends StatefulWidget {
  @override
  _WalletStartupScreenState createState() => _WalletStartupScreenState();
}

class _WalletStartupScreenState extends State<NavigationTwelve> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  final List<Widget> _tabItems = [
    PixalletHomeScreenNav(),
    InsightScreenNav(),
    SettingScreenNav(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('NavigationBar'),
          backgroundColor: Color(0xff5050D5),
        ),
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
        body: _tabItems[_page]);
  }
}

class PixalletHomeScreenNav extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('PixalletHomeScreen Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}

class InsightScreenNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('InsightScreen Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}

class SettingScreenNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('SettingScreen Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}