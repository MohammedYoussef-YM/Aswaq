import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/provider/theme_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final isBackButtonExist;
  final IconData icon;
  final Function onActionPressed;

  CustomAppBar({@required this.title, this.isBackButtonExist = true, this.icon, this.onActionPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
        child: Image.asset(
          Images.toolbar_background, fit: BoxFit.fill,
          height: 50+MediaQuery.of(context).padding.top, width: MediaQuery.of(context).size.width,
          color: Provider.of<SixThemeProvider>(context).darkTheme ? Colors.black : null,
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        height: 50,
        alignment: Alignment.center,
        child: Row(children: [
          isBackButtonExist
              ? IconButton(
                  icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : SizedBox.shrink(),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
          Expanded(
            child: Text(
              title,
              style: titilliumRegular.copyWith(fontSize: 20, color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          icon != null
              ? IconButton(
                  icon: Icon(icon, size: Dimensions.ICON_SIZE_LARGE, color: Colors.white),
                  onPressed: onActionPressed,
                )
              : SizedBox.shrink(),
        ]),
      ),
    ]);
  }
}
