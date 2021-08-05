import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/banner_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/repository/banner_repo.dart';

class SixBannerProvider extends ChangeNotifier {
  final SixBannerRepo bannerRepo;

  SixBannerProvider({@required this.bannerRepo});

  List<BannerModel> _bannerList;
  int _currentIndex;

  List<BannerModel> get bannerList => _bannerList;
  int get currentIndex => _currentIndex;

  void initBannerList() async {
    if (_bannerList == null) {
      _bannerList = [];
      bannerRepo.getBannerList().forEach((bannerModel) => _bannerList.add(bannerModel));
      _currentIndex = 0;
      notifyListeners();
    }
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
