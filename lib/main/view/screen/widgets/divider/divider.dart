import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DividerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Divider Widget'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 10,top: 30,right: 10,bottom: 20),
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Horizontal Divider',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Divider(height: 5,color: Colors.black,indent: 100,endIndent: 100,),

                Text('Horizontal Divider with color',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Divider(height: 5,color: Colors.redAccent,thickness: 2,indent: 50,endIndent: 50,),

                Text('Horizontal Divider with color',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Divider(height: 5,color: Colors.blue,thickness: 5,),

                SizedBox(height: 100,),
                IntrinsicHeight(
                  child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text('Vertical Divider',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                      SizedBox(height: 10,),
                      VerticalDivider(width: 50,color: Colors.grey,thickness: 2,),


                      Expanded(child: Text('Vertical Divider',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                      SizedBox(height: 10,),
                      VerticalDivider(width: 50,color: Colors.grey,thickness: 2,),


                    ],
                  ),
                ),

                SizedBox(height: 20,),
                IntrinsicHeight(
                  child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text('Vertical Divider with color',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                      SizedBox(height: 10,),
                      VerticalDivider(width: 80,color: Colors.redAccent,thickness: 3,),


                      Expanded(child: Text('Vertical Divider with color',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                      SizedBox(height: 10,),
                      VerticalDivider(width: 80,color: Colors.redAccent,thickness: 3,),


                    ],
                  ),
                ),

                SizedBox(height: 20,),
                IntrinsicHeight(
                  child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text('Vertical Divider with color',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                      SizedBox(height: 10,),
                      VerticalDivider(width: 100,color: Colors.blue,thickness: 5,),


                      Expanded(child: Text('Vertical Divider with color',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                      SizedBox(height: 10,),
                      VerticalDivider(width: 100,color: Colors.blue,thickness: 5,),


                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
