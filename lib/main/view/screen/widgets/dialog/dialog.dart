import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/strings.dart';
import 'package:flutter_ui_kit/main/view/basewidget/custom_snackbar.dart';
import 'package:fluttertoast/fluttertoast.dart';


class DialogWidget extends StatelessWidget {
  final TextEditingController controller=TextEditingController();
  final int codePoint=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Dialog Widget'),
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

                CustomSnackbarWidget(title: 'Standart Dialog',
                    onClick: (){
                      showDialog( context: context,
                          builder: (context)=>AlertDialog(
                        title: Text(Strings.DIALOG,style: TextStyle(fontSize: 14),) ,
                        content: TextButton(
                          onPressed: (){
                            Navigator.of(context).pop(true);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            decoration: BoxDecoration(
                              color: Color(0xff5050D5),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Ok',
                              style: TextStyle(color: Colors.white,fontSize: 16),),
                          ),
                        ),
                      ));
                    },
                ),

                CustomSnackbarWidget(title: 'Standart Dialog with Barrier',
                  onClick: (){
                    showDialog( context: context,
                      builder: (context)=>AlertDialog(
                        title: Text(Strings.DIALOG,style: TextStyle(fontSize: 14)) ,
                        content: TextButton(
                          onPressed: (){
                            Navigator.of(context).pop(true);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            decoration: BoxDecoration(
                              color: Color(0xff5050D5),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Ok',
                              style: TextStyle(color: Colors.white,fontSize: 16),),
                          ),
                        ),
                      ),
                      barrierDismissible: false,
                    );
                    },
                ),

                CustomSnackbarWidget(title: 'it\'s another simple dialog',
                  onClick: (){
                    showDialog( context: context,
                      builder: (context)=>AlertDialog(
                          title: Text("Set backup account") ,
                          content: Container(
                            height: 180,
                            child: Column( mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                SizedBox(height: 10,),
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).pop(false);
                                    Fluttertoast.showToast(msg: "SignIn Successfully");
                                  },
                                  child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.orangeAccent,
                                          child: Icon(Icons.person,color: Colors.white,size: 30,)),
                                      Text('user1@gmail.com'),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10,),
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).pop(false);
                                    Fluttertoast.showToast(msg: "SignIn Successfully");
                                  },
                                  child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Color(0xff5050D5),
                                          child: Icon(Icons.person,color: Colors.white,size: 30,)),
                                      Text('user2@gmail.com'),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10,),
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).pop(false);
                                    Fluttertoast.showToast(msg: "SignIn Successfully");
                                  },
                                  child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.green,
                                          child: Icon(Icons.person,color: Colors.white,size: 30,)),
                                      Text('user3@gmail.com'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                      ));
                    },
                ),

                CustomSnackbarWidget(title: 'Alert dialog',
                  onClick: (){
                    showDialog( context: context,
                      builder: (context)=>AlertDialog(
                        title: Text("Alert Dialog") ,
                        content: Text(Strings.DIALOG),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.of(context).pop(false);
                          },
                            child: Text('No'),
                          ),
                          TextButton(onPressed: (){
                            Navigator.of(context).pop(true);
                          },
                            child: Text('Yes'),
                          )
                        ],
                      ),
                      barrierDismissible: false,
                    );  },
                ),

                CustomSnackbarWidget(title: 'SignIn alert dialog',
                  onClick: (){
                    showDialog( context: context,
                      builder: (context)=>AlertDialog(
                        title: Text("Alert Dialog") ,
                        content: Text(Strings.DIALOG),
                        actions: [
                          Column(
                            children: [
                              TextButton(onPressed: (){
                                Navigator.of(context).pop(false);
                                Fluttertoast.showToast(msg: "SignIn with Facebook");
                              },
                                child: Text('SignIn with Facebook'),
                              ),

                              TextButton(onPressed: (){
                                Navigator.of(context).pop(true);
                                Fluttertoast.showToast(msg: "SignIn with Google");
                              },
                                child: Text('SignIn with Google'),
                              ),

                              TextButton(onPressed: (){
                                Navigator.of(context).pop(true);
                                Fluttertoast.showToast(msg: "SignIn with Twitter");
                              },
                                child: Text('SignIn with Twitter'),
                              )
                            ],
                          ),
                        ],
                      ),
                      barrierDismissible: false,
                    );   },
                ),

                CustomSnackbarWidget(title: 'Submit alert dialog',
                  onClick: (){
                    showDialog( context: context,
                      builder: (context)=>AlertDialog(
                        title: Text("What's Your Name?") ,
                        content: TextField(
                          controller: controller,
                        ),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.of(context).pop(true);
                            Fluttertoast.showToast(msg: "Submitted");
                          },
                            child: Text('Submit'),
                          ),
                          TextButton(onPressed: (){
                            Navigator.of(context).pop(false);
                            Fluttertoast.showToast(msg: "Cancel");
                          },
                            child: Text('Cancel'),
                          ),
                        ],
                      ),
                      barrierDismissible: false,
                    );  },
                ),

                CustomSnackbarWidget(title: 'Custom Dialog',
                  onClick: (){
                    showDialog( context: context, builder: (context)=> Dialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                      child: Padding( padding: EdgeInsets.all(12),
                        child: Stack(clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: 0, right: 0, top: -55,
                              child: Container(
                                height: 80,
                                width: 80,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                                child: Transform.rotate(angle: 0, child: Icon(Icons.person, size: 40, color: Colors.white)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: Column(mainAxisSize: MainAxisSize.min, children: [

                                Text('Title', style: TextStyle(fontSize:18,fontWeight: FontWeight.bold)),
                                SizedBox(height: 10),
                                Text(Strings.DIALOG, textAlign: TextAlign.center, ),
                                SizedBox(height: 12),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: TextButton(
                                    onPressed: () { Navigator.of(context).pop(true); },
                                    child: Text('Ok',style: TextStyle( color: Color(0xff5050D5),fontWeight: FontWeight.bold,fontSize: 16),),),
                                ),
                              ],),
                            ),
                          ],
                        ),
                      ),
                    ),
                      barrierDismissible: false,
                    );},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
