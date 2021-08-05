import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

// ignore: must_be_immutable
class DailyChartWidget extends StatelessWidget {
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 300.0,
            height: 100.0,
            child: Sparkline(
              data: data,
            ),
          ),
        ),
      ),
    );
  }
}
