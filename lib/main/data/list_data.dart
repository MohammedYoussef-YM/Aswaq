import 'package:flutter_ui_kit/academy/view/screen/mycourses/my_courses_screen.dart';
import 'package:flutter_ui_kit/academy/view/screen/wishlist/wish_list_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/choose_topics/choose_topics_screen.dart';
import 'package:flutter_ui_kit/main/app.dart';
import 'package:flutter_ui_kit/main/model/app_model.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/notification/notification_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/order/order_screen.dart';
import 'package:flutter_ui_kit/rideshare/view/view/notification/notification_screen.dart';
import 'package:flutter_ui_kit/wallet/view/views/charity_screen.dart';
import 'package:flutter_ui_kit/wallet/view/views/e_shopping_screen.dart';
import 'package:flutter_ui_kit/wallet/view/views/gift_screen.dart';
import 'package:flutter_ui_kit/wallet/view/views/insight_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/brand/all_brand_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/search/search_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/search/search_screen_two.dart';
import 'package:flutter_ui_kit/household_app/view/screens/notification/notification_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/appointment_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/doctor_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/faq_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/favourite_doctors.dart';
import 'package:flutter_ui_kit/doctor/view/views/invite_a_friend_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/membership_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/my_appointments.dart';
import 'package:flutter_ui_kit/doctor/view/views/notification_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/cart/grocery_cart_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/category/category_screen.dart';

class ListData {
  static List<ScreenListModel> getList() {
    return [
      ScreenListModel(
        screenName: 'List Screen 1',
        widget: MyAppointments(),
      ),
      ScreenListModel(
        screenName: 'List Screen 2',
        widget: DoctorScreen(),
      ),
      ScreenListModel(
        screenName: 'List Screen 3',
        widget: DoctorNotificationScreen(),
      ),
      ScreenListModel(
        screenName: 'List Screen 4',
        widget: MemberShipScreen(),
      ),
      ScreenListModel(
        screenName: 'List Screen 5',
        widget: InviteAFriendScreen(),
      ),
      ScreenListModel(
        screenName: 'List Screen 6',
        widget: FavouriteDoctors(),
      ),
      ScreenListModel(
        screenName: 'List Screen 7',
        widget: FAQScreen(),
      ),
      ScreenListModel(
        screenName: 'List Screen 8',
        widget: AppointmentsScreen(),
      ),
      ScreenListModel(
        screenName: 'List Screen 9',
        widget: EShoppingScreen(),
      ),
      ScreenListModel(
        screenName: 'List Screen 10',
        widget: GiftScreen(),
      ),
      ScreenListModel(
        screenName: 'List Screen 11',
        widget: CharityScreen(),
      ),
      ScreenListModel(
        screenName: 'List Screen 12',
        widget: InsightScreen(),
      ),
      ScreenListModel(
        screenName: 'List Screen 13',
        widget: ChooseTopicsScreen(),
      ),
      ScreenListModel(
        screenName: 'List Screen 14',
        widget: GroceryCartScreen(),
      ),
      ScreenListModel(
        screenName: 'List Screen 15',
        widget: GrocerySearchScreen(),
      ),
      ScreenListModel(
        screenName: 'List Screen 16',
        widget: SearchScreenTwo(),
      ),
      ScreenListModel(
        screenName: 'List Screen 17',
        widget: GroceryCategoryScreen(
          categoryName: 'Grocery',
        ),
      ),
      ScreenListModel(
        screenName: 'List Screen 18',
        widget: RideShareNotificationScreen(),
      ),
      ScreenListModel(
        screenName: 'List Screen 19',
        widget: HouseNotificationScreen(),
      ),
      ScreenListModel(
        screenName: 'List Screen 20',
        widget: AcademyWishListScreen(),
      ),
      ScreenListModel(
        screenName: 'List Screen 21',
        widget: MyCoursesScreen(),
      ),
      ScreenListModel(
        screenName: 'List Screen 22',
        widget: RestNotificationScreen(),
        app: App.RESTAURANT,
      ),
      ScreenListModel(
        screenName: 'List Screen 23',
        widget: RestOrderScreen(),
        app: App.RESTAURANT,
      ),
      ScreenListModel(
        screenName: 'List Screen 24',
        widget: SixAllBrandScreen(),
        app: App.SIXVALLEY,
      ),
    ];
  }
}