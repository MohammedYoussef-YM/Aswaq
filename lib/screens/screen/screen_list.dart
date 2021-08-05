import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screens/screen/auth/auth_one/login_screen_one.dart';
import 'package:flutter_ui_kit/screens/screen/auth/auth_three/login_screen_three.dart';
import 'package:flutter_ui_kit/screens/screen/auth/auth_two/login_screen_two.dart';
import 'package:flutter_ui_kit/screens/screen/profile/profile_screen_one.dart';
import 'package:flutter_ui_kit/screens/screen/profile/profile_screen_three.dart';
import 'package:flutter_ui_kit/screens/screen/profile/profile_screen_two.dart';

class ScreenList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('Login One'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreenOne()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Login Two'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreenTwo()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Login Three'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreenThree()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Profile One'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreenOne()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Profile Two'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreenTwo()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Profile Three'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreenThree()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
