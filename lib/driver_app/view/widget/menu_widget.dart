import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/driver_app/utility/colorResources.dart';

class MenuWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> drawerKey;

  MenuWidget({this.drawerKey});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: -10,
        top: 25,
        child: InkWell(
            onTap: () {
              drawerKey.currentState.openDrawer();
            },
            child: Image.asset(
              'assets/rideshare/images/menu.png',
              color: ColorResources.COLOR_PRIMARY,
              width: 102,
              height: 102,
              fit: BoxFit.fill,
            )));
  }
}
