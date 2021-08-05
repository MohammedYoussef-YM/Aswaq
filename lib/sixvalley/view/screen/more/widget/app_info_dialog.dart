import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/localization/language_constrants.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';

class SixAppInfoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(getTranslated('app_info', context), style: titilliumSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).accentColor,
                        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 7, offset: Offset(0, 1))],
                      ),
                      child: Icon(Icons.clear, size: 18, color: ColorResources.getYellow(context))),
                ),
              ],
            ),
            Divider(thickness: .1, color: ColorResources.COLOR_PRIMARY),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(getTranslated('VERSION_NAME', context), style: titilliumRegular),
                Text('547554', style: titilliumSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
              ],
            ),
            Divider(thickness: .1, color: ColorResources.COLOR_PRIMARY),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(getTranslated('RELEASE_DATE', context), style: titilliumRegular),
                Text('01 Jan 2021', style: titilliumSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
