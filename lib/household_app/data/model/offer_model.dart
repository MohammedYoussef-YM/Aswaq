class OfferModel {
  String _image;
  String _title;
  String _description;

  OfferModel(this._image, this._title, this._description);

  String get description => _description;
  String get title => _title;
  String get image => _image;
}