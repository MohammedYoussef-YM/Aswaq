import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/view/basewidget/arrow_button.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/map/widget/current_location.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/map/widget/multiple_marker.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/map/widget/polygone_map.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/map/widget/polyline_map.dart';

class GoogleMapWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Map Widget'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              WidgetArrowButton(widget:CurrentLocationMap(),title: 'CurrentLocationMap'),
              WidgetArrowButton(widget:PolygonMapWidget(),title: 'PolygonMapWidget'),
              WidgetArrowButton(widget:PolylineMapWidget(),title: 'PolylineMapWidget'),
              WidgetArrowButton(widget:MultipleMarker(),title: 'MultipleMarker'),
            ],
          )),
    );
  }
}
