import 'package:flutter_ui_kit/sixvalley/data/model/response/product_model.dart';

class OrderDetailsModel {
  int _id;
  String _orderId;
  String _productId;
  String _sellerId;
  Product _productDetails;
  String _qty;
  String _price;
  String _tax;
  String _discount;
  String _deliveryStatus;
  String _paymentStatus;
  String _createdAt;
  String _updatedAt;
  String _shippingMethodId;

  OrderDetailsModel(
      {int id,
        String orderId,
        String productId,
        String sellerId,
        Product productDetails,
        String qty,
        String price,
        String tax,
        String discount,
        String deliveryStatus,
        String paymentStatus,
        String createdAt,
        String updatedAt,
        String shippingMethodId}) {
    this._id = id;
    this._orderId = orderId;
    this._productId = productId;
    this._sellerId = sellerId;
    this._productDetails = productDetails;
    this._qty = qty;
    this._price = price;
    this._tax = tax;
    this._discount = discount;
    this._deliveryStatus = deliveryStatus;
    this._paymentStatus = paymentStatus;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._shippingMethodId = shippingMethodId;
  }

  int get id => _id;
  String get orderId => _orderId;
  String get productId => _productId;
  String get sellerId => _sellerId;
  Product get productDetails => _productDetails;
  String get qty => _qty;
  String get price => _price;
  String get tax => _tax;
  String get discount => _discount;
  String get deliveryStatus => _deliveryStatus;
  String get paymentStatus => _paymentStatus;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  String get shippingMethodId => _shippingMethodId;

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _orderId = json['order_id'];
    _productId = json['product_id'];
    _sellerId = json['seller_id'];
    if(json['product_details'] != null) {
      _productDetails = Product.fromJson(json['product_details']);
    }
    _qty = json['qty'];
    _price = json['price'];
    _tax = json['tax'];
    _discount = json['discount'];
    _deliveryStatus = json['delivery_status'];
    _paymentStatus = json['payment_status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _shippingMethodId = json['shipping_method_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['order_id'] = this._orderId;
    data['product_id'] = this._productId;
    data['seller_id'] = this._sellerId;
    if(this._productDetails != null) {
      data['product_details'] = this._productDetails.toJson();
    }
    data['qty'] = this._qty;
    data['price'] = this._price;
    data['tax'] = this._tax;
    data['discount'] = this._discount;
    data['delivery_status'] = this._deliveryStatus;
    data['payment_status'] = this._paymentStatus;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['shipping_method_id'] = this._shippingMethodId;
    return data;
  }
}
