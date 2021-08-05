import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/strings.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


class NavigationSix extends StatefulWidget {
  @override
  _StartupScreenState createState() => _StartupScreenState();
}

class _StartupScreenState extends State<NavigationSix> {

  PersistentTabController _controller = PersistentTabController(
      initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      HomeNav(),
      AppointmentsNav(),
      NotificationNav(),
      SearchNav(),
      MenuNav(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: ImageIcon(
            AssetImage('assets/doctor/Icon/logo icon monocolor.png')
        ),
        activeColorPrimary: Colors.white,
        //inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
            AssetImage('assets/doctor/Icon/appointments.png')
        ),
        activeColorPrimary: Colors.white,
        //inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
            AssetImage('assets/doctor/Icon/notification.png')
        ),
        activeColorPrimary: Colors.white,
        //inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
            AssetImage('assets/doctor/Icon/Search.png')
        ),
        activeColorPrimary: Colors.white,
        //inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
            AssetImage('assets/doctor/Icon/option.png')
        ),
        activeColorPrimary: Colors.white,
      ),
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
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        hideNavigationBar: false,
        popAllScreensOnTapOfSelectedTab: false,
        backgroundColor: Color(0xff5050D5),
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears.
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(40.0),
          colorBehindNavBar: Colors.white,
        ),
        //popAllScreensOnTapOfSelectedTab: false,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style1,
        // Choose the nav bar style with this property.
        onItemSelected: (i) {
          print(i.toString());
        },
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

class AppointmentsNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Appointments Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}

class NotificationNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Notification Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
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

class MenuNav extends StatelessWidget {
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