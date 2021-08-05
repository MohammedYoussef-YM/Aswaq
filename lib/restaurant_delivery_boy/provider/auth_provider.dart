import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/repository/auth_repo.dart';

class RestaurantDeliveryBoyAuthProvider with ChangeNotifier {
  final RestaurantDeliveryBoyAuthRepo authRepo;

  RestaurantDeliveryBoyAuthProvider({@required this.authRepo});

  // for Remember Me Section

  bool _isActiveRememberMe = false;

  bool get isActiveRememberMe => _isActiveRememberMe;

  toggleRememberMe() {
    _isActiveRememberMe = !_isActiveRememberMe;
    notifyListeners();
  }

  Future<bool> clearSharedData() async {
    return await authRepo.clearSharedData();
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }

  String getUserEmail() {
    return authRepo.getUserEmail() ?? "";
  }

  String getUserPassword() {
    return authRepo.getUserPassword() ?? "";
  }

  Future<bool> clearUserEmailAndPassword() async {
    return authRepo.clearUserNumberAndPassword();
  }
}
