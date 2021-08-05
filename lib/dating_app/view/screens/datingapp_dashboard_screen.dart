import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/all_app_screen.dart';
import 'package:flutter_ui_kit/dating_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/strings.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/chat/chat_screen.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/home/datingapp_home_screen.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/matches/matches_screens.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/profile/profile_screen.dart';
import 'package:flutter_ui_kit/dating_app/view/widget/bottom_nav_item.dart';

class DatingAppDashboardScreen extends StatefulWidget {
  @override
  _DatingAppDashboardScreenState createState() => _DatingAppDashboardScreenState();
}

class _DatingAppDashboardScreenState extends State<DatingAppDashboardScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> children = [
    DatingAppHomeScreen(),
    MatchesScreens(),
    ChatScreen(),
    DatingProfileScreen(),
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
        if (_selectedIndex != 0) {
          _pageController.jumpToPage(0);
          setState(() {
            _selectedIndex = 0;
          });
          return false;
        } else {
          return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => AllAppScreen()), (route) => false) ?? false;
        }
      },
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          elevation: 5,
          notchMargin: 5,
          shape: CircularNotchedRectangle(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BottomNavItem(
                      iconImageUrl: 'assets/dating_app/icon/search.png',
                      title: Strings.explore,
                      isSelected: _selectedIndex == 0,
                      onTap: () {
                        _pageController.jumpToPage(0);
                        setState(() {
                          _selectedIndex = 0;
                        });
                      }),
                ),
                Expanded(
                  child: BottomNavItem(
                      iconImageUrl: 'assets/dating_app/icon/heart.png',
                      title: Strings.matches,
                      isSelected: _selectedIndex == 1,
                      onTap: () {
                        _pageController.jumpToPage(1);
                        setState(() {
                          _selectedIndex = 1;
                        });
                      }),
                ),
                Expanded(
                  child: BottomNavItem(
                      iconImageUrl: 'assets/dating_app/icon/message.png',
                      title: Strings.chat,
                      isSelected: _selectedIndex == 2,
                      onTap: () {
                        _pageController.jumpToPage(2);
                        setState(() {
                          _selectedIndex = 2;
                        });
                      }),
                ),
                Expanded(
                  child: BottomNavItem(
                      iconImageUrl: 'assets/dating_app/icon/person.png',
                      title: Strings.profile,
                      isSelected: _selectedIndex == 3,
                      onTap: () {
                        _pageController.jumpToPage(3);
                        setState(() {
                          _selectedIndex = 3;
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
