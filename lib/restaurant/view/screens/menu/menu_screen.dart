import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/app.dart';
import 'package:flutter_ui_kit/main/main_provider.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/profile_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/theme_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/address/address_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/chat/chat_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/coupon/coupon_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/language/choose_language_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/menu/widget/sign_out_confirmation_dialog.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  final Function onTap;
  MenuScreen({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Consumer<RestProfileProvider>(
          builder: (context, profileProvider, child) => Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: ColorResources.getPrimaryColor(context)),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: 80, width: 80,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: ColorResources.COLOR_WHITE, width: 2)),
                child: ClipOval(
                  child: FadeInImage.assetNetwork(
                    placeholder: Images.placeholder,
                    image: profileProvider.userInfoModel.image,
                      height: 80, width: 80, fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                '${profileProvider.userInfoModel.fName ?? ''} ${profileProvider.userInfoModel.lName ?? ''}',
                style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE, color: ColorResources.COLOR_WHITE),
              ),
              SizedBox(height: 10),
              Text('${profileProvider.userInfoModel.phone}', style: rubikRegular.copyWith(color: ColorResources.BACKGROUND_COLOR)),
            ]),
          ),
        ),
        Expanded(
          child: ListView(physics: BouncingScrollPhysics(), children: [
            SwitchListTile(
              value: Provider.of<RestThemeProvider>(context).darkTheme,
              onChanged: (bool isActive) {
                Provider.of<RestThemeProvider>(context, listen: false).toggleTheme();
                Provider.of<MainProvider>(context, listen: false).setThemeAndLocale(App.RESTAURANT, context);
              },
              title: Text(getTranslated('dark_theme', context), style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
              activeColor: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 30),
            ListTile(
              onTap: () => onTap(2),
              leading: Image.asset(Images.order, width: 20, height: 20, color: Theme.of(context).textTheme.bodyText1.color),
              title: Text(getTranslated('my_order', context), style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
            ),
            ListTile(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RestProfileScreen())),
              leading: Image.asset(Images.profile, width: 20, height: 20, color: Theme.of(context).textTheme.bodyText1.color),
              title: Text(getTranslated('profile', context), style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
            ),
            ListTile(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddressScreen())),
              leading: Image.asset(Images.location, width: 20, height: 20, color: Theme.of(context).textTheme.bodyText1.color),
              title: Text(getTranslated('address', context), style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
            ),
            ListTile(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen())),
              leading: Image.asset(Images.message, width: 20, height: 20, color: Theme.of(context).textTheme.bodyText1.color),
              title: Text(getTranslated('message', context), style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
            ),
            ListTile(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CouponScreen())),
              leading: Image.asset(Images.coupon, width: 20, height: 20, color: Theme.of(context).textTheme.bodyText1.color),
              title: Text(getTranslated('coupon', context), style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
            ),
            ListTile(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChooseLanguageScreen(fromMenu: true))),
              leading: Image.asset(Images.language, width: 20, height: 20, color: Theme.of(context).textTheme.bodyText1.color),
              title: Text(getTranslated('language', context), style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
            ),
            ListTile(
              onTap: () {
                showDialog(context: context, builder: (context) =>SignOutConfirmationDialog());
              },
              leading: Image.asset(Images.log_out, width: 20, height: 20, color: Theme.of(context).textTheme.bodyText1.color),
              title: Text(getTranslated('logout', context), style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
            ),
          ]),
        ),
      ]),
    );
  }
}
