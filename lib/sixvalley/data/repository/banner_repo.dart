
import 'package:flutter_ui_kit/sixvalley/data/model/response/banner_model.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';

class SixBannerRepo {

  List<BannerModel> getBannerList() {
    List<BannerModel> bannerList = [
      BannerModel(id: 1, photo: Images.banner_one, url: 'https://www.facebook.com'),
      BannerModel(id: 2, photo: Images.banner_two, url: 'https://www.facebook.com'),
      BannerModel(id: 3, photo: Images.banner_three, url: 'https://www.facebook.com'),
    ];
    return bannerList;
  }
}