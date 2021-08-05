import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/repository/mega_deal_repo.dart';

class SixMegaDealProvider extends ChangeNotifier {
  final SixMegaDealRepo megaDealRepo;
  SixMegaDealProvider({@required this.megaDealRepo});

  List<Product> _megaDealList = [];
  Duration _duration;
  List<Product> get megaDealList => _megaDealList;
  Duration get duration => _duration;

  void initMegaDealList() async {
    if (_megaDealList.length == 0) {
      _duration = Duration(days: 730);
      Timer.periodic(Duration(seconds: 1), (timer) {
        _duration = _duration - Duration(seconds: 1);
        notifyListeners();
      });

      _megaDealList.clear();
      megaDealRepo.getMegaDealList().forEach((flashDeal) => _megaDealList.add(flashDeal));
      notifyListeners();
    }
  }
}
