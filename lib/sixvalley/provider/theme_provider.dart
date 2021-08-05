import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/sixvalley/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SixThemeProvider with ChangeNotifier {
  final SharedPreferences sharedPreferences;
  SixThemeProvider({@required this.sharedPreferences}) {
    _loadCurrentTheme();
  }

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    sharedPreferences.setBool(SixAppConstants.THEME, _darkTheme);
    notifyListeners();
  }

  void _loadCurrentTheme() async {
    _darkTheme = sharedPreferences.getBool(SixAppConstants.THEME) ?? false;
    notifyListeners();
  }
}
