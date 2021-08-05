import 'package:flutter/material.dart';


class PositionedWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Positioned Widget'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 10,top: 30,right: 10,bottom: 20),
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //for Headline
              Text('Positioned Widget only use when it with stack Widget',style: TextStyle(fontSize: 14)),
              SizedBox(height: 20,),
              Text('Example of Positioned',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              Divider(height: 5,indent: 50,endIndent: 50,thickness: 2,),
              SizedBox(height: 70,),
              //for positioned
              Text('Position the icon inside stack',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Stack( clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      boxShadow: [BoxShadow(color: Colors.grey[300], spreadRadius: .5, blurRadius: 5)],
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 22,
                    child: Column(
                      children: [
                        Icon(Icons.home_outlined),
                        Text('Position top Left',style: TextStyle(fontSize: 8),)
                      ],
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 22,
                    child: Column(
                      children: [
                        Icon(Icons.favorite_border),
                        Text('Position top right',style: TextStyle(fontSize: 8),)
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 22,
                    child: Column(
                      children: [
                        Icon(Icons.audiotrack),
                        Text('Position bottom left',style: TextStyle(fontSize: 8),)
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 22,
                    child: Column(
                      children: [
                        Icon(Icons.emoji_food_beverage),
                        Text('Position bottom right',style: TextStyle(fontSize: 8),)
                      ],
                    ),
                  ),
                  Positioned(
                    top: 100,
                    right: 100,
                    child: Column(
                      children: [
                        Icon(Icons.star),
                        Text('Position center',style: TextStyle(fontSize: 8),)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
