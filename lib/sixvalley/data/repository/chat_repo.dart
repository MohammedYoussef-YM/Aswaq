
import 'package:flutter_ui_kit/sixvalley/data/model/response/chat_model.dart';

class SixChatRepo {
  List<ChatModel> getChatList() {
    List<ChatModel> chatList = [
      ChatModel('Hi, How are you?', null, DateTime.now(), false, false),
    ];
    return chatList;
  }
}