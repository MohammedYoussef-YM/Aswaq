import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/rideshare/provider/notification_provider.dart';
import 'package:flutter_ui_kit/rideshare/utility/colorResources.dart';
import 'package:flutter_ui_kit/rideshare/utility/dimensions.dart';
import 'package:flutter_ui_kit/rideshare/utility/images.dart';
import 'package:flutter_ui_kit/rideshare/utility/strings.dart';
import 'package:provider/provider.dart';

class RideShareNotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<NotificationProvider>(context, listen: false).initializeNotifications();
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          Strings.notification,
          style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE, fontSize: Dimensions.FONT_SIZE_LARGE),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: ColorResources.COLOR_GRAY_SIMPLE),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: ColorResources.COLOR_WHITE,
      ),
      body: Consumer<NotificationProvider>(
        builder: (context, notificationProvider, child) => ListView.builder(
            itemCount: notificationProvider.notificationModels.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(
                        left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT, bottom: Dimensions.PADDING_SIZE_DEFAULT),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      notificationProvider.notificationModels[index].name,
                                      style: poppinsRegular.copyWith(fontSize: 15, color: ColorResources.COLOR_GRAY_DEEP),
                                    ),
                                    SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                                    Text(
                                      Strings.confirmed_your,
                                      style: poppinsRegular.copyWith(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Text(
                                  Strings.booking_request,
                                  style: poppinsRegular.copyWith(fontSize: 15),
                                ),
                              ],
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_LARGE),
                              child: FadeInImage.assetNetwork(
                                placeholder: Images.place_holder,
                                image: notificationProvider.notificationModels[index].imageUrl,
                                width: 48,
                                height: 48,
                                fit: BoxFit.fill,),
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                        Row(
                          children: [
                            Icon(Icons.access_time_sharp,size: 18,color: ColorResources.COLOR_GRAY_LIGHT.withOpacity(.4)),

                            SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                            Text(
                              '${notificationProvider.notificationModels[index].time} am',
                              style: poppinsRegular.copyWith(fontSize: 13),
                            )
                          ],
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                        Container(height: 1, color: ColorResources.COLOR_GRAY.withOpacity(.2)),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
