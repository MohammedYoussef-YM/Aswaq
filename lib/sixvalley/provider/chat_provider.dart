import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/chat_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/repository/chat_repo.dart';

class SixChatProvider extends ChangeNotifier {
  final SixChatRepo chatRepo;
  SixChatProvider({@required this.chatRepo});

  List<ChatModel> _chatList = [];
  bool _hasData;
  File _imageFile;

  List<ChatModel> get chatList => _chatList;
  bool get hasData => _hasData;
  File get imageFile => _imageFile;

  void initChatList(int id) async {
    _hasData = true;
    notifyListeners();
    if (_chatList.length == 0) {
      _chatList.clear();
      _chatList.addAll(chatRepo.getChatList());
      _hasData = _chatList.length > 0;
      notifyListeners();
    }
  }

  void sendMessage(String text) {
    _chatList.add(ChatModel(text, _imageFile, DateTime.now(), true, false));
    _imageFile = null;
    _isSendButtonActive = false;
    notifyListeners();
  }

  bool _isSendButtonActive = false;
  bool get isSendButtonActive => _isSendButtonActive;

  void toggleSendButtonActivity() {
    _isSendButtonActive = !_isSendButtonActive;
    notifyListeners();
  }

  void setImage(File image) {
    _imageFile = image;
    _isSendButtonActive = true;
    notifyListeners();
  }

  void removeImage(String text) {
    _imageFile = null;
    text.isEmpty ? _isSendButtonActive = false : _isSendButtonActive = true;
    notifyListeners();
  }
}
