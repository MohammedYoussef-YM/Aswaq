import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/chat_model.dart';
import 'package:flutter_ui_kit/sixvalley/helper/date_converter.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';

class MessageBubble extends StatelessWidget {
  final ChatModel chat;
  final Function onProfileTap;
  MessageBubble({@required this.chat, this.onProfileTap});

  @override
  Widget build(BuildContext context) {
    bool isMe = chat.isMe;
    String dateTime = DateConverter.formatDate(chat.dateTime);
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        isMe ? SizedBox.shrink() : InkWell(onTap: onProfileTap, child: CircleAvatar(child: Icon(Icons.person))),
        Flexible(
          child: Container(
              margin: isMe ?  EdgeInsets.fromLTRB(50, 5, 10, 5) : EdgeInsets.fromLTRB(10, 5, 50, 5),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: isMe ? Radius.circular(10) : Radius.circular(0),
                  bottomRight: isMe ? Radius.circular(0) : Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: isMe ? ColorResources.getImageBg(context) : Theme.of(context).accentColor
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                !isMe? Text(dateTime, style: titilliumRegular.copyWith(
                  fontSize: 8,
                  color: Theme.of(context).hintColor,
                )) : SizedBox.shrink(),
                chat.message.isNotEmpty ? Text(chat.message, style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)) : SizedBox.shrink(),
                //chat.image != null ? Image.file(chat.image) : SizedBox.shrink(),
              ]),
          ),
        ),
      ],
    );
  }
}
