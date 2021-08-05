import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/chat_model.dart';
import 'package:flutter_ui_kit/restaurant/helper/date_converter.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';

class MessageBubble extends StatelessWidget {
  final ChatModel chat;
  MessageBubble({@required this.chat});

  @override
  Widget build(BuildContext context) {
    bool isMe = chat.reply == null;
    String dateTime = DateConverter.isoStringToLocalTimeOnly(chat.createdAt);

    return Padding(
      padding: isMe ?  EdgeInsets.fromLTRB(50, 5, 10, 5) : EdgeInsets.fromLTRB(10, 5, 50, 5),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: isMe ? Radius.circular(10) : Radius.circular(0),
                        bottomRight: isMe ? Radius.circular(0) : Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: isMe ? ColorResources.getHintColor(context) : ColorResources.getSearchBg(context),
                    ),
                    child: Column(
                      crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE, vertical: Dimensions.PADDING_SIZE_SMALL),
                          child: Text(isMe ? chat.message : chat.reply, style: rubikRegular.copyWith(color: isMe ? Theme.of(context).accentColor
                              : Theme.of(context).textTheme.bodyText1.color)),
                        ),
                      ],
                    ),
                ),
              ),
            ],
          ),

          Text(dateTime, style: rubikRegular.copyWith(fontSize: 8, color: ColorResources.COLOR_GREY_BUNKER)),
        ],
      ),
    );
  }
}
