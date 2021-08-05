import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/notification_model.dart';
import 'package:flutter_ui_kit/restaurant/data/repository/notification_repo.dart';

class RestNotificationProvider extends ChangeNotifier {
  final RestNotificationRepo notificationRepo;
  RestNotificationProvider({@required this.notificationRepo});

  List<NotificationModel> _notificationList;
  List<NotificationModel> get notificationList => _notificationList;

  void initNotificationList() async {
    ApiResponse apiResponse = await notificationRepo.getNotificationList();
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _notificationList = [];
      apiResponse.response.data.forEach((notificationModel) => _notificationList.add(notificationModel));
      notifyListeners();
    } else {
      print(apiResponse.error.toString());
    }
  }
}
