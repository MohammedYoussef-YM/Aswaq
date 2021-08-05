import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/dating_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool isBackExist;
  CustomAppBar({@required this.title, this.isBackExist = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT),
      alignment: Alignment.center,
      child: Row(
        children: [
          isBackExist ? Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: ColorResources.COLOR_WHITE.withOpacity(.6), borderRadius: BorderRadius.circular(5)),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: ColorResources.COLOR_PRIMARY,
                size: 17,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ) : SizedBox(),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(right: 50),
            alignment: Alignment.center,
            child: Text(title, style: khulaSemiBold.copyWith(fontSize: 16, color: ColorResources.COLOR_GREY)),
          )),
        ],
      ),
    );
  }
}
