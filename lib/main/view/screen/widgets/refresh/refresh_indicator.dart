import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/view/basewidget/arrow_button.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/refresh/widget/pull_refresh.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/refresh/widget/watar_drop_indicator.dart';
class RefreshIndicators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Refresh Widget'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetArrowButton(widget:WaterDropHeaderIndicator() ,title: 'WaterDropHeaderIndicator',),
              WidgetArrowButton(widget:PullToRefreshIndicator() ,title: 'PullToRefreshIndicator',),
            ],
          )),
    );
  }
}
