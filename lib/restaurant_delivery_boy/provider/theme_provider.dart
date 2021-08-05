import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantDeliveryBoyThemeProvider with ChangeNotifier {
  final SharedPreferences sharedPreferences;

  RestaurantDeliveryBoyThemeProvider({@required this.sharedPreferences}) {
    _loadCurrentTheme();
  }

  bool _darkTheme = true;

  bool get darkTheme => _darkTheme;

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    sharedPreferences.setBool(RestaurantDeliveryBoyAppConstants.THEME, _darkTheme);
    notifyListeners();
  }

  void removeCurrentThemeData() {
    sharedPreferences.remove(RestaurantDeliveryBoyAppConstants.THEME);
    notifyListeners();
  }

  void _loadCurrentTheme() async {
    _darkTheme = sharedPreferences.getBool(RestaurantDeliveryBoyAppConstants.THEME) ?? false;
    notifyListeners();
  }
}
