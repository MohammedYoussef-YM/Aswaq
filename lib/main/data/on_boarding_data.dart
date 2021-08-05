import 'package:flutter_ui_kit/academy/view/screen/onboarding/on_boarding_screen.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/onboarding/onboarding_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/onBorad/doctor_onboarding_screen.dart';
import 'package:flutter_ui_kit/driver_app/view/view/onboarding/driverapp_onboarding_screen.dart';
import 'package:flutter_ui_kit/food/screens/onBoard/food_onboarding_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/onboarding/grocery_onboarding_screen.dart';
import 'package:flutter_ui_kit/household_app/view/screens/splash_screen/splash_screen_one.dart';
import 'package:flutter_ui_kit/main/model/app_model.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/onboarding/onboarding_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/onboarding/onboarding_screen.dart';
import 'package:flutter_ui_kit/wallet/view/views/pixallet_onboarding_screen.dart';

import '../app.dart';

class OnBoardingData {
  static List<ScreenListModel> getOnBoardingList() {
    return [
      ScreenListModel(
        screenName: 'OnBoarding Screen 1',
        widget: DoctorOnBoardingScreen(),
      ),
      ScreenListModel(
        screenName: 'OnBoarding Screen 2',
        widget: FoodOnBoardScreen(),
      ),
      ScreenListModel(
        screenName: 'OnBoarding Screen 3',
        widget: GroceryOnBoardingScreen(),
      ),
      ScreenListModel(
        screenName: 'OnBoarding Screen 4',
        widget: PixalletOnBoardingScreen(),
      ),
      ScreenListModel(
        screenName: 'OnBoarding Screen 5',
        widget: DatingAppOnBoardingScreen(),
      ),
      ScreenListModel(
        screenName: 'OnBoarding Screen 6',
        widget: DriverAppOnboardingScreen(),
      ),
      ScreenListModel(
        screenName: 'OnBoarding Screen 7',
        widget: HouseHoldSplashScreenOne(),
      ),
      ScreenListModel(
        screenName: 'OnBoarding Screen 8',
        widget: AcademyOnBoardingScreen(),
      ),
      ScreenListModel(
        screenName: 'OnBoarding Screen 9',
        widget: RestOnBoardingScreen(),
        app: App.RESTAURANT,
      ),
      ScreenListModel(
        screenName: 'OnBoarding Screen 10',
        widget: SixOnBoardingScreen(),
        app: App.SIXVALLEY,
      ),
    ];
  }
}