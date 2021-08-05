import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {

  final List<TabList> tabLists=<TabList>[
    TabList(title: 'Home',icon: Icons.home_outlined),
    TabList(title: 'Inbox',icon: Icons.messenger_outline),
    TabList(title: 'Favourite',icon: Icons.favorite_border),
    TabList(title: 'Person',icon: Icons.person_add),
    TabList(title: 'Audio',icon: Icons.music_note_outlined),
    TabList(title: 'Video',icon: Icons.video_collection_outlined),
    TabList(title: 'Notification',icon: Icons.notifications_none_outlined),
    TabList(title: 'Setting',icon: Icons.settings_rounded),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabLists.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text('SimpleTabBar'),
            backgroundColor: Color(0xff5050D5),
            bottom: TabBar(
              isScrollable: true,
              tabs: tabLists.map<Widget>((TabList tabList){
                return Tab(
                  text: tabList.title,
                  icon: Icon(tabList.icon),
                );
              }).toList(),
            )
        ),
        body: TabBarView(
          physics:  ClampingScrollPhysics(),
          children: tabLists.map((TabList tabList){
            return Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(tabList.icon,size: 40,),
                    Text(tabList.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                  ],
                ),
              ),
            );
          }).toList(),
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

class TabList{
  String title;
  IconData icon;
  TabList({this.title,this.icon});
}