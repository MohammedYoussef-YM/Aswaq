import 'package:flutter_ui_kit/restaurant/data/model/response/product_model.dart';

class CartModel {
  String _name;
  String _image;
  String _productId;
  String _price;
  double _discountedPrice;
  String _variant;
  List<Variation> _variation;
  double _discountAmount;
  int _quantity;
  double _taxAmount;
  List<int> _addOnIds;
  List<AddOns> _addOns;
  List<Rating> _rating;

  CartModel(
      String name,
        String image,
        String productId,
        String price,
        double discountedPrice,
        String variant,
        List<Variation> variation,
        double discountAmount,
        int quantity,
        double taxAmount,
        List<int> addOnIds,
        List<AddOns> addOns,
        List<Rating> rating) {
    this._name = name;
    this._image = image;
    this._productId = productId;
    this._price = price;
    this._discountedPrice = discountedPrice;
    this._variant = variant;
    this._variation = variation;
    this._discountAmount = discountAmount;
    this._quantity = quantity;
    this._taxAmount = taxAmount;
    this._addOnIds = addOnIds;
    this._addOns = addOns;
    this._rating = rating;
  }

  String get name => _name;
  String get image => _image;
  String get productId => _productId;
  String get price => _price;
  double get discountedPrice => _discountedPrice;
  String get variant => _variant;
  List<Variation> get variation => _variation;
  double get discountAmount => _discountAmount;
  // ignore: unnecessary_getters_setters
  int get quantity => _quantity;
  // ignore: unnecessary_getters_setters
  set quantity(int qty) => _quantity = qty;
  double get taxAmount => _taxAmount;
  List<int> get addOnIds => _addOnIds;
  List<AddOns> get addOns => _addOns;
  List<Rating> get rating => _rating;

  CartModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _image = json['image'];
    _productId = json['product_id'];
    _price = json['price'];
    _discountedPrice = json['discounted_price'];
    _variant = json['variant'];
    if (json['variation'] != null) {
      _variation = [];
      json['variation'].forEach((v) {
        _variation.add(new Variation.fromJson(v));
      });
    }
    _discountAmount = json['discount_amount'];
    _quantity = json['quantity'];
    _taxAmount = json['tax_amount'];
    _addOnIds = json['add_on_ids'].cast<int>();
    if (json['addOns'] != null) {
      _addOns = [];
      json['addOns'].forEach((v) {
        _addOns.add(new AddOns.fromJson(v));
      });
    }
    if (json['rating'] != null) {
      _rating = [];
      json['rating'].forEach((v) {
        _rating.add(new Rating.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['image'] = this._image;
    data['product_id'] = this._productId;
    data['price'] = this._price;
    data['discounted_price'] = this._discountedPrice;
    data['variant'] = this._variant;
    if (this._variation != null) {
      data['variation'] = this._variation.map((v) => v.toJson()).toList();
    }
    data['discount_amount'] = this._discountAmount;
    data['quantity'] = this._quantity;
    data['tax_amount'] = this._taxAmount;
    data['add_on_ids'] = this._addOnIds;
    if (this._addOns != null) {
      data['addOns'] = this._addOns.map((v) => v.toJson()).toList();
    }
    if (this._rating != null) {
      data['rating'] = this._rating.map((v) => v.toJson()).toList();
    }
    return data;
  }
}