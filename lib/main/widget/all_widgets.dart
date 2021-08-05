import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/data/all_widget_data.dart';
import 'package:flutter_ui_kit/main/widget/widget_button.dart';

class AllWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
      itemCount: AllWidgetData.getAllWidgetList().length,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: (1.5 / 1.7),
      ),
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(),
        child:  WidgetButton(
          widgetName: AllWidgetData.getAllWidgetList()[index].widgetName,
          icon: AllWidgetData.getAllWidgetList()[index].icon,
          iconColor: AllWidgetData.getAllWidgetList()[index].iconColor,
          widgetData: AllWidgetData.getAllWidgetList()[index].widgetData,
        ),
      ),
    );
  }
}


