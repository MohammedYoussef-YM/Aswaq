import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/data/model/notification_model.dart';
import 'package:flutter_ui_kit/household_app/utility/images.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';

class NotificationWidget extends StatelessWidget {
  final NotificationModel notificationModel;
  final bool hasDivider;
  NotificationWidget({@required this.notificationModel, @required this.hasDivider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: ClipOval(
            child: FadeInImage.assetNetwork(placeholder: Images.place_holder, image: notificationModel.image, width: 45, height: 45, fit: BoxFit.cover),
          ),
          title: Row(children: [
            Text(notificationModel.title, style: manropeRegular),
            SizedBox(width: 5),
            Text(notificationModel.status, style: manropeLight, maxLines: 1, overflow: TextOverflow.ellipsis),
          ]),
          subtitle: Text(notificationModel.time, style: manropeRegular.copyWith(
            fontSize: 8, color: HouseHoldColorResources.COLOR_BLACK.withOpacity(0.6),
          )),
        ),
        hasDivider ? Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Divider()) : SizedBox(),
      ],
    );
  }
}
