import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/drawer/widget/custom_drawer.dart';

class MenuButton extends StatelessWidget {
  final CustomDrawerController drawerController;
  final int index;
  final IconData icon;
  final String title;
  MenuButton({@required this.drawerController, @required this.index, @required this.icon, @required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        drawerController.toggle();
      },
      selected: 0 == index,
      selectedTileColor: Colors.white.withAlpha(30),
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(
        fontSize: 15,
        color: Colors.white,
      )),
    );
  }
}
