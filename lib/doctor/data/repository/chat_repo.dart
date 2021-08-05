import 'package:flutter_ui_kit/doctor/data/model/chat_model.dart';

class ChatRepo {
  List<ChatModel> getChatList() {
    List<ChatModel> chatList = [
      ChatModel('Hi', false),
    ];
    return chatList;
  }
}