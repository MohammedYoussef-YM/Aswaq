import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/dating_app/provider/dattingapp_notification_provider.dart';
import 'package:flutter_ui_kit/dating_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/dating_app/utility/dating_image.dart';
import 'package:flutter_ui_kit/dating_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/strings.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<DattingAppNotificationProvider>(context, listen: false).initializeAllNotification();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 17, color: ColorResources.COLOR_GREY_GONDOLA),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          Strings.notification,
          style: robotoBold.copyWith(fontSize: 22, color: ColorResources.COLOR_GREY_GONDOLA),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Consumer<DattingAppNotificationProvider>(
        builder: (context, notification, child) => ListView.builder(
            itemCount: notification.notifications.length,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_LARGE, horizontal: Dimensions.PADDING_SIZE_LARGE),
            itemBuilder: (context, index) => Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50.0,
                            height: 50.0,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: FadeInImage.assetNetwork(
                                    placeholder: DatingImages.place_holder_dating,
                                    image: notification.notifications[index].imageUrl,fit: BoxFit.cover)
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      notification.notifications[index].name,
                                      style: robotoMedium.copyWith(color: ColorResources.COLOR_GREY, fontSize: Dimensions.FONT_SIZE_LARGE),
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        notification.notifications[index].statusMessage,
                                        style: robotoRegular.copyWith(color: ColorResources.COLOR_GREY, fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  notification.notifications[index].time,
                                  style: robotoRegular.copyWith(color: ColorResources.COLOR_GREY, fontSize: Dimensions.FONT_SIZE_SMALL),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Divider()
                    ],
                  ),
                )),
      ),
    );
  }
}
