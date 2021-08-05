import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/dating_app/data/models/chat_model.dart';
import 'package:flutter_ui_kit/dating_app/data/models/user_model.dart';
import 'package:flutter_ui_kit/dating_app/data/repository/dating_app_chat_repo.dart';
import 'package:flutter_ui_kit/dating_app/helper/utils.dart';
import 'package:flutter_ui_kit/dating_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/dating_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/strings.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/chat/widget/message_bubble.dart';
import 'package:flutter_ui_kit/dating_app/view/widget/custom_text_field.dart';

class ChatDetailsScreens extends StatefulWidget {
  final UserModel userModel;

  ChatDetailsScreens({this.userModel});

  @override
  _ChatDetailsScreensState createState() => _ChatDetailsScreensState();
}

class _ChatDetailsScreensState extends State<ChatDetailsScreens> {
  TextEditingController _controller = TextEditingController();
  List<DatingAppChatModel> chatList = DatingAppChatRepo().getChatList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(children: [
            Expanded(
              flex: 8,
              child: Container(
                decoration: BoxDecoration(color: ColorResources.COLOR_WHITE),
                child: Column(children: [
                  AppBar(
                    leading: IconButton(
                        icon: Icon(Icons.arrow_back_ios, size: Dimensions.PADDING_SIZE_DEFAULT),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    backgroundColor: Color(0xffF6F7F9),
                    centerTitle: true,
                    elevation: 0,
                    title: Text('${widget.userModel.firstName} ${widget.userModel.lastName}',
                        textAlign: TextAlign.center, style: robotoMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
                  ),
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      itemCount: chatList.length,
                      itemBuilder: (context, index) {
                        List<DatingAppChatModel> reversed = chatList.reversed.toList();
                        return MessageBubble(
                          isMe: reversed[index].isMe,
                          text: reversed[index].message,
                          imageUrl: widget.userModel.imageUrl,
                          time: reversed[index].messageTime,
                        );
                      },
                    ),
                  ),
                ]),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: ColorResources.COLOR_WHITE,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: ColorResources.COLOR_PRIMARY,
                      ),
                      onPressed: () {},
                      padding: EdgeInsets.all(2),
                    ),
                    Expanded(
                        child: CustomTextField(
                      controller: _controller,
                      hintText: Strings.start_typing,
                    )),
                    IconButton(
                      icon: Icon(
                        Icons.send,
                        color: ColorResources.COLOR_PRIMARY,
                      ),
                      onPressed: () {
                        chatList.add(DatingAppChatModel(message: _controller.text, isMe: true, messageTime: '${Utils.dateFormatStyle()} Now'));
                        _controller.text = '';
                        setState(() {});
                      },
                      padding: EdgeInsets.all(2),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
