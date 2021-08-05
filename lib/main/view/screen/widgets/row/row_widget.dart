import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RowWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Row Widget'),
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

              Text('Standert Row',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(height: 10,),
              Divider(height: 2,thickness: 3,color: Colors.grey),
              SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Example 1'),
                  Text('Example 2'),
                  Text('Example 3'),
                ],
              ),


              SizedBox(height: 70,),
              Text('Row with image, text and icon',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(height: 10,),
              Divider(height: 2,thickness: 3,color: Colors.grey,),
              SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/logoo.png',height: 50,),
                  Text('Row Example'),
                  Icon(Icons.camera_enhance_rounded,size: 40,)
                ],
              ),

              SizedBox(height: 70,),
              Text('Row with  Align',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(height: 10,),
              Divider(height: 2,thickness: 3,color: Colors.grey),
              SizedBox(height: 20,),
              Row(
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
                    child:  Text('align topRight'),
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
