import 'dart:io';

class ChatModel {
  String _message;
  File _image;
  DateTime _dateTime;
  bool _isMe;
  bool _isSeen;

  ChatModel(this._message, this._image, this._dateTime, this._isMe, this._isSeen);

  bool get isMe => _isMe;
  DateTime get dateTime => _dateTime;
  String get message => _message;
  File get image => _image;
  bool get isSeen => _isSeen;
}