import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/drawer/widget/custom_drawer.dart';

class MainScreen extends StatelessWidget {
  final CustomDrawerController drawerController;

  MainScreen({@required this.drawerController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        leading: IconButton( icon: Icon( Icons.menu), color: Colors.white,
            onPressed: () {
              drawerController.toggle();
            }),
        title:  Text('Custom Animated Drawer')),

    );
  }
}
