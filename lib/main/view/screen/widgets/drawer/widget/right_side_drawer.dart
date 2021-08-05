import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RightDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Right Side Drawer'),
        backgroundColor: Color(0xff5050D5),
      ),
      endDrawer: SingleChildScrollView(
        child: Container(
            width: 300,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child:Column(
              children: [
              Container(
                padding: EdgeInsets.only(top: 50,left: 20),
                height: 267,
                width: MediaQuery.of(context).size.width,
                color: Color(0xff5050D5),
                child: Text("Drawer Header", style: TextStyle(color: Colors.white,fontSize: 18)),
              ),
              SizedBox(height: 60,),

              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Row( children: [
                  SvgPicture.asset(
                    'assets/home_icon.svg',
                    allowDrawingOutsideViewBox: true,
                  ),
                  SizedBox(width: 10,),
                  Text('Home', style: TextStyle(color: Colors.black,fontSize: 14),),
                ],),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Row(children: [
                  SvgPicture.asset(
                    'assets/our_service.svg',
                    allowDrawingOutsideViewBox: true,
                  ),
                  SizedBox(width: 10,),
                  Text('Our Products', style: TextStyle(color: Colors.black,fontSize: 14),),
                ],),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Row(children: [
                  SvgPicture.asset(
                    'assets/about.svg',
                    allowDrawingOutsideViewBox: true,
                  ),
                  SizedBox(width: 10,),
                  Text('About Us', style: TextStyle(color: Colors.black,fontSize: 14),),
                ],),
              ),
            ],)
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Right Side Drawer'),
        ),
      ),
    );
  }
}
