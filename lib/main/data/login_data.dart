import 'package:flutter_ui_kit/academy/view/screen/auth/log_in_screen.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/auth/login_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/auth/doctor_signin_screen.dart';
import 'package:flutter_ui_kit/food/screens/auth/food_login_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/auth/grocery_login_screen.dart';
import 'package:flutter_ui_kit/household_app/view/screens/auth/phone_login_screen.dart';
import 'package:flutter_ui_kit/main/app.dart';
import 'package:flutter_ui_kit/main/model/app_model.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/auth/login_screen.dart';
import 'package:flutter_ui_kit/rideshare/view/view/auth/signin_screen.dart';
import 'package:flutter_ui_kit/screens/screen/auth/auth_one/login_screen_one.dart';
import 'package:flutter_ui_kit/screens/screen/auth/auth_three/login_screen_three.dart';
import 'package:flutter_ui_kit/screens/screen/auth/auth_two/login_screen_two.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/auth/auth_screen.dart';

class LoginData {
  static List<ScreenListModel> getLoginList() {
    return [
      ScreenListModel(
        screenName: 'SignIn Screen 1',
        widget: DoctorSignInScreen(),
      ),
      ScreenListModel(
        screenName: 'SignIn Screen 2',
        widget: FoodLoginScreen(),
      ),
      ScreenListModel(
        screenName: 'SignIn Screen 3',
        widget: GroceryLoginScreen(),
      ),
      ScreenListModel(
        screenName: 'SignIn Screen 4',
        widget: LoginScreenOne(),
      ),
      ScreenListModel(
        screenName: 'SignIn Screen 5',
        widget: LoginScreenTwo(),
      ),
      ScreenListModel(
        screenName: 'SignIn Screen 6',
        widget: LoginScreenThree(),
      ),
      ScreenListModel(
        screenName: 'SignIn Screen 7',
        widget: RideShareSignInScreen(),
      ),
      ScreenListModel(
        screenName: 'SignIn Screen 8',
        widget: DatingLoginScreen(),
      ),
      ScreenListModel(
        screenName: 'SignIn Screen 9',
        widget: PhoneLoginScreen(),
      ),
      ScreenListModel(
        screenName: 'SignIn Screen 10',
        widget: AcademyLogInScreen(),
      ),
      ScreenListModel(
        screenName: 'SignIn Screen 11',
        widget: RestLoginScreen(),
        app: App.RESTAURANT,
      ),
      ScreenListModel(
        screenName: 'SignIn Screen 12',
        widget: SixAuthScreen(initialPage: 0),
        app: App.SIXVALLEY,
      ),
    ];
  }
}