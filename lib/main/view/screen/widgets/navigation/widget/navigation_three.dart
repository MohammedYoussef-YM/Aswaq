import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/main_provider.dart';
import 'package:flutter_ui_kit/main/utils/strings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class NavigationThree extends StatelessWidget {
  final List<Widget> _screen=[HomeNav(),FavouriteNav(),InboxNav(),PersonNav()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('NavigationBar'),
          backgroundColor: Color(0xff5050D5),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          height: 60,
          decoration: BoxDecoration(color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey,spreadRadius: 0.2,blurRadius: 02)]),
          child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              //for Home
              InkWell(
                onTap: (){
                  Provider.of<MainProvider>(context,listen: false).setIndex(0);
                  },
                child: Column(
                  children: [
                    Icon(Icons.home_work_outlined,color: Provider.of<MainProvider>(context).appIndex==0 ? Color(0xff5050D5):Color(0xff555555),),
                    Text('Home',style: TextStyle(color: Provider.of<MainProvider>(context).appIndex==0 ? Color(0xff5050D5):Color(0xff555555),))
                  ],
                ),
              ),

              InkWell(
                onTap: (){
                  Provider.of<MainProvider>(context,listen: false).setIndex(1);
                  },
                child: Column(
                  children: [
                    Icon(Icons.favorite,color: Provider.of<MainProvider>(context).appIndex==1 ? Color(0xff5050D5):Color(0xff555555),),
                    Text('Favourite',style: TextStyle(color: Provider.of<MainProvider>(context).appIndex==1 ? Color(0xff5050D5):Color(0xff555555),))
                  ],
                ),
              ),

              //for Chat
              InkWell(
                onTap: (){
                  Provider.of<MainProvider>(context,listen: false).setIndex(2);
                  },
                child: Column(
                  children: [
                    Icon(Icons.chat_bubble,color: Provider.of<MainProvider>(context).appIndex==2 ? Color(0xff5050D5):Color(0xff555555),),
                    Text('Chat',style: TextStyle(color: Provider.of<MainProvider>(context).appIndex==2 ? Color(0xff5050D5):Color(0xff555555)),)
                  ],
                ),
              ),

              //for Account
              InkWell(
                onTap: (){
                  Provider.of<MainProvider>(context,listen: false).setIndex(3);
                  },
                child: Column(
                  children: [
                    Icon(Icons.person,color: Provider.of<MainProvider>(context).appIndex==3 ? Color(0xff5050D5):Color(0xff555555)),
                    Text('Account',style: TextStyle(color: Provider.of<MainProvider>(context).appIndex==3 ? Color(0xff5050D5):Color(0xff555555),),)
                  ],
                ),
              ),
            ],
          ),
        ),

        //floating Action Button
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Fluttertoast.showToast(msg: "Click Floating Button");
            },
          backgroundColor: Color(0xff5050D5),
          foregroundColor: Colors.white,
          elevation: 4.0,
          child:  Container( alignment: Alignment.center,
              height: 25,
              width: 25,
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)),color: Colors.white),
              child:  Icon(Icons.add,color: Color(0xff5050D5))),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        body: SafeArea(
          child: Center(
            child: _screen[Provider.of<MainProvider>(context).appIndex],
          ),
        ),
    );
  }
}


class HomeNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}
class FavouriteNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Favorite Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}

class InboxNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Message Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}

class PersonNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Person Navigation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}