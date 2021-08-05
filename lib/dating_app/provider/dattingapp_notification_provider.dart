import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/dating_app/data/models/notification_model.dart';
import 'package:flutter_ui_kit/dating_app/data/repository/datingapp_notification_repo.dart';

class DattingAppNotificationProvider with ChangeNotifier {
  final DattingAppNotificationRepo notificationRepo;

  DattingAppNotificationProvider({@required this.notificationRepo});

  List<NotificationModel> _notifications = [];

  List<NotificationModel> get notifications => _notifications;

  initializeAllNotification() {
    if (_notifications.length == 0) {
      _notifications.clear();
      _notifications = notificationRepo.getAllNotification;
      notifyListeners();
    }
  }
}
