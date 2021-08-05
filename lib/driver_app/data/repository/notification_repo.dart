import 'package:flutter_ui_kit/driver_app/data/model/notification_model.dart';
import 'package:flutter_ui_kit/rideshare/utility/images.dart';
import 'package:flutter_ui_kit/rideshare/utility/strings.dart';

class DriverAppNotificationRepo {
  List<NotificationModel> getAllNotifications = [
    NotificationModel(name: Strings.name_one, imageUrl: Images.person_one, time: Strings.time_one),
    NotificationModel(name: Strings.name_two, imageUrl: Images.person_two, time: Strings.time_two),
    NotificationModel(name: Strings.name_three, imageUrl: Images.person_three, time: Strings.time_three),
    NotificationModel(name: Strings.name_four, imageUrl: Images.person_five, time: Strings.time_four),
    NotificationModel(name: Strings.name_one, imageUrl: Images.person_four, time: Strings.time_one),
    NotificationModel(name: Strings.name_two, imageUrl: Images.person_six, time: Strings.time_two),
    NotificationModel(name: Strings.name_three, imageUrl: Images.person_seven, time: Strings.time_three),
    NotificationModel(name: Strings.name_four, imageUrl: Images.person_eight, time: Strings.time_four),
    NotificationModel(name: Strings.name_one, imageUrl: Images.person_nine, time: Strings.time_one),
    NotificationModel(name: Strings.name_two, imageUrl: Images.person_one, time: Strings.time_two),
    NotificationModel(name: Strings.name_three, imageUrl: Images.person_three, time: Strings.time_three),
    NotificationModel(name: Strings.name_four, imageUrl: Images.person_four, time: Strings.time_four),
  ];
}
