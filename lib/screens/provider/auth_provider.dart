import 'package:flutter/foundation.dart';

class ScreensAuthProvider with ChangeNotifier {
  bool _isLoginThreeWidget = true;
  bool _isLoginTwoWidget = true;
  bool _isLoginOneWidget = true;

  bool get isLoginThreeWidget => _isLoginThreeWidget;
  bool get isLoginTwoWidget => _isLoginTwoWidget;
  bool get isLoginOneWidget => _isLoginOneWidget;

  changeLoginThreeWidgetCondition(bool value) {
    _isLoginThreeWidget = value;
    notifyListeners();
  }
  changeLoginTwoWidgetCondition(bool value) {
    _isLoginTwoWidget = value;
    notifyListeners();
  }
  changeLoginOneWidgetCondition(bool value) {
    _isLoginOneWidget = value;
    notifyListeners();
  }
}
