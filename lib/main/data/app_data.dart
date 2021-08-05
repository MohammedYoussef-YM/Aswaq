import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/view/screen/splash/splash_screen.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/onboarding/onboarding_screen.dart';
import 'package:flutter_ui_kit/doctor/view/views/splash/spash_screen.dart';
import 'package:flutter_ui_kit/driver_app/view/view/splash/driverapp_splash_screen.dart';
import 'package:flutter_ui_kit/food/screens/splash_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/onboarding/grocery_onboarding_screen.dart';
import 'package:flutter_ui_kit/household_app/view/screens/splash_screen/splash_screen_one.dart';
import 'package:flutter_ui_kit/main/app.dart';
import 'package:flutter_ui_kit/main/model/app_model.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/splash/splash_screen.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/screens/splash/splash_screen.dart';
import 'package:flutter_ui_kit/rideshare/view/view/splash/rideshare_splash_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/splash/splash_screen.dart';
import 'package:flutter_ui_kit/wallet/view/views/splash_screen.dart';

class AppData {

  static List<AppModel> getAppList() {
    return [
      AppModel(
        title: 'Restaurant',
        description: 'A restaurant ordering app',
        screens: 42,
        color: Color(0xFFFC6A57),
        widget: RestSplashScreen(),
        app: App.RESTAURANT,
        icons: MainAppImages.restaurant,
        version: '2.2',
        isHome:true,
      ),
      AppModel(
        title: 'Restaurant Delivery Boy',
        description: 'A restaurant Delivery Boy app',
        screens: 12,
        color: Color(0xFFFC6A57),
        widget: RestaurantDeliveryBoySplashScreen(),
        app: App.RESTAURANT_DELIVERY_BOY,
        icons: MainAppImages.restaurantDeliveryBoy,
        version: '2.1',
        isHome:true,
      ),
      AppModel(
        title: 'sixValley E-commerce',
        description: 'An e-commerce app',
        screens: 55,
        color: Color(0xFF2162B9),
        widget: SixSplashScreen(),
        app: App.SIXVALLEY,
        icons: MainAppImages.sixValley,
        version: '2.1',
        isHome:true,
      ),
      AppModel(
        title: 'DocTree',
        description: 'A doctor consulting app',
        screens: 35,
        color: Color(0xff0068DB),
        widget: DoctorSplashScreen(),
        app: App.DOCTOR,
        icons: MainAppImages.docTree,
        version: '1.0',
        isHome:true,
      ),
      AppModel(
          title: 'Pixallet',
          description: 'A digital wallet app',
          screens: 25,
          color: Color(0xff0068DB),
          widget: SplashScreenWallet(),
          app: App.PIXALLET,
          icons: MainAppImages.pixallet,
          version: '2.0',
          isHome:true,
      ),
      AppModel(
        title: 'E-Academy',
        description: 'An online based academy app',
        screens: 19,
        color: Color(0xFF2162B9),
        widget: AcademySplashScreen(),
        app: App.ACADEMY,
        icons: MainAppImages.eAcademy,
        version: '2.3',
        isHome:false,
      ),
      AppModel(
        title: 'House Hold',
        description: 'A House  app',
        screens: 18,
        color: Color(0xffE74459),
        widget: HouseHoldSplashScreenOne(),
        app: App.HOUSE_HOLD,
        icons: MainAppImages.houseHold,
        version: '1.4',
        isHome:false,
      ),
      AppModel(
        title: 'Dating App',
        description: 'A Dating and matcher app',
        screens: 15,
        color: Color(0xffE74459),
        widget: DatingAppOnBoardingScreen(),
        app: App.DATING,
        icons: MainAppImages.datingApp,
        version: '1.1',
        isHome:false,
      ),
      AppModel(
        title: 'Ride Share-Driver',
        description: 'Just click to go anywhere',
        screens: 16,
        color: Color(0xff65B903),
        widget: DriverAppSplashScreen(),
        app: App.RIDE_CLIENT,
        icons: MainAppImages.rideShareDriver,
        version: '2.2',
        isHome:false,
      ),
      AppModel(
        title: 'Ride share-Client',
        description: 'Share ride and earn money',
        screens: 20,
        color: Color(0xff65B903),
        widget: RideShareSplashScreen(),
        app: App.RIDE_DRIVER,
        icons: MainAppImages.rideShareClient,
        version: '3.0',
        isHome:false,
      ),


      AppModel(
        title: 'Food Mama',
        description: 'A food ordering app',
        screens: 20,
        color: Color(0xff4DBF49),
        widget: SplashScreen(),
        app: App.FOOD,
        icons: MainAppImages.foodMama,
        version: '1.0',
        isHome:false,
      ),
      AppModel(
        title: '6am Grocery',
        description: 'A Grocery ordering app',
        screens: 35,
        color: Color(0xff64B903),
        widget: GroceryOnBoardingScreen(),
        app: App.GROCERY,
        icons: MainAppImages.sixAmGrocery,
        version: '1.3',
        isHome:false,
      ),


    ];
  }
}