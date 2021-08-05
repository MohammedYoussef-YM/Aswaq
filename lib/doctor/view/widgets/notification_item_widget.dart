import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';

class NotificationItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: ColorResources.COLOR_WHITE,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NotificationItem(imageUrl: 'assets/doctor/Icon/notification blue.png', title: Strings.SERIAL_REMINDER, content: Strings.LOREM__ALIQUA),
          Divider(height: 10, color: ColorResources.COLOR_GREY),
          NotificationItem(imageUrl: 'assets/doctor/Icon/time 2.png', title: Strings.APPOINTMENT_REMINDER, content: Strings.LOREM__ALIQUA),
          Divider(height: 10, color: ColorResources.COLOR_GREY),
          NotificationItem(imageUrl: 'assets/doctor/Icon/payment blue.png', title: Strings.PAYMENT_COMFIRMATION, content: Strings.LOREM__ALIQUA),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String content;
  NotificationItem({@required this.imageUrl, @required this.title, @required this.content});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Container(
          width: 50,
          height: 50,
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: ColorResources.COLOR_MAYA_BLUE.withOpacity(.14),
              borderRadius: BorderRadius.circular(15)),
          child: Image.asset(imageUrl),
        ),
        title: Text(title,style: khulaSemiBold.copyWith(color: ColorResources.COLOR_GREY, fontSize: 16)),
        subtitle: Text(content,style: khulaRegular.copyWith(color: ColorResources.COLOR_GREY, fontSize: 12)),
    );
  }
}

