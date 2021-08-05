import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/data/model/appointment_model.dart';
import 'package:flutter_ui_kit/doctor/data/repository/appointment_repo.dart';

class AppointmentProvider extends ChangeNotifier {
  final AppointmentRepo appointmentRepo;
  AppointmentProvider({@required this.appointmentRepo});

  List<AppointmentModel> getAppointmentList() {
    return appointmentRepo.getAppointmentList();
  }
}