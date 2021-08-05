class ConfigModel {
  BaseUrls _baseUrls;
  String _currency;
  String _deliveryCharge;

  ConfigModel({BaseUrls baseUrls, String currency, String deliveryCharge}) {
    this._baseUrls = baseUrls;
    this._currency = currency;
    this._deliveryCharge = deliveryCharge;
  }

  BaseUrls get baseUrls => _baseUrls;
  String get currency => _currency;
  String get deliveryCharge => _deliveryCharge;

  ConfigModel.fromJson(Map<String, dynamic> json) {
    _baseUrls = json['base_urls'] != null
        ? new BaseUrls.fromJson(json['base_urls'])
        : null;
    _currency = json['currency'];
    _deliveryCharge = json['delivery_charge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._baseUrls != null) {
      data['base_urls'] = this._baseUrls.toJson();
    }
    data['currency'] = this._currency;
    data['delivery_charge'] = this._deliveryCharge;
    return data;
  }
}

class BaseUrls {
  String _productImageUrl;
  String _customerImageUrl;
  String _bannerImageUrl;
  String _categoryImageUrl;
  String _reviewImageUrl;
  String _notificationImageUrl;
  String _restaurantImageUrl;

  BaseUrls(
      {String productImageUrl,
        String customerImageUrl,
        String bannerImageUrl,
        String categoryImageUrl,
        String reviewImageUrl,
        String notificationImageUrl,
        String restaurantImageUrl}) {
    this._productImageUrl = productImageUrl;
    this._customerImageUrl = customerImageUrl;
    this._bannerImageUrl = bannerImageUrl;
    this._categoryImageUrl = categoryImageUrl;
    this._reviewImageUrl = reviewImageUrl;
    this._notificationImageUrl = notificationImageUrl;
    this._restaurantImageUrl = restaurantImageUrl;
  }

  String get productImageUrl => _productImageUrl;
  String get customerImageUrl => _customerImageUrl;
  String get bannerImageUrl => _bannerImageUrl;
  String get categoryImageUrl => _categoryImageUrl;
  String get reviewImageUrl => _reviewImageUrl;
  String get notificationImageUrl => _notificationImageUrl;
  String get restaurantImageUrl => _restaurantImageUrl;

  BaseUrls.fromJson(Map<String, dynamic> json) {
    _productImageUrl = json['product_image_url'];
    _customerImageUrl = json['customer_image_url'];
    _bannerImageUrl = json['banner_image_url'];
    _categoryImageUrl = json['category_image_url'];
    _reviewImageUrl = json['review_image_url'];
    _notificationImageUrl = json['notification_image_url'];
    _restaurantImageUrl = json['restaurant_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_image_url'] = this._productImageUrl;
    data['customer_image_url'] = this._customerImageUrl;
    data['banner_image_url'] = this._bannerImageUrl;
    data['category_image_url'] = this._categoryImageUrl;
    data['review_image_url'] = this._reviewImageUrl;
    data['notification_image_url'] = this._notificationImageUrl;
    data['restaurant_image_url'] = this._restaurantImageUrl;
    return data;
  }
}
