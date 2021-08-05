import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/images.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/drawer/main_screen.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/drawer/widget/custom_drawer.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/drawer/widget/menu_button.dart';

class MenuScreen extends StatelessWidget {
  final CustomDrawerController _drawerController = CustomDrawerController();

  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      controller: _drawerController,
      menuScreen: MenuWidget(drawerController: _drawerController),
      mainScreen: MainScreen(drawerController: _drawerController),
      showShadow: false,
      angle: 0.0,
      borderRadius: 30,
      slideWidth: MediaQuery.of(context).size.width * (CustomDrawer.isRTL() ? 0.45 : 0.70),
    );
  }
}

class MenuWidget extends StatelessWidget {
  final CustomDrawerController drawerController;

  MenuWidget({@required this.drawerController});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (drawerController.isOpen()) {
          drawerController.toggle();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: SafeArea(
          child: ListView(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.black),
                onPressed: () => drawerController.toggle(),
              ),
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: FadeInImage.assetNetwork(
                  placeholder: Images.place_holder,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  image: Images.doc_one,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.notifications, color: Theme.of(context).accentColor),
                onPressed: () {},
              ),
              title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('John Doe'),
                Text('1234567890'),
              ]),
            ),
            SizedBox(height: 50),
            MenuButton(drawerController: drawerController, index: 0, icon: Icons.home, title: 'Home'),
            MenuButton(drawerController: drawerController, index: 1, icon: Icons.list, title: 'Categories'),
            MenuButton(drawerController: drawerController, index: 2, icon: Icons.shopping_cart, title: 'Cart'),
            MenuButton(drawerController: drawerController, index: 3, icon: Icons.shopping_bag, title: 'Orders'),
            MenuButton(drawerController: drawerController, index: 4, icon: Icons.location_on, title: 'Address'),
            MenuButton(drawerController: drawerController, index: 6, icon: Icons.chat, title: 'Live Chat'),
            SizedBox(height: 50),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.login_outlined, color: Colors.white),
              title: Text('Log Out', style: TextStyle(fontSize: 15, color: Colors.white)),
            ),
          ]),
        ),
      ),
    );
  }
}
