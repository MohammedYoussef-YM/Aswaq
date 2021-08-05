import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/view/screen/account/account_screen.dart';
import 'package:flutter_ui_kit/academy/view/screen/dashboard/widget/bottom_nav_item.dart';
import 'package:flutter_ui_kit/academy/view/screen/home/academy_home_screen.dart';
import 'package:flutter_ui_kit/academy/view/screen/mycourses/my_courses_screen.dart';
import 'package:flutter_ui_kit/academy/view/screen/search/search_screen.dart';
import 'package:flutter_ui_kit/academy/view/screen/wishlist/wish_list_screen.dart';
import 'package:flutter_ui_kit/all_app_screen.dart';

class AcademyDashboardScreen extends StatefulWidget {
  @override
  _AcademyDashboardScreenState createState() => _AcademyDashboardScreenState();
}

class _AcademyDashboardScreenState extends State<AcademyDashboardScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> children = [
    AcademyHomeScreen(),
    SearchScreen(),
    MyCoursesScreen(isFromCardPerched: false),
    AcademyWishListScreen(),
    AcademyAccountScreen(),
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
      ),
    );
  }
}
