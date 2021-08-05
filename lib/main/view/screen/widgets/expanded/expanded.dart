import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ExpandedWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Expanded Widget'),
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
              //for horizontal
              SizedBox(height: 20,),
              Text('Horizontal Expanded',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(height: 10,),
              Container(
                height: 100,
                alignment: Alignment.centerRight,
                //margin: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [ BoxShadow(color: Colors.grey[200],spreadRadius: 0.5,blurRadius: 0.1),]
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      color: Colors.red,),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        color: Colors.green,
                        child: Text('Expanded Container'),),
                    ),
                  ],
                ),
              ),


              //for vertical
              SizedBox(height: 20,),
              Text('Vertical Expanded',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(height: 10,),
              Container(
                height: 400,
                alignment: Alignment.center,
                //margin: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [ BoxShadow(color: Colors.grey[200],spreadRadius: 0.5,blurRadius: 0.1),]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 100,
                      color: Colors.red,),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        width: 100,
                        color: Colors.green,
                        child: Text('Expanded Container',textAlign: TextAlign.center,),),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
