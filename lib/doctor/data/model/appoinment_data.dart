import 'package:flutter_ui_kit/doctor/data/model/apoinment_time.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';

class AppointmentData {
  static List<ApoinmentTime> morningData = [
    ApoinmentTime(
      time: Strings.TIME_9_00_AM,
      isActive: false
    ),
    ApoinmentTime(
      time: Strings.TIME_9_30_AM,
      isActive: false
    ),
    ApoinmentTime(
      time: Strings.TIME_10_00_AM,
      isActive: false
    ),
    ApoinmentTime(
      time: Strings.TIME_10_30_AM,
      isActive: false
    ),
    ApoinmentTime(
      time: Strings.TIME_11_00_AM,
      isActive: false
    ),
    ApoinmentTime(
      time: Strings.TIME_11_30_AM,
      isActive: false
    ),
  ];
  static List<ApoinmentTime> eveningData = [
    ApoinmentTime(
        time: Strings.TIME_9_00_PM,
        isActive: false
    ),
    ApoinmentTime(
        time: Strings.TIME_9_30_PM,
        isActive: false
    ),
    ApoinmentTime(
        time: Strings.TIME_10_00_PM,
        isActive: false
    ),
    ApoinmentTime(
        time: Strings.TIME_10_30_PM,
        isActive: false
    ),
    ApoinmentTime(
        time: Strings.TIME_11_00_PM,
        isActive: false
    ),
    ApoinmentTime(
        time: Strings.TIME_11_30_PM,
        isActive: false
    ),
  ];
}
