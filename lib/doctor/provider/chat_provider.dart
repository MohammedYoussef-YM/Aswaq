import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/data/model/chat_model.dart';
import 'package:flutter_ui_kit/doctor/data/repository/chat_repo.dart';

class ChatProvider extends ChangeNotifier {
  final ChatRepo chatRepo;
  ChatProvider({@required this.chatRepo});

  List<ChatModel> getChatList() {
    return chatRepo.getChatList();
  }
}