import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/all_app_screen.dart';
import 'package:flutter_ui_kit/driver_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/driver_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/driver_app/utility/strings.dart';
import 'package:flutter_ui_kit/driver_app/view/view/history/history_screen.dart';
import 'package:flutter_ui_kit/driver_app/view/view/home/driverapp_homescreen.dart';
import 'package:flutter_ui_kit/driver_app/view/view/notification/notification_screen.dart';
import 'package:flutter_ui_kit/driver_app/view/view/wallet/walletScreen.dart';
import 'package:flutter_ui_kit/rideshare/utility/images.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';

class NavigationDrawer extends StatelessWidget {
  Widget createDrawerHeader(BuildContext context) {
    return Container(
        height: 274,
        margin: EdgeInsets.zero,
        alignment: Alignment.center,
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        decoration: BoxDecoration(color: ColorResources.COLOR_PRIMARY),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.only(top: 30),
                alignment: Alignment.centerRight,
                child: Image.asset(
                  'assets/rideshare/images/close.png',
                  color: ColorResources.COLOR_WHITE,
                ),
              ),
            ),
            SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: FadeInImage.assetNetwork(placeholder: Images.place_holder, image: Images.person_one, width: 80, height: 80, fit: BoxFit.fill)),
                SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                Text(
                  Strings.hohn_doe,
                  style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_WHITE, fontSize: 17),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                Text(
                  Strings.address_four,
                  style: poppinsRegular.copyWith(color: ColorResources.COLOR_WHITE, fontSize: 13),
                ),
              ],
            ),
          ],
        ));
  }

  Widget createDrawerBodyItem({String imageUrl, String text, GestureTapCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        child: Row(
          children: [
            Image.asset(
              imageUrl,
              color: ColorResources.COLOR_PRIMARY,
              width: 19,
              height: 20,
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
            Text(
              text,
              style: poppinsSemiBold.copyWith(fontSize: 15, color: ColorResources.COLOR_GRAY_SIMPLE),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(context),
          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
          createDrawerBodyItem(
              imageUrl: 'assets/rideshare/images/menu_home.png',
              text: Strings.home,
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => DriverAppHomeScreen()));
              }),
          createDrawerBodyItem(
              imageUrl: 'assets/rideshare/images/menu_wallet.png',
              text: Strings.my_wallet,
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => DriverAppWalletScreen()));
              }),
          createDrawerBodyItem(
              imageUrl: 'assets/rideshare/images/clock.png',
              text: Strings.history,
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => DriverAppHistoryScreen()));
              }),
          createDrawerBodyItem(
              imageUrl: 'assets/rideshare/images/menu_notification.png',
              text: Strings.notification,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => DriverAppNotificationScreen()));
              }),
          SizedBox(height: 80),
          createDrawerBodyItem(
              imageUrl: 'assets/rideshare/images/menu_logout.png',
              text: Strings.logout,
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => AllAppScreen()));
              }),
        ],
      ),
    );
  }
}
