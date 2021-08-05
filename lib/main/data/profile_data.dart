import 'package:flutter_ui_kit/academy/view/screen/account/account_screen.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/profile/profile_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/doctor_settings_screen.dart';
import 'package:flutter_ui_kit/food/screens/dashboard/account_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/profile/grocery_profile_screen.dart';
import 'package:flutter_ui_kit/household_app/view/screens/profile/profile_screen.dart';
import 'package:flutter_ui_kit/main/app.dart';
import 'package:flutter_ui_kit/main/model/app_model.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/screens/profile/profile_screen.dart';
import 'package:flutter_ui_kit/screens/screen/profile/profile_screen_one.dart';
import 'package:flutter_ui_kit/screens/screen/profile/profile_screen_three.dart';
import 'package:flutter_ui_kit/screens/screen/profile/profile_screen_two.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/profile/profile_screen.dart';

class ProfileData{
  static List<ScreenListModel> getProfileList() {
    return [
      ScreenListModel(
        screenName: 'Profile Screen 1',
        widget: DoctorSettingsScreen(),
      ),
      ScreenListModel(
        screenName: 'Profile Screen 2',
        widget: GroceryProfileScreen(),
      ),
      ScreenListModel(
        screenName: 'Profile Screen 3',
        widget: ProfileScreenOne(),
      ),
      ScreenListModel(
        screenName: 'Profile Screen 4',
        widget: ProfileScreenTwo(),
      ),
      ScreenListModel(
        screenName: 'Profile Screen 5',
        widget: ProfileScreenThree(),
      ),
      ScreenListModel(
        screenName: 'Profile Screen 6',
        widget: AccountScreen(),
      ),
      ScreenListModel(
        screenName: 'Profile Screen 7',
        widget: DatingProfileScreen(),
      ),
      ScreenListModel(
        screenName: 'Profile Screen 8',
        widget: HouseProfileScreen(),
      ),
      ScreenListModel(
        screenName: 'Profile Screen 9',
        widget: AcademyAccountScreen(),
      ),
      ScreenListModel(
        screenName: 'Profile Screen 10',
        widget: SixProfileScreen(),
        app: App.SIXVALLEY,
      ),
      ScreenListModel(
        screenName: 'Profile Screen 11',
        widget: RestaurantDeliveryBoyProfileScreen(isFromAllAppScreen: true),
        app: App.RESTAURANT_DELIVERY_BOY,
      ),
    ];
  }
}