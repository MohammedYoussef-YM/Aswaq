class OrderPlaceModel {
  CustomerInfo _customerInfo;
  List<Cart> _cart;
  String _paymentMethod;
  int _discount;

  OrderPlaceModel(
      CustomerInfo customerInfo,
        List<Cart> cart,
        String paymentMethod,
        int discount) {
    this._customerInfo = customerInfo;
    this._cart = cart;
    this._paymentMethod = paymentMethod;
    this._discount = discount;
  }

  CustomerInfo get customerInfo => _customerInfo;
  List<Cart> get cart => _cart;
  String get paymentMethod => _paymentMethod;
  int get discount => _discount;

  OrderPlaceModel.fromJson(Map<String, dynamic> json) {
    _customerInfo = json['customer_info'] != null
        ? new CustomerInfo.fromJson(json['customer_info'])
        : null;
    if (json['cart'] != null) {
      _cart = [];
      json['cart'].forEach((v) {
        _cart.add(new Cart.fromJson(v));
      });
    }
    _paymentMethod = json['payment_method'];
    _discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._customerInfo != null) {
      data['customer_info'] = this._customerInfo.toJson();
    }
    if (this._cart != null) {
      data['cart'] = this._cart.map((v) => v.toJson()).toList();
    }
    data['payment_method'] = this._paymentMethod;
    data['discount'] = this._discount;
    return data;
  }
}

class CustomerInfo {
  String _addressId;
  String _shippingAddress;

  CustomerInfo(String addressId, String shippingAddress) {
    this._addressId = addressId;
    this._shippingAddress = shippingAddress;
  }

  String get addressId => _addressId;
  String get shippingAddress => _shippingAddress;

  CustomerInfo.fromJson(Map<String, dynamic> json) {
    _addressId = json['address_id'];
    _shippingAddress = json['shipping_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this._addressId;
    data['shipping_address'] = this._shippingAddress;
    return data;
  }
}

class Cart {
  String _id;
  int _tax;
  int _quantity;
  int _price;
  int _discount;
  String _discountType;
  int _shippingMethodId;
  String _variant;
  String _variation;
  int _shippingCost;

  Cart(
      String id,
        int tax,
        int quantity,
        int price,
        int discount,
        String discountType,
        int shippingMethodId,
        String variant,
        String variation,
        int shippingCost) {
    this._id = id;
    this._tax = tax;
    this._quantity = quantity;
    this._price = price;
    this._discount = discount;
    this._discountType = discountType;
    this._shippingMethodId = shippingMethodId;
    this._variant = variant;
    this._variation = variation;
    this._shippingCost = shippingCost;
  }

  String get id => _id;
  int get tax => _tax;
  int get quantity => _quantity;
  int get price => _price;
  int get discount => _discount;
  String get discountType => _discountType;
  int get shippingMethodId => _shippingMethodId;
  String get variant => _variant;
  String get variation => _variation;
  int get shippingCost => _shippingCost;

  Cart.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _tax = json['tax'];
    _quantity = json['quantity'];
    _price = json['price'];
    _discount = json['discount'];
    _discountType = json['discount_type'];
    _shippingMethodId = json['shipping_method_id'];
    _variant = json['variant'];
    _variation = json['variations'];
    _shippingCost = json['shipping_cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['tax'] = this._tax;
    data['quantity'] = this._quantity;
    data['price'] = this._price;
    data['discount'] = this._discount;
    data['discount_type'] = this._discountType;
    data['shipping_method_id'] = this._shippingMethodId;
    data['variant'] = this._variant;
    data['variations'] = this._variation;
    data['shipping_cost'] = this._shippingCost;
    return data;
  }
}