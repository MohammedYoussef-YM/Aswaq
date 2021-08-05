import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChipWidget extends StatefulWidget {
  @override
  _ChipWidgetState createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {

  int _value = 0;

  bool isSelected=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Chip Widget'),
          backgroundColor: Color(0xff5050D5)
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('Simple chip without color'),
                Chip(
                  onDeleted: (){
                    Fluttertoast.showToast(msg: "Click Example 1");
                  },
                  label: Text('Example 1',style: TextStyle(color: Colors.white),),
                  backgroundColor: Colors.grey,
                ),

                Text('Simple chip with color'),
                Chip(
                  onDeleted: (){
                    Fluttertoast.showToast(msg: "Click Example 2");
                  },
                  label: Text('Example 2',style: TextStyle(color: Colors.white)),
                  backgroundColor: Color(0xff5050D5),
                ),

                Text('Simple chip with horizontal padding'),
                Chip(
                  onDeleted: (){
                    Fluttertoast.showToast(msg: "Click Example 3");
                  },
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  label: Text('Example 3',style: TextStyle(color: Colors.white)),
                  backgroundColor: Color(0xff5050D5),
                ),

                Text('Simple chip with horizontal padding with color'),
                Chip(
                  onDeleted: (){
                    Fluttertoast.showToast(msg: "Click Example 4");
                  },
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  label: Text('Example 4',style: TextStyle(color: Colors.white)),
                  backgroundColor: Color(0xff5050D5),
                ),

                Text('Simple chip with icon without color'),
                Chip(
                  onDeleted: (){
                    Fluttertoast.showToast(msg: "Click Example 5");
                  },
                  label: Text('Example 5',style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.grey,
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.login,color: Colors.grey,),
                  ),
                ),

                Text('Simple chip with icon with color'),
                Chip(
                  onDeleted: (){
                    Fluttertoast.showToast(msg: "Click Example 6");
                  },
                  label: Text('Example 6',style: TextStyle(color: Colors.white)),
                  backgroundColor: Color(0xff5050D5),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.map),
                  ),
                ),

                Text('Simple chip with icon with shadow'),
                Chip(
                  onDeleted: (){
                    Fluttertoast.showToast(msg: "Click Example 7");
                  },
                  label: Text('Example 7',style: TextStyle(color: Colors.white)),
                  backgroundColor: Color(0xff5050D5),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.campaign_rounded),
                  ),
                  shadowColor: Colors.greenAccent,
                  elevation: 10,
                ),

                Text('Simple chip with icon with labelPadding'),
                Chip(
                  onDeleted: (){
                    Fluttertoast.showToast(msg: "Click Example 8");
                  },
                  label: Text('Example 8',style: TextStyle(color: Colors.white)),
                  backgroundColor: Color(0xff5050D5),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.card_giftcard),
                  ),
                  labelPadding: EdgeInsets.all(10),
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),

                //for action
                SizedBox(height: 20,),
                Text('Action Chip'),
                SizedBox(height: 10,),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12.0,
                  children: <Widget>[
                    ChoiceChip(
                      pressElevation: 0.0,
                      selectedColor: Color(0xff5050D5),
                      backgroundColor: Colors.grey[100],
                      label: Text("Phones",style: TextStyle(color: Colors.black),),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.phone_android_outlined),
                      ),
                      labelPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                      selected: _value == 0,
                      onSelected: (bool selected) {
                        setState(() {
                          _value = selected ? 0 : null;
                          Fluttertoast.showToast(msg: "Click Phones");
                        });
                      },
                    ),
                    ChoiceChip(
                      pressElevation: 0.0,
                      selectedColor: Color(0xff5050D5),
                      disabledColor: Colors.red,
                      backgroundColor: Colors.grey[100],
                      label: Text("Computers",style: TextStyle(color: Colors.black),),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.computer_outlined),
                      ),
                      labelPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                      selected: _value == 1,
                      onSelected: (bool selected) {
                        setState(() {
                          _value = selected ? 1 : null;
                          Fluttertoast.showToast(msg: "Click Computer");

                        });
                      },
                    ),
                    ChoiceChip(
                      avatarBorder: CircleBorder(),
                      pressElevation: 1.0,
                      selectedColor: Color(0xff5050D5),
                      backgroundColor: Colors.grey[100],
                      label: Text("Television",style: TextStyle(color: Colors.black),),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.tv),
                      ),
                      labelPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                      selected: _value == 2,
                      onSelected: (bool selected) {
                        setState(() {
                          _value = selected ? 2 : null;
                          Fluttertoast.showToast(msg: "Click Television");
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

