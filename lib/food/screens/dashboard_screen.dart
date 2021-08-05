import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/all_app_screen.dart';
import 'package:flutter_ui_kit/food/screens/dashboard/account_screen.dart';
import 'package:flutter_ui_kit/food/screens/dashboard/cart_screen.dart';
import 'package:flutter_ui_kit/food/screens/dashboard/message_screen.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/utility/strings.dart';

import 'dashboard/food_home_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int _selectedIndex = 0;

  final List<Widget> _children = [
    FoodHomeScreen(),
    CartScreen(),
    MessageScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPop,
      child: Scaffold(
        body: _children[_selectedIndex],
        bottomNavigationBar: Stack(
          children: <Widget>[
            BottomNavigationBar(
              items:  <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                      Icons.home,
                  ),
                  label: Strings.HOME,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: Strings.CART,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: Strings.MESSAGE,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: Strings.ACCOUNT,
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
            /*Positioned(
              left: MediaQuery.of(context).size.width/9,
              child: Container(
                child: StreamBuilder(
                  stream: requestedList.onValue,
                  builder:(context,snap){
                    if(snap.hasData && snap.data.snapshot.value != null){
                      DataSnapshot snapshot = snap.data.snapshot;
                      return _buildOngoingServiceCount(context, snapshot);
                    }else{
                      return Text('');
                    }
                  } ,
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }

  Future<bool> _willPop() {
    return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => AllAppScreen()), (route) => false) ?? false;
  }
}
