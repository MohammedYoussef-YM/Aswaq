import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/body/login_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/body/register_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/repository/auth_repo.dart';

class SixAuthProvider with ChangeNotifier {
  final SixAuthRepo authRepo;

  SixAuthProvider({@required this.authRepo});
  bool _isRemember = false;
  int _selectedIndex = 0;
  int get selectedIndex =>_selectedIndex;

  updateSelectedIndex(int index){
    _selectedIndex = index;
    notifyListeners();
  }

  bool get isRemember => _isRemember;

  void updateRemember(bool value) {
    _isRemember = value;
    notifyListeners();
  }

  Future registration(RegisterModel register) async {
    authRepo.saveUserToken('token');
  }

  Future login(LoginModel loginBody) async {
    authRepo.saveUserToken('token');
  }

  // for user Section
  String getUserToken() {
    return authRepo.getUserToken();
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  Future<bool> clearSharedData() async {
    return await authRepo.clearSharedData();
  }

  // for  Remember Email
  void saveUserEmail(String email, String password) {
    authRepo.saveUserEmailAndPassword(email, password);
  }

  String getUserEmail() {
    return authRepo.getUserEmail() ?? "";
  }

  Future<bool> clearUserEmailAndPassword() async {
    return authRepo.clearUserEmailAndPassword();
  }


  String getUserPassword() {
    return authRepo.getUserPassword() ?? "";
  }
}
