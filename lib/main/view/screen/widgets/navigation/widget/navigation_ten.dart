import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/strings.dart';
import 'package:flutter_ui_kit/restaurant/provider/cart_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:provider/provider.dart';

class NavigationTen extends StatefulWidget {
  @override
  _RestDashboardScreenState createState() => _RestDashboardScreenState();
}

class _RestDashboardScreenState extends State<NavigationTen> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreenNavigation(),
      CartListScreenNavigation(),
      RestOrderScreenNavigation(),
      WishListScreenNavigation(),
      MenuScreenNavigation(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('NavigationBar'),
        backgroundColor: Color(0xff5050D5),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: ColorResources.COLOR_GREY,
        showUnselectedLabels: true,
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          _barItem(Icons.home, 'Home', 0),
          _barItem(Icons.shopping_cart, 'Cart', 1),
          _barItem(Icons.shopping_bag, 'Order', 2),
          _barItem(Icons.favorite, 'Favourite', 3),
          _barItem(Icons.menu, 'Menu', 4)
        ],
        onTap: (int index) {
          _setPage(index);
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

  BottomNavigationBarItem _barItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(icon, color: index == _pageIndex ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_GREY, size: 25),
          index == 1 ? Positioned(
            top: -7, right: -7,
            child: Container(
              padding: EdgeInsets.all(4),
              alignment: Alignment.center,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              child: Text(
                Provider.of<RestCartProvider>(context).cartList.length.toString(),
                style: rubikMedium.copyWith(color: ColorResources.COLOR_WHITE, fontSize: 8),
              ),
            ),
          ) : SizedBox(),
        ],
      ),
      label: label,
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}


class HomeScreenNavigation extends StatelessWidget {

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

class CartListScreenNavigation extends StatelessWidget {
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

class RestOrderScreenNavigation extends StatelessWidget {
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

class WishListScreenNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('WishList Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}

class MenuScreenNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Menu Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}