import 'package:flutter_ui_kit/restaurant_delivery_boy/data/model/response/language_model.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/images.dart';

class RestaurantDeliveryBoyAppConstants {

  // Shared Key
  static const String THEME = 'theme';
  static const String TOKEN = 'token';
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static const String CART_LIST = 'cart_list';
  static const String USER_PASSWORD = 'user_password';
  static const String USER_EMAIL = 'user_email';

  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: RestaurantDeliveryBoyImages.united_kindom, languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(imageUrl: RestaurantDeliveryBoyImages.arabic, languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
  ];
}
