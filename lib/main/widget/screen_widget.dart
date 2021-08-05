import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/app_app_details_screen.dart';
import 'package:flutter_ui_kit/main/app.dart';
import 'package:flutter_ui_kit/main/model/app_model.dart';
import 'package:flutter_ui_kit/main/utils/custom_theme.dart';

class ScreenWidget extends StatelessWidget {
  final String screenName;
  final int numberOfScreens;
  final List<ScreenListModel> screenListModel;
  final bool isOpenModalButtonSheet;
  final App app;
  final bool isHomeScreen;

  ScreenWidget({this.screenName, this.isHomeScreen, this.numberOfScreens, this.screenListModel, this.isOpenModalButtonSheet = false, this.app = App.MAIN});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Provider.of<MainProvider>(context,listen: false).setThemeAndLocale(app, context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => AllAppDetailsScreen(
                  screenName: screenName,
                  screenlists: screenListModel,
                  isOpenModalButtonSheet: isOpenModalButtonSheet,
                )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 1),
              ),
            ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text( screenName,
              style: poppinsMedium.copyWith(color: Color(0xff566265),fontSize: 12),
            ),
            SizedBox(width: 10,),
            Row(
              children: [
                Text( numberOfScreens.toString(),
                  style: poppinsSemiBold.copyWith(color: Color(0xff5050D5),fontSize: 14),
                ),
                SizedBox(width: 8,),
                isHomeScreen ? SizedBox(): Icon(Icons.arrow_forward_ios,size: 12,color: Color(0xff000000),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}