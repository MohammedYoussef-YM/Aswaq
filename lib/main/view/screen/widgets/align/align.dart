
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AlignWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Align Widget'),
          backgroundColor: Color(0xff5050D5)
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                
                Text('All Kinds Of Align',style: TextStyle(fontSize: 20),),
                Divider(height: 10,thickness: 1,color: Colors.grey,indent: 50,endIndent: 50,),

                SizedBox(height: 20,),
                Container(
                  height: 100,
                    color: Colors.grey[300],
                    child: Align(
                        alignment: Alignment.center,
                        child: Text('Center Align',style: TextStyle(fontSize: 20),))),

                SizedBox(height: 10,),
                Container(
                    height: 100,
                    color: Colors.grey[300],
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('CenterLeft Align',style: TextStyle(fontSize: 20),))),

                SizedBox(height: 10,),
                Container(
                    height: 100,
                    color: Colors.grey[300],
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('CenterRight Align',style: TextStyle(fontSize: 20),))),

                SizedBox(height: 10,),
                Container(
                    height: 100,
                    color: Colors.grey[300],
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('TopLeft Align',style: TextStyle(fontSize: 20),))),

                SizedBox(height: 10,),
                Container(
                    height: 100,
                    color: Colors.grey[300],
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Text('TopCenter Align',style: TextStyle(fontSize: 20),))),

                SizedBox(height: 10,),
                Container(
                    height: 100,
                    color: Colors.grey[300],
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Text('TopRight Align',style: TextStyle(fontSize: 20),))),

                SizedBox(height: 10,),
                Container(
                    height: 100,
                    color: Colors.grey[300],
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text('BottomLeft Align',style: TextStyle(fontSize: 20),))),

                SizedBox(height: 10,),
                Container(
                    height: 100,
                    color: Colors.grey[300],
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text('BottomCenter Align',style: TextStyle(fontSize: 20),))),

                SizedBox(height: 10,),
                Container(
                    height: 100,
                    color: Colors.grey[300],
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text('BottomRight Align',style: TextStyle(fontSize: 20),))),

                SizedBox(height: 10,),

              ],),
          ),
        ),
      ),
    );
  }
}
