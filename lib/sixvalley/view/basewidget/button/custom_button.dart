import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/provider/theme_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  CustomButton({this.onTap, @required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0),
      ),
      onPressed: onTap,
      child: Container(
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorResources.getChatIcon(context),
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 7, offset: Offset(0, 1)), // changes position of shadow
            ],
            gradient: Provider.of<SixThemeProvider>(context).darkTheme ? null : LinearGradient(colors: [
              Theme.of(context).primaryColor,
              ColorResources.getBlue(context),
              ColorResources.getBlue(context),
            ]),
            borderRadius: BorderRadius.circular(10)),
        child: Text(buttonText,
            style: titilliumSemiBold.copyWith(
              fontSize: 16,
              color: Theme.of(context).accentColor,
            )),
      ),
    );
  }
}
