import 'package:flutter_ui_kit/restaurant/data/model/response/product_model.dart';

class OrderDetailsModel {
  int _id;
  String _productId;
  String _orderId;
  String _price;
  Product _productDetails;
  String _variation;
  String _discountOnProduct;
  String _discountType;
  String _quantity;
  String _taxAmount;
  String _createdAt;
  String _updatedAt;
  List<int> _addOnIds;
  String _variant;

  OrderDetailsModel(
      {int id,
        String productId,
        String orderId,
        String price,
        Product productDetails,
        String variation,
        String discountOnProduct,
        String discountType,
        String quantity,
        String taxAmount,
        String createdAt,
        String updatedAt,
        List<int> addOnIds,
        String variant}) {
    this._id = id;
    this._productId = productId;
    this._orderId = orderId;
    this._price = price;
    this._productDetails = productDetails;
    this._variation = variation;
    this._discountOnProduct = discountOnProduct;
    this._discountType = discountType;
    this._quantity = quantity;
    this._taxAmount = taxAmount;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._addOnIds = addOnIds;
    this._variant = variant;
  }

  int get id => _id;
  String get productId => _productId;
  String get orderId => _orderId;
  String get price => _price;
  Product get productDetails => _productDetails;
  String get variation => _variation;
  String get discountOnProduct => _discountOnProduct;
  String get discountType => _discountType;
  String get quantity => _quantity;
  String get taxAmount => _taxAmount;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  List<int> get addOnIds => _addOnIds;
  String get variant => _variant;

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _productId = json['product_id'];
    _orderId = json['order_id'];
    _price = json['price'];
    _productDetails = json['product_details'] != null
        ? new Product.fromJson(json['product_details'])
        : null;
    _variation = json['variation'];
    _discountOnProduct = json['discount_on_product'];
    _discountType = json['discount_type'];
    _quantity = json['quantity'];
    _taxAmount = json['tax_amount'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['add_on_ids'] != null) {
      _addOnIds = json['add_on_ids'].cast<int>();
    }
    _variant = json['variant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['product_id'] = this._productId;
    data['order_id'] = this._orderId;
    data['price'] = this._price;
    if (this._productDetails != null) {
      data['product_details'] = this._productDetails.toJson();
    }
    data['variation'] = this._variation;
    data['discount_on_product'] = this._discountOnProduct;
    data['discount_type'] = this._discountType;
    data['quantity'] = this._quantity;
    data['tax_amount'] = this._taxAmount;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['add_on_ids'] = this._addOnIds;
    data['variant'] = this._variant;
    return data;
  }
}