import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/data/repository/profile_repo.dart';

class ProfileProvider with ChangeNotifier {
  final ProfileRepo profileRepo;

  ProfileProvider({this.profileRepo});

  String _gender = '';

  String get gender => _gender;
  List<String> _genders = [];

  List<String> get genders => _genders;

  updateGender(String value) {
    _gender = value;
    notifyListeners();
  }

  void initializeGenders() {
    if (_genders.length == 0) {
      _genders.clear();
      _genders = profileRepo.getGender;
      _gender = profileRepo.getGender[0];
      notifyListeners();
    }
  }
}
