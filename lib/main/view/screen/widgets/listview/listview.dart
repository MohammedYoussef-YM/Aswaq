import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/view/basewidget/arrow_button.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/listview/widget/horizontal_scroll.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/listview/widget/listview_builder.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/listview/widget/listview_separated.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/listview/widget/listview_standart.dart';

class ListViewWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('ListView Widget'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              WidgetArrowButton(widget: StandartListView(),title: 'StandartListView'),
              WidgetArrowButton(widget: ListViewBuilder(),title: 'ListViewBuilder'),
              WidgetArrowButton(widget: ListViewSeparated(),title: 'ListViewSeparated'),
              WidgetArrowButton(widget: HorizontalScrollListView(),title: 'HorizontalScrollListView'),
              WidgetArrowButton(widget: StandartListView(),title: 'StandartListView'),
            ],
          )),
    );
  }
}
