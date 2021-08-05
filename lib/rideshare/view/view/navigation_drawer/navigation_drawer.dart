import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/all_app_screen.dart';
import 'package:flutter_ui_kit/rideshare/utility/colorResources.dart';
import 'package:flutter_ui_kit/rideshare/utility/dimensions.dart';
import 'package:flutter_ui_kit/rideshare/utility/strings.dart';
import 'package:flutter_ui_kit/rideshare/view/view/history/history_screen.dart';
import 'package:flutter_ui_kit/rideshare/view/view/home/rideshare_homescreen.dart';
import 'package:flutter_ui_kit/rideshare/view/view/notification/notification_screen.dart';
import 'package:flutter_ui_kit/rideshare/view/view/wallet/walletScreen.dart';
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
                Container(
                  decoration: BoxDecoration(border: Border.all(color: ColorResources.COLOR_WHITE), shape: BoxShape.circle),
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage:
                        NetworkImage('https://images.pexels.com/photos/2182970/pexels-photo-2182970.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                Text(
                  Strings.john_doe,
                  style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_WHITE, fontSize: 17),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                Text(
                  Strings.address_five,
                  style: poppinsRegular.copyWith(color: ColorResources.COLOR_WHITE.withOpacity(.7), fontSize: 13),
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
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => RideShareHomeScreen()));
              }),
          createDrawerBodyItem(
              imageUrl: 'assets/rideshare/images/menu_wallet.png',
              text: Strings.my_wallet,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => WalletScreen()));
              }),
          createDrawerBodyItem(
              imageUrl: 'assets/rideshare/images/clock.png',
              text: Strings.history,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => HistoryScreen()));
              }),
          createDrawerBodyItem(
              imageUrl: 'assets/rideshare/images/menu_notification.png',
              text: Strings.notification,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => RideShareNotificationScreen()));
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
