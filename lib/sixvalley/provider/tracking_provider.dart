import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/tracking_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/repository/tracking_repo.dart';

class SixTrackingProvider extends ChangeNotifier {
  final SixTrackingRepo trackingRepo;
  SixTrackingProvider({@required this.trackingRepo});

  TrackingModel _trackingModel;
  TrackingModel get trackingModel => _trackingModel;

  void initTrackingInfo(String orderID) async {
    _trackingModel = trackingRepo.getTrackingInfo();
    notifyListeners();
  }
}