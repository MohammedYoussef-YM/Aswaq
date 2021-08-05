
import 'package:flutter_ui_kit/dating_app/data/models/chat_model.dart';

class DatingAppChatRepo {
  List<DatingAppChatModel> getChatList() {
    List<DatingAppChatModel> chatList = [
      DatingAppChatModel(message: 'Hi',isMe: false,messageTime: '11:20 AM, Yesterday'),
    ];
    return chatList;
  }
}