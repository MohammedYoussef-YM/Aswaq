import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/banner_model.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/repository/banner_repo.dart';

class RestBannerProvider extends ChangeNotifier {
  final RestBannerRepo bannerRepo;
  RestBannerProvider({@required this.bannerRepo});

  List<BannerModel> _bannerList;
  List<BannerModel> get bannerList => _bannerList;

  void getBannerList(BuildContext context) async {
    ApiResponse apiResponse = await bannerRepo.getBannerList();
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _bannerList = [];
      apiResponse.response.data.forEach((category) => _bannerList.add(category));
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(apiResponse.error.toString())));
    }
  }
}