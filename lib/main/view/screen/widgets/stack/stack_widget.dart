import 'package:flutter/material.dart';


class StackWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Stack Widget'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: Stack(clipBehavior: Clip.none,
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 10,top: 30,right: 10,bottom: 20),
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //for Headline
                  Text('Example of Stack',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  Divider(height: 5,indent: 50,endIndent: 50,thickness: 2,),
                  SizedBox(height: 70,),
                  //for positioned
                  Stack(clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 800,
                        color: Colors.white,
                      ),

                      //for dialog
                      Positioned(
                        top: 10,
                        right: 50,
                        left: 50,
                        child: Container(
                          height: 180,
                          width: 200,
                          padding: EdgeInsets.symmetric(horizontal:10),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              SizedBox(height: 50),
                              Text('No Internet', style: TextStyle(fontSize:18,fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Text('Check your internet connection and try again', textAlign: TextAlign.center, ),
                              SizedBox(height: 12),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: TextButton(
                                  onPressed: () { Navigator.of(context).pop(true); },
                                  child: Text('Ok',style: TextStyle(color: Color(0xff5050D5),fontWeight: FontWeight.bold,fontSize: 16),),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          left: 0, right: 0, top: -40,
                          child: Container(
                            height: 80,
                            width: 80,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: Color(0xff5050D5), shape: BoxShape.circle),
                            child: Transform.rotate(angle: 0, child: Icon(Icons.wifi_off_outlined, size: 50, color: Colors.white)),
                          )),
                      //for bangladesh flag

                      Positioned(
                        top: 250,
                        left: 40,
                        child: Container(
                          height: 200,
                          width: 300,
                          color: Colors.green,
                        ),
                      ),
                      Positioned(
                        top: 300,
                        right: 0,
                        left: 0,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.red,
                        ),
                      ),
                      Positioned(
                        top: 250,
                        child: Container(
                          width: 40,
                         height: 400,
                         color: Colors.grey,
                        ),
                      ),
                      Positioned(
                          top: 460,
                          right: 50,
                          left: 100,
                          child: Text('Flag Of Bangladesh',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),


                      //for stack
                      Positioned(
                        top: 520,
                        right: 180,
                        left: 50,
                        child: Container(
                          height: 100,
                          width: 50,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      Positioned(
                        top: 530,
                        right: 170,
                        left: 60,
                        child: Container(
                          height: 100,
                          width: 50,
                          color: Colors.green,
                        ),
                      ),
                      Positioned(
                        top: 540,
                        right: 160,
                        left: 70,
                        child: Container(
                          height: 100,
                          width: 50,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        top: 550,
                        right: 150,
                        left: 80,
                        child: Container(
                          height: 100,
                          width: 50,
                          color: Colors.black,
                        ),
                      ),
                      Positioned(
                        top: 560,
                        right: 140,
                        left: 90,
                        child: Container(
                          height: 100,
                          width: 50,
                          color: Color(0xff5050D5),
                        ),
                      ),
                      Positioned(
                        top: 570,
                        right: 130,
                        left: 100,
                        child: Container(
                          height: 100,
                          width: 50,
                          color: Colors.redAccent,
                        ),
                      ),
                      Positioned(
                          top: 680,
                          right: 50,
                          left: 80,
                          child: Text('Different color',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
