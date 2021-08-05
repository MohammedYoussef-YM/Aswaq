import 'package:flutter_ui_kit/doctor/view/views/about_doctor_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/online_appointments_screen.dart';
import 'package:flutter_ui_kit/grocery/data/models/product.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/view/views/detail_meal/detail_meal_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/product_details/product_details_screen.dart';
import 'package:flutter_ui_kit/main/app.dart';
import 'package:flutter_ui_kit/main/model/app_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/repository/product_repo.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/product/product_details_screen.dart';

class DetailsData {
  static List<ScreenListModel> getDetailsList() {
    return [
      ScreenListModel(
        screenName: 'Details Screen 1',
        widget: AboutDoctorScreen(),
      ),
      ScreenListModel(
        screenName: 'Details Screen 2',
        widget: OnlineAppointmentsScreen(),
      ),
      ScreenListModel(
        screenName: 'Details Screen 3',
        widget: ProductDetailsScreen(
          product: GroceryProduct(
            imageUrl: 'assets/grocery/products/pineapple.png',
            isFabourite: false,
            name: Strings.pineapple,
            runningPrice: Strings.doller_49_125,
            rating: Strings.ratting_4_9,
            quantity: Strings.one_pics_box,
            id: 11,
            previoudPrice: Strings.doller_580,
            off: Strings.five_percent_off,
            count: 1,
          ),
        ),
      ),
      ScreenListModel(
        screenName: 'Details Screen 4',
        widget: DetailMealScreen(),
      ),
      ScreenListModel(
        screenName: 'Details Screen 5',
        widget: SixProductDetails(product: SixProductRepo().getLatestProductList()[0]),
        app: App.SIXVALLEY,
      ),
    ];
  }
}