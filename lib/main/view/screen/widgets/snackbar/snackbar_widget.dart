import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/view/basewidget/custom_snackbar.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SnackBarWidget extends StatelessWidget {

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('SnackBar Widget'),
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
              Text('Example of Snackbar',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              Divider(height: 5,indent: 50,endIndent: 50,thickness: 2,),
              SizedBox(height: 70,),

              CustomSnackbarWidget( title: 'Simple Snackbar',
                  onClick: (){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Simple Snackbar'),
                      duration: Duration(milliseconds: 1000),));
                  },
                 ),
              CustomSnackbarWidget( title: 'Error Color Snackbar',
                onClick: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error Color Snackbar'),
                      backgroundColor: Colors.red, duration: Duration(milliseconds: 1000)));
                },
              ),
              CustomSnackbarWidget( title: 'Snackbar with Action',
                onClick: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Snackbar with Action'),
                    backgroundColor: Color(0xFF000000),
                    action: SnackBarAction(label: "Undo", onPressed: (){
                      Fluttertoast.showToast(msg: "Snackbar Undo");
                    }),
                  ));
                  },
              ),
              CustomSnackbarWidget( title: 'Snackbar with Duration 10 second',
                onClick: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Snackbar with Duration 10 second'),
                    backgroundColor: Color(0xFF000000),duration: Duration(milliseconds: 10000),));
                },
              ),
              CustomSnackbarWidget( title: 'Floating Snackbar',
                onClick: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Floating Snackbar'),
                      backgroundColor: Color(0xff5050D5), behavior: SnackBarBehavior.floating, margin: EdgeInsets.all(12)));
                },
              ),
              CustomSnackbarWidget( title: 'Rounded Snackbar',
                onClick: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Rounded Snackbar'),
                      backgroundColor: Color(0xff5050D5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                      behavior: SnackBarBehavior.floating, margin: EdgeInsets.all(12)));
                },
              ),
              CustomSnackbarWidget( title: ' Flushbar Snackbar',
                onClick: (){
                  Flushbar(
                    backgroundColor: Color(0xff5050D5),
                    title: 'This is Flushbar Snackbar',
                    message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                    icon: Icon(
                      Icons.info_outline,
                      size: 28.0,
                      color: Colors.white,
                    ),
                    duration: Duration(seconds: 3),
                    leftBarIndicatorColor: Colors.blue[300],
                    margin: EdgeInsets.all(8),
                    borderRadius: BorderRadius.circular(8),
                    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
                  ).show(context);
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
