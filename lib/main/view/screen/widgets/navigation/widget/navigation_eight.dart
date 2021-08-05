import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/view/views/dashboard/widget/bottom_nav_item.dart';
import 'package:flutter_ui_kit/main/utils/strings.dart';

class NavigationEight extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<NavigationEight> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> children = [
    HomeScreenNav(),
    SearchScreenNav(),
    CartScreenNav(),
    FavouriteScreenNav(),
    ProfileScreenNav(),
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
          padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          child: Row(
            children: <Widget>[
              Expanded(
                child: BottomNavItem(icon: Icons.menu_book, title: 'Recipes', isSelected: _selectedIndex == 0, onTap: () {
                  _pageController.jumpToPage(0);
                  setState(() {
                    _selectedIndex = 0;
                  });
                }),
              ),
              Expanded(
                child: BottomNavItem(icon: Icons.search, title: 'Search', isSelected: _selectedIndex == 1, onTap: () {
                  _pageController.jumpToPage(1);
                  setState(() {
                    _selectedIndex = 1;
                  });
                }),
              ),
              Expanded(
                child: BottomNavItem(icon: Icons.shopping_cart_outlined, title: 'Cart', isSelected: _selectedIndex == 2, onTap: () {
                  _pageController.jumpToPage(2);
                  setState(() {
                    _selectedIndex = 2;
                  });
                }),
              ),
              Expanded(
                child: BottomNavItem(icon: Icons.favorite_border, title: 'Favourite', isSelected: _selectedIndex == 3, onTap: () {
                  _pageController.jumpToPage(3);
                  setState(() {
                    _selectedIndex = 3;
                  });
                }),
              ),
              Expanded(
                child: BottomNavItem(icon: Icons.person_outline, title: 'Profile', isSelected: _selectedIndex == 4, onTap: () {
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

class SearchScreenNav extends StatelessWidget {
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

class CartScreenNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Cart Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}

class FavouriteScreenNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('FavouriteScreen Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}

class ProfileScreenNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ProfileScreen Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}
