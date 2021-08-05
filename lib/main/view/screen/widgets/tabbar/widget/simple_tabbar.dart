import 'package:flutter/material.dart';

class SimpleTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('SimpleTabBar'),
          backgroundColor: Color(0xff5050D5),
          bottom: TabBar(
            tabs: [
              Tab(child: Text('Today'),),
              Tab(child: Text('Forecast'),),
              Tab(child: Text('Setting'),)
            ],
          ),
        ),
        body: TabBarView(
          physics:  ClampingScrollPhysics(),
          children: [
            HomeTab(),
            InboxTab(),
            SettingTab(),
          ],
        ),
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('HomeTab'),
      ),
    );
  }
}


class InboxTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('InboxTab'),
      ),
    );
  }
}

class SettingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('SettingTab'),
      ),
    );
  }
}

