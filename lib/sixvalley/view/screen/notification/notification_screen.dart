import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/helper/network_info.dart';
import 'package:flutter_ui_kit/sixvalley/localization/language_constrants.dart';
import 'package:flutter_ui_kit/sixvalley/provider/notification_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/custom_app_bar.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/no_internet_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class NotificationScreen extends StatelessWidget {
  final bool isBacButtonExist;
  NotificationScreen({this.isBacButtonExist = true});

  @override
  Widget build(BuildContext context) {
    Provider.of<SixNotificationProvider>(context, listen: false).initNotificationList();
    NetworkInfo.checkConnectivity(context);

    return Scaffold(
      body: Column(children: [

        CustomAppBar(title: getTranslated('notification', context), isBackButtonExist: isBacButtonExist),

        Expanded(child: NoInternetOrDataScreen(isNoInternet: false)),

        /*Padding(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          child: Row(children: [
            Container(
              height: 15,
              width: 15,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorResources.COLOR_PRIMARY,
                shape: BoxShape.circle,
              ),
              child: Text('3', style: titilliumSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL, color: ColorResources.WHITE)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
              child: VerticalDivider(width: 2, color: ColorResources.HINT_TEXT_COLOR),
            ),
            Text('Mark as Read', style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
          ]),
        ),

        Expanded(
          child: Consumer<NotificationProvider>(
            builder: (context, notification, child) {
              return notification.notificationList != null ? notification.notificationList.length != 0 ? ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: Provider.of<NotificationProvider>(context).notificationList.length,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
                    color: Provider.of<NotificationProvider>(context).notificationList[index].isSeen ? ColorResources.GREY : ColorResources.IMAGE_BG,
                    child: ListTile(
                      leading: CircleAvatar(child: Icon(Provider.of<NotificationProvider>(context).notificationList[index].icon)),
                      title: Text(Provider.of<NotificationProvider>(context).notificationList[index].message, style: titilliumRegular.copyWith(
                        fontSize: Dimensions.FONT_SIZE_SMALL,
                      )),
                      subtitle: Text(
                        DateFormat('hh:mm  dd/MM/yyyy').format(Provider.of<NotificationProvider>(context).notificationList[index].dateTime),
                        style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL, color: ColorResources.HINT_TEXT_COLOR),
                      ),
                    ),
                  );
                },
              ) : NoInternetOrDataScreen(isNoInternet: false) : NotificationShimmer();
            },
          ),
        ),*/

      ]),
    );
  }
}

class NotificationShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return Container(
          height: 80,
          margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
          color: ColorResources.GREY,
          alignment: Alignment.center,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            enabled: Provider.of<SixNotificationProvider>(context).notificationList.length == 0,
            child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.notifications)),
              title: Container(height: 20, color: ColorResources.WHITE),
              subtitle: Container(height: 10, width: 50, color: ColorResources.WHITE),
            ),
          ),
        );
      },
    );
  }
}

