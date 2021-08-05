class ConfigModel {
  BaseUrls baseUrls;
  String currencySymbol;
  String deliveryCharge;

  ConfigModel({this.baseUrls, this.currencySymbol, this.deliveryCharge});

  ConfigModel.fromJson(Map<String, dynamic> json) {
    baseUrls = json['base_urls'] != null
        ? new BaseUrls.fromJson(json['base_urls'])
        : null;
    currencySymbol = json['currency_symbol'];
    deliveryCharge = json['delivery_charge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.baseUrls != null) {
      data['base_urls'] = this.baseUrls.toJson();
    }
    data['currency_symbol'] = this.currencySymbol;
    data['delivery_charge'] = this.deliveryCharge;
    return data;
  }
}

class BaseUrls {
  String productImageUrl;
  String customerImageUrl;
  String bannerImageUrl;
  String categoryImageUrl;
  String reviewImageUrl;
  String notificationImageUrl;
  String restaurantImageUrl;
  String deliveryManImageUrl;
  String chatImageUrl;

  BaseUrls(
      {this.productImageUrl,
        this.customerImageUrl,
        this.bannerImageUrl,
        this.categoryImageUrl,
        this.reviewImageUrl,
        this.notificationImageUrl,
        this.restaurantImageUrl,
        this.deliveryManImageUrl,
        this.chatImageUrl});

  BaseUrls.fromJson(Map<String, dynamic> json) {
    productImageUrl = json['product_image_url'];
    customerImageUrl = json['customer_image_url'];
    bannerImageUrl = json['banner_image_url'];
    categoryImageUrl = json['category_image_url'];
    reviewImageUrl = json['review_image_url'];
    notificationImageUrl = json['notification_image_url'];
    restaurantImageUrl = json['restaurant_image_url'];
    deliveryManImageUrl = json['delivery_man_image_url'];
    chatImageUrl = json['chat_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_image_url'] = this.productImageUrl;
    data['customer_image_url'] = this.customerImageUrl;
    data['banner_image_url'] = this.bannerImageUrl;
    data['category_image_url'] = this.categoryImageUrl;
    data['review_image_url'] = this.reviewImageUrl;
    data['notification_image_url'] = this.notificationImageUrl;
    data['restaurant_image_url'] = this.restaurantImageUrl;
    data['delivery_man_image_url'] = this.deliveryManImageUrl;
    data['chat_image_url'] = this.chatImageUrl;
    return data;
  }
}
