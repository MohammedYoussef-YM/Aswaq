import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/chat_model.dart';
import 'package:flutter_ui_kit/restaurant/data/repository/chat_repo.dart';
import 'package:flutter_ui_kit/restaurant/helper/date_converter.dart';

class RestChatProvider extends ChangeNotifier {
  final RestChatRepo chatRepo;
  RestChatProvider({@required this.chatRepo});

  List<ChatModel> _chatList;
  File _imageFile;
  bool _isSendButtonActive = false;

  List<ChatModel> get chatList => _chatList;
  File get imageFile => _imageFile;
  bool get isSendButtonActive => _isSendButtonActive;

  void getChatList() async {
    _chatList = null;
    notifyListeners();
    ApiResponse apiResponse = await chatRepo.getChatList();
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _chatList = [];
      apiResponse.response.data.forEach((chat) => _chatList.add(chat));
      notifyListeners();
    } else {
      print(apiResponse.error.toString());
    }
  }

  void sendMessage(String message) async {
    _chatList.insert(0, ChatModel(
      message: message, createdAt: DateConverter.localDateToIsoString(DateTime.now()), checked: '1', reply: null, userId: '1',
    ));
    notifyListeners();
    _imageFile = null;
    _isSendButtonActive = false;
    notifyListeners();
  }

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