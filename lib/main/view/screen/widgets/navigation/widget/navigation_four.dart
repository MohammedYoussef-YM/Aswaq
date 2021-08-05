import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/view/screen/dashboard/widget/bottom_nav_item.dart';
import 'package:flutter_ui_kit/main/utils/strings.dart';

class NavigationFour extends StatefulWidget {
  @override
  _AcademyDashboardScreenState createState() => _AcademyDashboardScreenState();
}

class _AcademyDashboardScreenState extends State<NavigationFour> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> children = [
    HomeNav(),
    SearchNav(),
    VideoNav(),
    FavoriteNav(),
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
        title: Text('NavigationBar'),
        backgroundColor: Color(0xff5050D5),
      ),

      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: AcademyDimensions.PADDING_SIZE_EXTRA_SMALL),
          child: Row(
            children: <Widget>[
              Expanded(
                child: BottomNavItem(
                    iconImageUrl: Icons.star,
                    title: AcademyStrings.featured,
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
                    iconImageUrl: Icons.search,
                    title: AcademyStrings.search,
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
                    iconImageUrl: Icons.play_circle_outline,
                    title: AcademyStrings.my_courses,
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
                    iconImageUrl: Icons.favorite_border,
                    title: AcademyStrings.wishlist,
                    isSelected: _selectedIndex == 3,
                    onTap: () {
                      _pageController.jumpToPage(3);
                      setState(() {
                        _selectedIndex = 3;
                      });
                    }),
              ),
              Expanded(
                child: BottomNavItem(
                    iconImageUrl: Icons.account_circle_outlined,
                    title: AcademyStrings.account,
                    isSelected: _selectedIndex == 4,
                    onTap: () {
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
    );
  }
}

class HomeNav extends StatelessWidget {
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

class SearchNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Search Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}
class VideoNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Video Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
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