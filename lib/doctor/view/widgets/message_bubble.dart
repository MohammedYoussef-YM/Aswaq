import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';

class MessageBubble extends StatelessWidget {

  final String text;
  final bool isMe;
  MessageBubble({@required this.text, @required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isMe ? SizedBox() : CircleAvatar(child: Icon(Icons.person)),
        Expanded(
          child: Container(
              margin: isMe ?  EdgeInsets.only(top: 5, bottom: 5, left: 80, right: 10) : EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 80),
              decoration: BoxDecoration(borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: isMe ? Radius.circular(15) : Radius.circular(0),
                bottomRight: isMe ? Radius.circular(0) : Radius.circular(15),
                topRight: Radius.circular(15),
              ), color: isMe ? Color(0x96707070) : ColorResources.COLOR_PRIMARY,),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(text, style: TextStyle(color: Colors.white, fontSize: Dimensions.FONT_SIZE_DEFAULT),),
              )
          ),
        ),
      ],
    );
  }
}