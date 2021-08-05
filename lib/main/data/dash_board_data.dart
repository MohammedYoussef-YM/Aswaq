import 'package:flutter_ui_kit/academy/view/screen/home/academy_home_screen.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/home/datingapp_home_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/doctor_home_screen.dart';
import 'package:flutter_ui_kit/driver_app/view/view/home/driverapp_homescreen.dart';
import 'package:flutter_ui_kit/food/screens/dashboard/food_home_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/home/grocery_home_screen.dart';
import 'package:flutter_ui_kit/household_app/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_ui_kit/main/app.dart';
import 'package:flutter_ui_kit/main/model/app_model.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/dashboard/dashboard_screen.dart';
import 'package:flutter_ui_kit/wallet/view/views/home_screen.dart';

class DashBoardData {
  static List<ScreenListModel> getDashBoardList() {
    return [
      ScreenListModel(
        screenName: 'DashBoard Screen 1',
        widget: DoctorHomeScreen(),
      ),
      ScreenListModel(
        screenName: 'DashBoard Screen 2',
        widget: FoodHomeScreen(),
      ),
      ScreenListModel(
        screenName: 'DashBoard Screen 3',
        widget: GroceryHomeScreen(),
      ),
      ScreenListModel(
        screenName: 'DashBoard Screen 4',
        widget: PixalletHomeScreen(),
      ),
      ScreenListModel(
        screenName: 'DashBoard Screen 5',
        widget: DatingAppHomeScreen(),
      ),
      ScreenListModel(
        screenName: 'DashBoard Screen 6',
        widget: DriverAppHomeScreen(),
      ),
      ScreenListModel(
        screenName: 'DashBoard Screen 7',
        widget: HouseDashboardScreen(),
      ),
      ScreenListModel(
        screenName: 'DashBoard Screen 8',
        widget: AcademyHomeScreen(),
      ),
      ScreenListModel(
        screenName: 'DashBoard Screen 9',
        widget: RestDashboardScreen(),
        app: App.RESTAURANT,
      ),
      ScreenListModel(
        screenName: 'DashBoard Screen 10',
        widget: SixDashBoardScreen(),
        app: App.SIXVALLEY,
      ),
      ScreenListModel(
        screenName: 'DashBoard Screen 11',
        widget: RestaurantDeliveryBoyDashboardScreen(),
        app: App.RESTAURANT_DELIVERY_BOY,
      ),
    ];
  }
}