import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';
import 'package:fluttertoast/fluttertoast.dart';


class GestureDetectorWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Gesture Detector Widget'),
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

                //for single tab gesture detector
                Text('Single tab gesture detector',style: TextStyle(fontSize: 18),),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    Fluttertoast.showToast(msg: "Clicked Single Tab");
                  },
                  child: Container(
                      height: 40,
                      width: 100,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        boxShadow: [BoxShadow(color: Colors.grey[300], spreadRadius: .5, blurRadius: 5)],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text("Single Tab")),
                ),


                Text('Double tab gesture detector',style: TextStyle(fontSize: 18),),
                SizedBox(height: 10,),
                GestureDetector(
                  onDoubleTap: (){
                    Fluttertoast.showToast(msg: "Clicked Double Tab");
                  },
                  child: Container(
                      height: 40,
                      width: 100,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        boxShadow: [BoxShadow(color: Colors.grey[300], spreadRadius: .5, blurRadius: 5)],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text("Double Tab")),
                ),



                Text('Long Pressed gesture detector',style: TextStyle(fontSize: 18),),
                SizedBox(height: 10,),
                GestureDetector(
                  onLongPress: (){
                    Fluttertoast.showToast(msg: "Clicked Double Tab");
                  },
                  child: Container(
                      height: 40,
                      width: 120,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        boxShadow: [BoxShadow(color: Colors.grey[300], spreadRadius: .5, blurRadius: 5)],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text("Long Pressed")),
                ),


                Text('on tab behaviour,you can hit whole container',textAlign: TextAlign.center,style: TextStyle(fontSize: 18),),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    Fluttertoast.showToast(msg: "Clicked on Tab");
                  },
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        boxShadow: [BoxShadow(color: Colors.grey[500], spreadRadius: .5, blurRadius: 5)],
                        borderRadius: BorderRadius.circular(6),
                      ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Click On Tap"),
                        Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                ),


                Text('on tab behaviour,you can hit Image',textAlign: TextAlign.center,style: TextStyle(fontSize: 18),),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    Fluttertoast.showToast(msg: "Clicked on Tab");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      boxShadow: [BoxShadow(color: Colors.grey[500], spreadRadius: .5, blurRadius: 5)],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FadeInImage.assetNetwork(
                              placeholder: MainAppImages.place_holder,
                              image: MainAppImages.widget_four,fit: BoxFit.cover,),
                        ),
                        Text('Click me'),
                      ],
                    )
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
