import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/helper/utils.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/notification_item_widget.dart';

class DoctorNotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_HOME_BACKGROUND,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: Text(Strings.NOTIFICATION,style: khulaSemiBold.copyWith(color: ColorResources.COLOR_GREY, fontSize: 16)),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: 3,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(15, 15, 15, 50),
                itemBuilder: (context, index) {
                  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(height: 30),
                    Text(Utils.dateFormatStyle2(), style: khulaRegular.copyWith(color: ColorResources.COLOR_SILVER, fontSize: 12)),
                    SizedBox(height: 5),
                    NotificationItemWidget(),
                  ]);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
