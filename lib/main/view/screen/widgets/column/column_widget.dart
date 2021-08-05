import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ColumnWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Column Widget'),
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
              Text('Standert Column',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              Divider(height: 2,thickness: 3,color: Colors.grey),
              SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Example 1'),
                  Text('Example 2'),
                  Text('Example 3'),
                ],
              ),


              SizedBox(height: 20,),
              Text('Column with image, text and icon',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              Divider(height: 2,thickness: 3,color: Colors.grey,),
              SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/logoo.png',height: 50,),
                  Text('Column Example'),
                  Icon(Icons.video_collection_outlined,size: 40,color: Colors.pinkAccent,)
                ],
              ),

              SizedBox(height: 20,),
              Text('Column with  Align',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              Divider(height: 2,thickness: 3,color: Colors.grey),
              SizedBox(height: 10,),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 100,
                    color: Colors.blue,
                    child:  Text('align bottom Center'),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    color: Colors.green,
                    child:  Text('align Center'),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    height: 100,
                    color: Colors.orangeAccent,
                    child:  Text('align topCenter'),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    height: 100,
                    color: Colors.blue,
                    child:  Text('align topLeft'),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    height: 100,
                    color: Colors.green,
                    child:  Text('align topRight'),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    height: 100,
                    color: Colors.orangeAccent,
                    child:  Text('align bottomLeft'),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    height: 100,
                    color: Colors.blue,
                    child:  Text('align bottomRight'),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
