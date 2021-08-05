
class PaymentModel {
  String _image;
  String _cardName;
  String _cardNumber;

  PaymentModel(this._image, this._cardName, this._cardNumber);

  String get image => _image;
  String get cardNumber => _cardNumber;
  String get cardName => _cardName;
}