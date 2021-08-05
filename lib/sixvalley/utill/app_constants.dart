import 'package:flutter_ui_kit/sixvalley/data/repository/language_model.dart';

class SixAppConstants {
  static const String BASE_URL = 'http://dev.6amtech.com/api/';
  static const String USER_ID = 'userId';
  static const String NAME = 'name';
  static const String CATEGORIES_URI = 'v1/categories';
  static const String BRANDS_URI = 'v1/brands';
  static const String REGISTRATION_URI = 'v1/auth/register';
  static const String LOGIN_URI = 'v1/auth/login';
  static const String LATEST_PRODUCTS_URI = 'v1/products/latest?limit=10&&offset=';
  static const String PRODUCT_DETAILS_URI = 'v1/products/details/';
  static const String PRODUCT_REVIEW_URI = 'v1/products/reviews/';
  static const String SEARCH_URI = 'v1/products/search?name=';
  static const String CONFIG_URI = 'v1/config';
  static const String ADD_WISH_LIST_URI = 'v1/customer/wish-list/add?product_id=';
  static const String REMOVE_WISH_LIST_URI = 'v1/customer/wish-list/remove?product_id=';
  static const String UPDATE_PROFILE_URI = 'v1/customer/update-profile';
  static const String CUSTOMER_URI = 'v1/customer/info';
  static const String ADDRESS_LIST_URI = 'v1/customer/address/list';
  static const String REMOVE_ADDRESS_URI = 'v1/customer/address?address_id=';
  static const String ADD_ADDRESS_URI = 'v1/customer/address/add';
  static const String WISH_LIST_GET_URI = 'v1/customer/wish-list';
  static const String SUPPORT_TICKET_URI = 'v1/customer/support-ticket/create';
  static const String MAIN_BANNER_URI = 'v1/banners?banner_type=main_banner';
  static const String FOOTER_BANNER_URI = 'v1/banners?banner_type=footer_banner';
  static const String RELATED_PRODUCT_URI = 'v1/products/related-products/';
  static const String ORDER_URI = 'v1/customer/order/list';
  static const String ORDER_DETAILS_URI = 'v1/customer/order/details?order_id=';
  static const String ORDER_PLACE_URI = 'v1/customer/order/place';
  static const String SELLER_URI = 'v1/seller?seller_id=';
  static const String SELLER_PRODUCT_URI = 'v1/seller/';
  static const String TRACKING_URI = 'v1/order/track?order_id=';
  static const String FORGET_PASSWORD_URI = 'v1/auth/forgot-password';
  static const String SUPPORT_TICKET_GET_URI = 'v1/customer/support-ticket/get';
  static const String SUBMIT_REVIEW_URI = 'v1/products/reviews/submit';
  static const String FLASH_DEAL_URI = 'v1/flash-deals';
  static const String FLASH_DEAL_PRODUCT_URI = 'v1/flash-deals/products/';
  static const String COUNTER_URI = 'v1/products/counter/';
  static const String SOCIAL_LINK_URI = 'v1/products/social-share-link/';
  static const String SHIPPING_URI = 'v1/products/shipping-methods';
  static const String COUPON_URI = 'v1/coupon/apply?code=';

  // sharePreference
  static const String TOKEN = 'token';
  static const String USER_EMAIL = 'user_email';
  static const String USER_PASSWORD = 'user_password';
  static const String HOME_ADDRESS = 'home_address';
  static const String SEARCH_ADDRESS = 'search_address';
  static const String OFFICE_ADDRESS = 'office_address';
  static const String CART_LIST = 'six_cart_list';
  static const String CONFIG = 'config';
  static const String GUEST_MODE = 'guest_mode';
  static const String CURRENCY = 'currency';

  // order status
  static const String PENDING = 'pending';
  static const String PROCESSING = 'processing';
  static const String PROCESSED = 'processed';
  static const String DELIVERED = 'delivered';
  static const String FAILED = 'failed';
  static const String RETURNED = 'returned';
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static const String THEME = 'theme';

  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: '', languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(imageUrl: '', languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
  ];
}
