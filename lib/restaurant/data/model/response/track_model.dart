class OrderModel {
  int _id;
  String _userId;
  String _orderAmount;
  String _couponDiscountAmount;
  String _couponDiscountTitle;
  String _paymentStatus;
  String _orderStatus;
  String _totalTaxAmount;
  String _paymentMethod;
  String _transactionReference;
  String _deliveryAddressId;
  String _createdAt;
  String _updatedAt;
  String _checked;
  String _deliveryManId;
  List<int> _addOnIds;
  List<Details> _details;
  DeliveryMan _deliveryMan;

  OrderModel(
      {int id,
        String userId,
        String orderAmount,
        String couponDiscountAmount,
        String couponDiscountTitle,
        String paymentStatus,
        String orderStatus,
        String totalTaxAmount,
        String paymentMethod,
        String transactionReference,
        String deliveryAddressId,
        String createdAt,
        String updatedAt,
        String checked,
        String deliveryManId,
        List<int> addOnIds,
        List<Details> details,
        DeliveryMan deliveryMan}) {
    this._id = id;
    this._userId = userId;
    this._orderAmount = orderAmount;
    this._couponDiscountAmount = couponDiscountAmount;
    this._couponDiscountTitle = couponDiscountTitle;
    this._paymentStatus = paymentStatus;
    this._orderStatus = orderStatus;
    this._totalTaxAmount = totalTaxAmount;
    this._paymentMethod = paymentMethod;
    this._transactionReference = transactionReference;
    this._deliveryAddressId = deliveryAddressId;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._checked = checked;
    this._deliveryManId = deliveryManId;
    this._addOnIds = addOnIds;
    this._details = details;
    this._deliveryMan = deliveryMan;
  }

  int get id => _id;
  String get userId => _userId;
  String get orderAmount => _orderAmount;
  String get couponDiscountAmount => _couponDiscountAmount;
  String get couponDiscountTitle => _couponDiscountTitle;
  String get paymentStatus => _paymentStatus;
  String get orderStatus => _orderStatus;
  String get totalTaxAmount => _totalTaxAmount;
  String get paymentMethod => _paymentMethod;
  String get transactionReference => _transactionReference;
  String get deliveryAddressId => _deliveryAddressId;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  String get checked => _checked;
  String get deliveryManId => _deliveryManId;
  List<int> get addOnIds => _addOnIds;
  List<Details> get details => _details;
  DeliveryMan get deliveryMan => _deliveryMan;

  OrderModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userId = json['user_id'];
    _orderAmount = json['order_amount'];
    _couponDiscountAmount = json['coupon_discount_amount'];
    _couponDiscountTitle = json['coupon_discount_title'];
    _paymentStatus = json['payment_status'];
    _orderStatus = json['order_status'];
    _totalTaxAmount = json['total_tax_amount'];
    _paymentMethod = json['payment_method'];
    _transactionReference = json['transaction_reference'];
    _deliveryAddressId = json['delivery_address_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _checked = json['checked'];
    _deliveryManId = json['delivery_man_id'];
    if (json['add_on_ids'] != null) {
      _addOnIds = json['add_on_ids'].cast<int>();
    }
    if (json['details'] != null) {
      _details = [];
      json['details'].forEach((v) {
        _details.add(new Details.fromJson(v));
      });
    }
    _deliveryMan = json['delivery_man'] != null
        ? new DeliveryMan.fromJson(json['delivery_man'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['user_id'] = this._userId;
    data['order_amount'] = this._orderAmount;
    data['coupon_discount_amount'] = this._couponDiscountAmount;
    data['coupon_discount_title'] = this._couponDiscountTitle;
    data['payment_status'] = this._paymentStatus;
    data['order_status'] = this._orderStatus;
    data['total_tax_amount'] = this._totalTaxAmount;
    data['payment_method'] = this._paymentMethod;
    data['transaction_reference'] = this._transactionReference;
    data['delivery_address_id'] = this._deliveryAddressId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['checked'] = this._checked;
    data['delivery_man_id'] = this._deliveryManId;
    data['add_on_ids'] = this._addOnIds;
    if (this._details != null) {
      data['details'] = this._details.map((v) => v.toJson()).toList();
    }
    if (this._deliveryMan != null) {
      data['delivery_man'] = this._deliveryMan.toJson();
    }
    return data;
  }
}

class Details {
  int _id;
  String _productId;
  String _orderId;
  String _price;
  String _productDetails;
  String _variation;
  String _discountOnProduct;
  String _discountType;
  String _quantity;
  String _taxAmount;
  String _createdAt;
  String _updatedAt;
  String _addOnIds;
  String _variant;

  Details(
      {int id,
        String productId,
        String orderId,
        String price,
        String productDetails,
        String variation,
        String discountOnProduct,
        String discountType,
        String quantity,
        String taxAmount,
        String createdAt,
        String updatedAt,
        String addOnIds,
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
  String get productDetails => _productDetails;
  String get variation => _variation;
  String get discountOnProduct => _discountOnProduct;
  String get discountType => _discountType;
  String get quantity => _quantity;
  String get taxAmount => _taxAmount;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  String get addOnIds => _addOnIds;
  String get variant => _variant;

  Details.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _productId = json['product_id'];
    _orderId = json['order_id'];
    _price = json['price'];
    _productDetails = json['product_details'];
    _variation = json['variation'];
    _discountOnProduct = json['discount_on_product'];
    _discountType = json['discount_type'];
    _quantity = json['quantity'];
    _taxAmount = json['tax_amount'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _addOnIds = json['add_on_ids'];
    _variant = json['variant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['product_id'] = this._productId;
    data['order_id'] = this._orderId;
    data['price'] = this._price;
    data['product_details'] = this._productDetails;
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

class DeliveryMan {
  int _id;
  String _fName;
  String _lName;
  String _phone;
  String _email;
  String _identityNumber;
  String _identityType;
  String _identityImage;
  String _image;
  String _password;
  String _createdAt;
  String _updatedAt;

  DeliveryMan(
      {int id,
        String fName,
        String lName,
        String phone,
        String email,
        String identityNumber,
        String identityType,
        String identityImage,
        String image,
        String password,
        String createdAt,
        String updatedAt}) {
    this._id = id;
    this._fName = fName;
    this._lName = lName;
    this._phone = phone;
    this._email = email;
    this._identityNumber = identityNumber;
    this._identityType = identityType;
    this._identityImage = identityImage;
    this._image = image;
    this._password = password;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get id => _id;
  String get fName => _fName;
  String get lName => _lName;
  String get phone => _phone;
  String get email => _email;
  String get identityNumber => _identityNumber;
  String get identityType => _identityType;
  String get identityImage => _identityImage;
  String get image => _image;
  String get password => _password;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  DeliveryMan.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _fName = json['f_name'];
    _lName = json['l_name'];
    _phone = json['phone'];
    _email = json['email'];
    _identityNumber = json['identity_number'];
    _identityType = json['identity_type'];
    _identityImage = json['identity_image'];
    _image = json['image'];
    _password = json['password'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['f_name'] = this._fName;
    data['l_name'] = this._lName;
    data['phone'] = this._phone;
    data['email'] = this._email;
    data['identity_number'] = this._identityNumber;
    data['identity_type'] = this._identityType;
    data['identity_image'] = this._identityImage;
    data['image'] = this._image;
    data['password'] = this._password;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}