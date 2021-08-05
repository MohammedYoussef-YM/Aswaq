import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PaddingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Padding'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: Center(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('All Kinds Of Padding',style: TextStyle(fontSize: 20),),
            Divider(height: 10,thickness: 1,color: Colors.grey,indent: 50,endIndent: 50,),

            SizedBox(height: 50,),
            Container(
                color: Colors.grey[300],
                child: Text('Without Padding',style: TextStyle(fontSize: 20),)),
            SizedBox(height: 10,),
            Container(
              color: Colors.grey[300],
              padding: EdgeInsets.all(30),
                child: Text('With Padding',style: TextStyle(fontSize: 20),)),
            SizedBox(height: 10,),
            Container(
                color: Colors.grey[300],
                padding: EdgeInsets.only(left: 30),
                child: Text('Left Padding',style: TextStyle(fontSize: 20),)),
            SizedBox(height: 10,),
            Container(
                color: Colors.grey[300],
                padding: EdgeInsets.only(right: 30),
                child: Text('Right Padding',style: TextStyle(fontSize: 20),)),
            SizedBox(height: 10,),
            Container(
                color: Colors.grey[300],
                padding: EdgeInsets.only(top: 30),
                child: Text('Top Padding',style: TextStyle(fontSize: 20),)),
            SizedBox(height: 10,),
            Container(
                color: Colors.grey[300],
                padding: EdgeInsets.only(bottom: 30),
                child: Text('Bottom Padding',style: TextStyle(fontSize: 20),)),
            SizedBox(height: 10,),
            Container(
                color: Colors.grey[300],
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text('Horizontal Padding',style: TextStyle(fontSize: 20),)),
            SizedBox(height: 10,),
            Container(
                color: Colors.grey[300],
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text('Vertical Padding',style: TextStyle(fontSize: 20),)),
            SizedBox(height: 10,),

          ],),
        ),
      ),
    );
  }
}
