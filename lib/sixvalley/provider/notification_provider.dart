import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/notification_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/repository/notification_repo.dart';

class SixNotificationProvider extends ChangeNotifier {
  final SixNotificationRepo notificationRepo;

  SixNotificationProvider({@required this.notificationRepo});

  List<NotificationModel> _notificationList = [];

  List<NotificationModel> get notificationList => _notificationList;

  void initNotificationList() async {
    if (_notificationList.length == 0) {
      _notificationList.clear();
      _notificationList.addAll(notificationRepo.getNotificationList());
      notifyListeners();
    }
  }
}
