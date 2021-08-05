class BannerModel {
  int _id;
  String _title;
  String _image;
  String _productId;
  String _status;
  String _createdAt;
  String _updatedAt;

  BannerModel(
      {int id,
        String title,
        String image,
        String productId,
        String status,
        String createdAt,
        String updatedAt}) {
    this._id = id;
    this._title = title;
    this._image = image;
    this._productId = productId;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get id => _id;
  String get title => _title;
  String get image => _image;
  String get productId => _productId;
  String get status => _status;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  BannerModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _image = json['image'];
    _productId = json['product_id'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['image'] = this._image;
    data['product_id'] = this._productId;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}