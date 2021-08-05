class OrderModel {
  int id;
  String userId;
  String orderAmount;
  String couponDiscountAmount;
  String couponDiscountTitle;
  String paymentStatus;
  String orderStatus;
  String totalTaxAmount;
  String paymentMethod;
  String transactionReference;
  String deliveryAddressId;
  String createdAt;
  String updatedAt;
  String checked;
  String deliveryManId;
  DeliveryAddress deliveryAddress;

  OrderModel(
      {this.id,
        this.userId,
        this.orderAmount,
        this.couponDiscountAmount,
        this.couponDiscountTitle,
        this.paymentStatus,
        this.orderStatus,
        this.totalTaxAmount,
        this.paymentMethod,
        this.transactionReference,
        this.deliveryAddressId,
        this.createdAt,
        this.updatedAt,
        this.checked,
        this.deliveryManId,
        this.deliveryAddress});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    orderAmount = json['order_amount'];
    couponDiscountAmount = json['coupon_discount_amount'];
    couponDiscountTitle = json['coupon_discount_title'];
    paymentStatus = json['payment_status'];
    orderStatus = json['order_status'];
    totalTaxAmount = json['total_tax_amount'];
    paymentMethod = json['payment_method'];
    transactionReference = json['transaction_reference'];
    deliveryAddressId = json['delivery_address_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    checked = json['checked'];
    deliveryManId = json['delivery_man_id'];
    deliveryAddress = json['delivery_address'] != null
        ? new DeliveryAddress.fromJson(json['delivery_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['order_amount'] = this.orderAmount;
    data['coupon_discount_amount'] = this.couponDiscountAmount;
    data['coupon_discount_title'] = this.couponDiscountTitle;
    data['payment_status'] = this.paymentStatus;
    data['order_status'] = this.orderStatus;
    data['total_tax_amount'] = this.totalTaxAmount;
    data['payment_method'] = this.paymentMethod;
    data['transaction_reference'] = this.transactionReference;
    data['delivery_address_id'] = this.deliveryAddressId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['checked'] = this.checked;
    data['delivery_man_id'] = this.deliveryManId;
    if (this.deliveryAddress != null) {
      data['delivery_address'] = this.deliveryAddress.toJson();
    }
    return data;
  }
}

class DeliveryAddress {
  int id;
  String addressType;
  String contactPersonNumber;
  String address;
  String latitude;
  String longitude;
  String createdAt;
  String updatedAt;
  String userId;
  String contactPersonName;

  DeliveryAddress(
      {this.id,
        this.addressType,
        this.contactPersonNumber,
        this.address,
        this.latitude,
        this.longitude,
        this.createdAt,
        this.updatedAt,
        this.userId,
        this.contactPersonName});

  DeliveryAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressType = json['address_type'];
    contactPersonNumber = json['contact_person_number'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    contactPersonName = json['contact_person_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address_type'] = this.addressType;
    data['contact_person_number'] = this.contactPersonNumber;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.userId;
    data['contact_person_name'] = this.contactPersonName;
    return data;
  }
}
