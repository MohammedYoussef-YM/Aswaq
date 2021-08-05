import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/rideshare/data/model/notification_model.dart';
import 'package:flutter_ui_kit/rideshare/data/repository/notification_repo.dart';

class NotificationProvider with ChangeNotifier {
  final NotificationRepo notificationRepo;

  NotificationProvider({@required this.notificationRepo});

  List<NotificationModel> _notificationModels = [];

  List<NotificationModel> get notificationModels => _notificationModels;

  initializeNotifications() {
    if (_notificationModels.length == 0) {
      _notificationModels.clear();
      _notificationModels = notificationRepo.getAllNotifications;
      notifyListeners();
    }
  }
}
