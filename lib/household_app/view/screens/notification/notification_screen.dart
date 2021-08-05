import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/provider/notification_provider.dart';
import 'package:flutter_ui_kit/household_app/view/screens/notification/widget/notification_widget.dart';
import 'package:provider/provider.dart';

class HouseNotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<HouseNotificationProvider>(context, listen: false).getNewNotifications();
    Provider.of<HouseNotificationProvider>(context, listen: false).getEarlierNotifications();

    return Scaffold(
      backgroundColor: HouseHoldColorResources.COLOR_SOLITUDE,
      appBar: AppBar(
        title: Text(Strings.notification, style: manropeMedium.copyWith(
          color: HouseHoldColorResources.COLOR_WHITE,
          fontSize: HouseHoldDimensions.FONT_SIZE_LARGE,
        )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: HouseHoldColorResources.COLOR_WHITE, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: HouseHoldColorResources.COLOR_PRIMARY,
      ),
      body: Consumer<HouseNotificationProvider>(
        builder: (context, notification, child) {
          return ListView(children: [

            Padding(
              padding: EdgeInsets.only(top: HouseHoldDimensions.PADDING_SIZE_LARGE, left: HouseHoldDimensions.PADDING_SIZE_LARGE),
              child: Text(Strings.neew, style: manropeRegular),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: HouseHoldDimensions.PADDING_SIZE_SMALL),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: HouseHoldColorResources.COLOR_WHITE),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: notification.newNotificationList.length,
                itemBuilder: (context, index) {
                  return NotificationWidget(
                    notificationModel: notification.newNotificationList[index],
                    hasDivider: index != notification.newNotificationList.length-1,
                  );
                },
              ),
            ),

            Divider(height: 40),

            Padding(
              padding: EdgeInsets.only(left: HouseHoldDimensions.PADDING_SIZE_LARGE),
              child: Text(Strings.earlier, style: manropeRegular),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: HouseHoldDimensions.PADDING_SIZE_SMALL),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: HouseHoldColorResources.COLOR_WHITE),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: notification.earlierNotificationList.length,
                itemBuilder: (context, index) {
                  return NotificationWidget(
                    notificationModel: notification.earlierNotificationList[index],
                    hasDivider: index != notification.earlierNotificationList.length-1,
                  );
                },
              ),
            ),

          ]);
        },
      ),
    );
  }
}
