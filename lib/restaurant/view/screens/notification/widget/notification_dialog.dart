import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/notification_model.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';

class NotificationDialog extends StatelessWidget {
  final NotificationModel notificationModel;
  NotificationDialog({@required this.notificationModel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 180,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 42),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 70, width: 70,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor.withOpacity(0.20)),
                  child: ClipOval(
                    child: FadeInImage.assetNetwork(
                        placeholder: Images.placeholder,
                        image: notificationModel.image,
                      height: 70, width: 70, fit: BoxFit.cover,)
                  ),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                Text(
                  notificationModel.description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(color: ColorResources.getGreyBunkerColor(context).withOpacity(.75), fontSize: Dimensions.FONT_SIZE_SMALL),
                )
              ],
            ),
          ),
          Positioned(
              right: -20,
              top: -10,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ))
        ],
      ),
    );
  }
}
