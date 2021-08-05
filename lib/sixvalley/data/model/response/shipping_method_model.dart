class ShippingMethodModel {
  int _id;
  String _creatorId;
  String _creatorType;
  String _title;
  String _cost;
  String _duration;
  String _status;
  String _createdAt;
  String _updatedAt;

  ShippingMethodModel(
      {int id,
        String creatorId,
        String creatorType,
        String title,
        String cost,
        String duration,
        String status,
        String createdAt,
        String updatedAt}) {
    this._id = id;
    this._creatorId = creatorId;
    this._creatorType = creatorType;
    this._title = title;
    this._cost = cost;
    this._duration = duration;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get id => _id;
  String get creatorId => _creatorId;
  String get creatorType => _creatorType;
  String get title => _title;
  String get cost => _cost;
  String get duration => _duration;
  String get status => _status;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  ShippingMethodModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _creatorId = json['creator_id'];
    _creatorType = json['creator_type'];
    _title = json['title'];
    _cost = json['cost'];
    _duration = json['duration'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['creator_id'] = this._creatorId;
    data['creator_type'] = this._creatorType;
    data['title'] = this._title;
    data['cost'] = this._cost;
    data['duration'] = this._duration;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
