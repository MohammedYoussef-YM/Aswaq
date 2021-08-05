class WishListModel {
  String _image;
  String _name;
  double _rating;
  int _totalRating;
  String _instructor;
  double _price;
  double _offPrice;

  WishListModel(this._image, this._name, this._rating, this._totalRating, this._instructor, this._price, this._offPrice);

  String get image => _image;
  double get offPrice => _offPrice;
  double get price => _price;
  String get instructor => _instructor;
  int get totalRating => _totalRating;
  double get rating => _rating;
  String get name => _name;
}