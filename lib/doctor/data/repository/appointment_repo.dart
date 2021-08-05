import 'package:flutter_ui_kit/doctor/data/model/appointment_model.dart';
import 'package:flutter_ui_kit/doctor/utility/images.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';

class AppointmentRepo {
  List<AppointmentModel> getAppointmentList() {
    List<AppointmentModel> appointmentList = [
      AppointmentModel(Images.doctor_one, Strings.DOCTOR_NAME1, 'Heart Surgeon, National heart care &\nNew Era Hospital',
          'Today-10 June, 2020', '10:00 AM-11:00 AM', '5'),
      AppointmentModel(Images.doctor_two, Strings.DOCTOR_NAME2, 'Heart Surgeon, National heart care &\nNew Era Hospital',
          'Tomorrow-11 June, 2020', '08:00 AM-09:00 AM', '8'),
      AppointmentModel(Images.doctor_three, Strings.DOCTOR_NAME3, 'Heart Surgeon, National heart care &\nNew Era Hospital',
          'Tomorrow-11 June, 2020', '08:00 AM-09:00 AM', '13'),
      AppointmentModel(Images.doctor_four, Strings.DOCTOR_NAME1, 'Heart Surgeon, National heart care &\nNew Era Hospital',
          'Today-10 June, 2020', '10:00 AM-11:00 AM', '5'),
      AppointmentModel(Images.doctor_one, Strings.DOCTOR_NAME2, 'Heart Surgeon, National heart care &\nNew Era Hospital',
          'Tomorrow-11 June, 2020', '08:00 AM-09:00 AM', '8'),
      AppointmentModel(Images.doctor_three, Strings.DOCTOR_NAME3, 'Heart Surgeon, National heart care &\nNew Era Hospital',
          'Tomorrow-11 June, 2020', '08:00 AM-09:00 AM', '13'),
    ];
    return appointmentList;
  }
}
