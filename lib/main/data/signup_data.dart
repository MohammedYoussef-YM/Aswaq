import 'package:flutter_ui_kit/academy/view/screen/auth/register_screen.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/auth/signup_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/auth/doctor_signup_screen.dart';
import 'package:flutter_ui_kit/driver_app/view/view/auth/create_account_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/auth/grocery_signup_screen.dart';
import 'package:flutter_ui_kit/main/app.dart';
import 'package:flutter_ui_kit/main/model/app_model.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/auth/create_account_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/auth/signup_screen.dart';
import 'package:flutter_ui_kit/screens/screen/auth/auth_one/signup_screen_one.dart';
import 'package:flutter_ui_kit/wallet/view/views/step/step_one_screen.dart';

class SignUpData {
  static List<ScreenListModel> getSignUpList() {
    return [
      ScreenListModel(
        screenName: 'SignUp Screen 1',
        widget: DoctorSignUpScreen(),
      ),
      ScreenListModel(
        screenName: 'SignUp Screen 2',
        widget: GrocerySignUpScreen(),
      ),
      ScreenListModel(
        screenName: 'SignUp Screen 3',
        widget: SignUpScreenOne(),
      ),
      ScreenListModel(
        screenName: 'SignUp Screen 4',
        widget: StepOneScreen(),
      ),
      ScreenListModel(
        screenName: 'SignUp Screen 5',
        widget: DatingSignUpScreen(),
      ),
      ScreenListModel(
        screenName: 'SignUp Screen 6',
        widget: CreateAccountScreen(),
        app: App.RESTAURANT,
      ),
      ScreenListModel(
        screenName: 'SignUp Screen 7',
        widget: DriverCreateAccountScreen(),
      ),
      ScreenListModel(
        screenName: 'SignUp Screen 8',
        widget: AcademyRegisterScreen(),
      ),
      ScreenListModel(
        screenName: 'SignUp Screen 9',
        widget: RestSignUpScreen(),
        app: App.RESTAURANT,
      ),
    ];
  }
}