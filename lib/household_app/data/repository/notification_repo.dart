import 'package:flutter_ui_kit/household_app/data/model/notification_model.dart';
import 'package:flutter_ui_kit/household_app/utility/images.dart';

class HouseNotificationRepo {

  List<NotificationModel> getNewNotifications() {
    List<NotificationModel> newNotificationList = [
      NotificationModel(Images.window_cleaning, 'Cleaner Service', 'complete the order', '9 minute ago.'),
      NotificationModel(Images.clean, 'Rob started', 'called you', '24 minutes ago.'),
      NotificationModel(Images.window_cleaning, 'Cleaner Service', 'complete the order', '45 minutes ago.'),
      NotificationModel(Images.clean, 'Rob started', 'called you', '45 minutes ago.'),
    ];
    return newNotificationList;
  }

  List<NotificationModel> getEarlierNotifications() {
    List<NotificationModel> earlierNotificationList = [
      NotificationModel(Images.window_cleaning, 'Washing Service', 'accept your order', '2 hours ago.'),
      NotificationModel(Images.clean, 'Rob', 'complete the service', '5 hours ago.'),
      NotificationModel(Images.window_cleaning, 'Washing Service', 'call you', '7 hours ago.'),
    ];
    return earlierNotificationList;
  }
}