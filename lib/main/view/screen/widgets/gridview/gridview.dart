import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/view/basewidget/arrow_button.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/gridview/widget/gridveiw_extent.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/gridview/widget/gridview_builder.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/gridview/widget/gridview_count.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/gridview/widget/gridview_custom.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/gridview/widget/horizontal_scroll.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/gridview/widget/standart_gridview.dart';

class GridViewWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('GridView'),
          backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              WidgetArrowButton(widget:StandartGridView() ,title: "StandartGridView"),
              WidgetArrowButton(widget:GridViewBuilder() ,title: "GridViewBuilder"),
              WidgetArrowButton(widget:GridViewCount() ,title: "GridViewCount"),
              WidgetArrowButton(widget:GridViewCustom() ,title: "GridViewCustom"),
              WidgetArrowButton(widget:GridViewExtant() ,title: "GridViewExtant"),
              WidgetArrowButton(widget:HorizontalScrollGrid() ,title: "HorizontalScrollGrid"),
            ],
          )),
    );
  }
}
