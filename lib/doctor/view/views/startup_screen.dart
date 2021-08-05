import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/all_app_screen.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/view/views/doctor_settings_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'doctor_screen.dart';
import 'doctor_home_screen.dart';
import 'my_appointments.dart';
import 'notification_screen.dart';

class StartupScreen extends StatefulWidget {
  @override
  _StartupScreenState createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {

  PersistentTabController _controller= PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [
      DoctorHomeScreen(),
      MyAppointments(),
      DoctorNotificationScreen(),
      DoctorScreen(),
      DoctorSettingsScreen(),
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
    return WillPopScope(
      onWillPop: _willPop,
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        hideNavigationBar: false,
        popAllScreensOnTapOfSelectedTab: false,
        backgroundColor: ColorResources.COLOR_PRIMARY,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears.
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
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
        navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
        onItemSelected: (i) {
          print(i.toString());
        },
      ),
    );
  }

  Future<bool> _willPop() {
    return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => AllAppScreen()), (route) => false) ?? false;
  }
}
