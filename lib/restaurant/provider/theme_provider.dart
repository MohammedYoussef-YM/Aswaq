import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/restaurant/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestThemeProvider with ChangeNotifier {
  final SharedPreferences sharedPreferences;
  RestThemeProvider({@required this.sharedPreferences}) {
    _loadCurrentTheme();
  }

  bool _darkTheme = true;
  bool get darkTheme => _darkTheme;

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    sharedPreferences.setBool(RestAppConstants.THEME, _darkTheme);
    notifyListeners();
  }

  void _loadCurrentTheme() async {
    _darkTheme = sharedPreferences.getBool(RestAppConstants.THEME) ?? false;
    notifyListeners();
  }
}
