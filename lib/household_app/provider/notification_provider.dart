import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/data/repository/notification_repo.dart';
import 'package:flutter_ui_kit/household_app/data/model/notification_model.dart';

class HouseNotificationProvider extends ChangeNotifier {
  final HouseNotificationRepo notificationRepo;
  HouseNotificationProvider({@required this.notificationRepo});

  List<NotificationModel> _newNotificationList = [];
  List<NotificationModel> _earlierNotificationList = [];
  List<NotificationModel> get newNotificationList => _newNotificationList;
  List<NotificationModel> get earlierNotificationList => _earlierNotificationList;

  void getNewNotifications() {
    _newNotificationList.clear();
    _newNotificationList.addAll(notificationRepo.getNewNotifications());
    notifyListeners();
  }

  void getEarlierNotifications() {
    _earlierNotificationList.clear();
    _earlierNotificationList.addAll(notificationRepo.getEarlierNotifications());
    notifyListeners();
  }
}