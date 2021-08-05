class ChatModel {
  String _message;
  bool _isMe;

  ChatModel(this._message, this._isMe);

  bool get isMe => _isMe;
  String get message => _message;
}