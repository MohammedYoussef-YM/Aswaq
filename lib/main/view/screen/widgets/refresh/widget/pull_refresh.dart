import 'dart:math';

import 'package:flutter/material.dart';

class PullToRefreshIndicator extends StatefulWidget {
  @override
  _PullToRefreshIndicatorState createState() => _PullToRefreshIndicatorState();
}
var refreshKey =GlobalKey<RefreshIndicatorState>();
Random random =new Random();
int limit = random.nextInt(10);

class _PullToRefreshIndicatorState extends State<PullToRefreshIndicator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Refresh Indicators"),
        backgroundColor: Color(0xff5050D5),
      ),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: refreshList,
        child: ListView(
          children: [
            for(int i=0;i<limit;i++)
              Card(elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.add),
                  title: Text("Item ${(i)}"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),)
          ],
        ),
      ),

    );
  }
  Future<void> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      limit=random.nextInt(10);
    });
  }
}
