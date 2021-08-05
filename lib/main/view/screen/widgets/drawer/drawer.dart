import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/view/basewidget/arrow_button.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/drawer/menu_screen.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/drawer/widget/drawer-custom_shape.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/drawer/widget/drawer_custom_header.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/drawer/widget/right_side_drawer.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/drawer/widget/standert_drawer.dart';


class DrawerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Drawer Widget'),
        backgroundColor: Color(0xff5050D5),
      ),
      body:SafeArea(
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              WidgetArrowButton(widget: StandartDrawer(),title: 'Standart Drawer'),
              WidgetArrowButton(widget: RightDrawer(),title: 'Right Drawer'),
              WidgetArrowButton(widget: CustomHeaderDrawer(),title: 'CustomHeader Drawer'),
              WidgetArrowButton(widget: CustomShapeDrawer(),title: 'CustomShape Drawer'),
              WidgetArrowButton(widget: CustomShapeDrawer(),title: 'CustomShape Drawer'),
              WidgetArrowButton(widget: MenuScreen(),title: 'MenuScreen Drawer'),

            ],
          )),
    );
  }
}
