class ChatModel {
  int _id;
  String _userId;
  String _message;
  String _reply;
  String _createdAt;
  String _updatedAt;
  String _checked;

  ChatModel(
      {int id,
        String userId,
        String message,
        String reply,
        String createdAt,
        String updatedAt,
        String checked}) {
    this._id = id;
    this._userId = userId;
    this._message = message;
    this._reply = reply;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._checked = checked;
  }

  int get id => _id;
  String get userId => _userId;
  String get message => _message;
  String get reply => _reply;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  String get checked => _checked;

  ChatModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userId = json['user_id'];
    _message = json['message'];
    _reply = json['reply'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _checked = json['checked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['user_id'] = this._userId;
    data['message'] = this._message;
    data['reply'] = this._reply;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['checked'] = this._checked;
    return data;
  }
}