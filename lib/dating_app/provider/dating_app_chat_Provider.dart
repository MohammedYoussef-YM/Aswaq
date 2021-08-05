import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/dating_app/data/models/chat_model.dart';
import 'package:flutter_ui_kit/dating_app/data/repository/dating_app_chat_repo.dart';

class DatingAppChatProvider with ChangeNotifier{
  final DatingAppChatRepo datingAppChatRepo;

  DatingAppChatProvider({this.datingAppChatRepo});

  List<DatingAppChatModel> getChatList() {
    return datingAppChatRepo.getChatList();
  }

}