import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/error_response.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/userinfo_model.dart';
import 'package:flutter_ui_kit/restaurant/data/repository/profile_repo.dart';

class RestProfileProvider with ChangeNotifier {
  final RestProfileRepo profileRepo;

  RestProfileProvider({@required this.profileRepo});
  UserInfoModel _userInfoModel;

  UserInfoModel get userInfoModel => _userInfoModel;

  Future getUserInfo() async {
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

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<String> uploadImage(File file, String token) async {
    String imageUrl = '';
    return imageUrl;
  }

  Future updateUserInfo(UserInfoModel updateUserModel,  File file, String token) async {
    _isLoading = true;
    notifyListeners();

    _isLoading = false;
    _userInfoModel = updateUserModel;
    notifyListeners();

  }




}
