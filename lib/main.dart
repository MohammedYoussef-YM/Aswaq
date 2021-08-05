import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/provider/course_provider.dart';
import 'package:flutter_ui_kit/academy/provider/design_provider.dart';
import 'package:flutter_ui_kit/academy/provider/payment_provider.dart';
import 'package:flutter_ui_kit/academy/provider/wish_list_provider.dart';
import 'package:flutter_ui_kit/all_app_screen.dart';
import 'package:flutter_ui_kit/dating_app/provider/choice_provider.dart';
import 'package:flutter_ui_kit/dating_app/provider/dating_app_chat_Provider.dart';
import 'package:flutter_ui_kit/dating_app/provider/dating_app_home_provider.dart';
import 'package:flutter_ui_kit/dating_app/provider/dating_app_onboarding_provider.dart';
import 'package:flutter_ui_kit/dating_app/provider/dating_app_user_provider.dart';
import 'package:flutter_ui_kit/dating_app/provider/dattingapp_notification_provider.dart';
import 'package:flutter_ui_kit/dating_app/provider/profile_provider.dart';
import 'package:flutter_ui_kit/doctor/provider/auth_provider.dart';
import 'package:flutter_ui_kit/doctor/provider/onboarding_provider.dart';
import 'package:flutter_ui_kit/doctor/provider/profile_provider.dart';
import 'package:flutter_ui_kit/driver_app/provider/destination_provider.dart';
import 'package:flutter_ui_kit/driver_app/provider/driverapp_auth_provider.dart';
import 'package:flutter_ui_kit/driver_app/provider/driverapp_home_provider.dart';
import 'package:flutter_ui_kit/driver_app/provider/driverapp_onboarding_provider.dart';
import 'package:flutter_ui_kit/driver_app/provider/history_provider.dart';
import 'package:flutter_ui_kit/driver_app/provider/notification_provider.dart';
import 'package:flutter_ui_kit/driver_app/provider/payment_provider.dart';
import 'package:flutter_ui_kit/food/provider/home_provider.dart';
import 'package:flutter_ui_kit/food/screens/auth/food_login_screen.dart';
import 'package:flutter_ui_kit/food/screens/splash_screen.dart';
import 'package:flutter_ui_kit/grocery/provider/branch_provider.dart';
import 'package:flutter_ui_kit/grocery/provider/cart_provider.dart';
import 'package:flutter_ui_kit/grocery/provider/checkout_provider.dart';
import 'package:flutter_ui_kit/grocery/provider/choose_category_provider.dart';
import 'package:flutter_ui_kit/grocery/provider/favourite_provider.dart';
import 'package:flutter_ui_kit/grocery/provider/home_provider.dart';
import 'package:flutter_ui_kit/grocery/provider/onboarding_provider.dart';
import 'package:flutter_ui_kit/grocery/provider/payment_provider.dart';
import 'package:flutter_ui_kit/grocery/provider/product_provider.dart';
import 'package:flutter_ui_kit/grocery/provider/search_provider.dart';
import 'package:flutter_ui_kit/household_app/provider/cart_provider.dart';
import 'package:flutter_ui_kit/household_app/provider/house_home_provider.dart';
import 'package:flutter_ui_kit/household_app/provider/notification_provider.dart';
import 'package:flutter_ui_kit/household_app/provider/service_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/auth_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/banner_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/cart_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/category_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/chat_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/coupon_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/language_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/localization_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/location_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/notification_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/onboarding_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/order_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/product_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/profile_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/search_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/set_menu_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/theme_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/wishlist_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/auth_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/language_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/localization_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/location_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/order_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/profile_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/splash_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/theme_provider.dart';
import 'package:flutter_ui_kit/rideshare/provider/history_provider.dart';
import 'package:flutter_ui_kit/rideshare/provider/notification_provider.dart';
import 'package:flutter_ui_kit/rideshare/provider/rideshare_auth_provider.dart';
import 'package:flutter_ui_kit/rideshare/provider/rideshare_destination_provider.dart';
import 'package:flutter_ui_kit/rideshare/provider/rideshare_home_provider.dart';
import 'package:flutter_ui_kit/rideshare/provider/rideshare_onboarding_provider.dart';
import 'package:flutter_ui_kit/rideshare/provider/wallet_provider.dart';
import 'package:flutter_ui_kit/screens/provider/auth_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/auth_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/banner_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/brand_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/cart_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/category_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/chat_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/coupon_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/localization_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/mega_deal_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/notification_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/onboarding_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/order_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/product_details_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/product_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/profile_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/search_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/seller_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/splash_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/support_ticket_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/theme_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/tracking_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/wishlist_provider.dart';
import 'package:flutter_ui_kit/wallet/provider/gift_provider.dart';
import 'package:flutter_ui_kit/wallet/provider/goals_provider.dart';
import 'package:flutter_ui_kit/wallet/provider/organization_provider.dart';
import 'package:flutter_ui_kit/wallet/provider/promo_provider.dart';
import 'package:flutter_ui_kit/wallet/provider/step_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui_kit/main/main_provider.dart';
import 'di_container.dart' as di;
import 'doctor/provider/appointment_provider.dart';
import 'doctor/provider/chat_provider.dart';
import 'doctor/provider/contact_provider.dart';
import 'doctor/provider/faq_provider.dart';
import 'doctor/provider/membership_provider.dart';
import 'doctor/utility/route.dart';
import 'wallet/provider/charity_provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<MainProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<OnBoardingProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<OnboardingProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ProfileProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<MembershipProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ChatProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ContactProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<FaqProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<CharityProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<OrganizationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<GiftProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<GoalsProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<StepProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<PromoProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AppointmentProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<HomeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ChooseCategoryProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<GroceryHomeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ProductProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SearchProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<BranchProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<CartProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<CheckoutProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<FavouriteProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<PaymentProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ScreensAuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RideShareOnBoardingProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RideShareHomeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RideShareDestinationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RideShareAuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<DriveAppOnBoardingProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<DriverAppHomeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<DriverAppAuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<HistoryProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<NotificationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<WalletProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<DestinationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<DatingAppOnBoardingProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ChoiceProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<DatingAppHomeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<DatingAppUserProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<DatingAppChatProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ServiceProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<HouseHomeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<HouseNotificationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<HouseCartProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<CourseProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AcademyWishListProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AcademyPaymentProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AcademyDesignProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<DattingAppNotificationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<DatingAppProfileProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<DriverAppPaymentProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<DriverAppHistoryProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<DriverAppNotificationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixCategoryProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixMegaDealProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixBrandProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixProductProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixBannerProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixProductDetailsProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixOnBoardingProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixAuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixSearchProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixSellerProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixCouponProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixChatProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixOrderProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixNotificationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixProfileProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixWishListProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixSplashProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixCartProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixSupportTicketProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixTrackingProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixLocalizationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<SixThemeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestThemeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestLanguageProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestOnBoardingProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestCategoryProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestBannerProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestProductProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestAuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestLocationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestLocalizationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestCartProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestOrderProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestChatProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestSetMenuProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestProfileProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestNotificationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestCouponProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestWishListProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestSearchProvider>()),

      ChangeNotifierProvider(create: (context) => di.sl<RestaurantDeliveryBoyThemeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestaurantDeliveryBoySplashProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestaurantDeliveryBoyLanguageProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestaurantDeliveryBoyLocalizationProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestaurantDeliveryBoyAuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestaurantDeliveryBoyProfileProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestaurantDeliveryBoyOrderProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<RestaurantDeliveryBoyLocationProvider>()),
    ],
    child: FlutterUIKit(),
  ));
}

var routes = <String, WidgetBuilder>{
  ScreenRoute.SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
  ScreenRoute.LOGIN_SCREEN: (BuildContext context) => FoodLoginScreen(),
  ScreenRoute.ALL_SCREEN: (BuildContext context) => AllAppScreen(),
};

class FlutterUIKit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '6am UI Kit',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<MainProvider>(context).themeData,
      locale: Provider.of<MainProvider>(context).locale,
      localizationsDelegates: Provider.of<MainProvider>(context).delegates,
      supportedLocales: Provider.of<MainProvider>(context).supportedLocales,
      routes: routes,
      initialRoute: ScreenRoute.ALL_SCREEN,
      home: AllAppScreen(),
    );
  }
}
