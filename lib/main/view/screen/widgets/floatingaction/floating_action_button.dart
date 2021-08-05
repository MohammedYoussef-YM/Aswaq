import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_ui_kit/driver_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FloatingActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Floating Button"),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Default Floating Action Button",style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE,color: Colors.black),),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        heroTag: "default",
                        hoverColor: Colors.black,
                        elevation: 10,
                        onPressed: ()=>Fluttertoast.showToast(msg: "Click Add"),
                        backgroundColor: Colors.teal,
                        child: Icon(Icons.add,),
                      ),
                    ],),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Label Floating Action Button",style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE,color: Colors.black),),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        heroTag: "label",
                        hoverColor: Colors.black,
                        elevation: 10,
                        onPressed: ()=>Fluttertoast.showToast(msg: "Click Add"),
                        backgroundColor: Colors.deepPurple,
                        child: Text("Add"),
                      ),
                    ],),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rounded Rectangle Border FAB",style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE,color: Colors.black),),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        heroTag: "rounded",
                        hoverColor: Colors.black,
                        elevation: 10,
                        onPressed: ()=>Fluttertoast.showToast(msg: "Click  Add"),
                        backgroundColor: Colors.yellow[700],
                        child: Text("Add"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      ),
                    ],),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Icon with label Floating Action Button",style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE,color: Colors.black),),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.extended(
                        heroTag: "icon with label",
                        hoverColor: Colors.black,
                        elevation: 10,
                        onPressed: ()=>Fluttertoast.showToast(msg: "Click Add"),
                        backgroundColor: Colors.green[700],
                        label: Text("Add",style: TextStyle(fontSize: Dimensions.FONT_SIZE_LARGE),),
                        icon: Icon(Icons.add,),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50.0))),
                      ),
                      SizedBox(width: 10,),
                      FloatingActionButton.extended(
                        heroTag: "icon label",
                        hoverColor: Colors.black,
                        elevation: 10,
                        onPressed: ()=>Fluttertoast.showToast(msg: "Click Take Pic"),
                        backgroundColor: Colors.yellow[900],
                        label: Text("Take pic",style:
                        TextStyle(fontSize: Dimensions.FONT_SIZE_LARGE),),
                        icon: Icon(Icons.camera_enhance_outlined),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      ),
                    ],),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        curve: Curves.bounceInOut,
        animatedIcon: AnimatedIcons.menu_close,
        overlayColor: Colors.white70,
        backgroundColor: Color(0xff5050D5),
        foregroundColor: Colors.white70,
        animatedIconTheme: IconThemeData.fallback(),
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.mic,color: Colors.white,),
            label: "Mic",
            onTap: ()=>Fluttertoast.showToast(msg: "Click Mic"),
            labelBackgroundColor: Color(0xff5050D5),
            labelStyle: TextStyle(color: Colors.white),
            backgroundColor: Color(0xff5050D5),
          ),
          SpeedDialChild(
            child: Icon(Icons.photo,color: Colors.white,),
            label: "Gallery",
            onTap: ()=>Fluttertoast.showToast(msg: "Click Gallery"),
            labelStyle: TextStyle(color: Colors.white),
            labelBackgroundColor: Color(0xff5050D5),
            backgroundColor: Colors.redAccent,
          ),
          SpeedDialChild(
            child: Icon(Icons.camera_alt_outlined,color: Colors.white,),
            label: "Camera",
            onTap: ()=>Fluttertoast.showToast(msg: "Click Camera"),
            labelStyle: TextStyle(color: Colors.white),
            labelBackgroundColor:Color(0xff5050D5),
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
