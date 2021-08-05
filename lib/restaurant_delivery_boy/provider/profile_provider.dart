import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/model/response/base/error_response.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/model/response/userinfo_model.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/repository/profile_repo.dart';

class RestaurantDeliveryBoyProfileProvider with ChangeNotifier {
  final RestaurantDeliveryBoyProfileRepo profileRepo;

  RestaurantDeliveryBoyProfileProvider({@required this.profileRepo});

  UserInfoModel _userInfoModel;

  UserInfoModel get userInfoModel => _userInfoModel;

  getUserInfo() async {
    ApiResponse apiResponse = await profileRepo.getUserInfo();
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _userInfoModel = apiResponse.response.data;
    } else {
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors[0].message);
      }
    }
    notifyListeners();
  }
}
