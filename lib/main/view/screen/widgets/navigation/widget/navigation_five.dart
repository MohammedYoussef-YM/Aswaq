import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/dating_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/view/widget/bottom_nav_item.dart';
import 'package:flutter_ui_kit/main/utils/strings.dart';

class NavigationFive extends StatefulWidget {
  @override
  _DatingAppDashboardScreenState createState() => _DatingAppDashboardScreenState();
}

class _DatingAppDashboardScreenState extends State<NavigationFive> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> children = [
    ExploreNav(),
    FavoriteNav(),
    MessageNav(),
    PersonNav(),
  ];

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Navigation'),
        backgroundColor: Color(0xff5050D5),
      ),
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
                    title: 'Explore',
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
                    title: 'Love',
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
                    title: 'Message',
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
                    title: 'profile',
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
    );
  }
}

class ExploreNav extends StatelessWidget {
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


class FavoriteNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Favorite Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}

class MessageNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Message Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}

class PersonNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Person Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}