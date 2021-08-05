import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/main/utils/strings.dart';

class NavigationSeven extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<NavigationSeven> {

  int _selectedIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    CartNav(),
    ChatNav(),
    AccountNav(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('NavigationBar'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: _children[_selectedIndex],
      bottomNavigationBar: Stack(
        children: <Widget>[
          BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: ColorResources.COLOR_PRIMARY,
            unselectedItemColor: ColorResources.COLOR_GREY,
            backgroundColor: ColorResources.COLOR_WHITE,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}
class HomeScreen extends StatelessWidget {
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

class CartNav extends StatelessWidget {
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

class ChatNav extends StatelessWidget {
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

class AccountNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Account Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}
