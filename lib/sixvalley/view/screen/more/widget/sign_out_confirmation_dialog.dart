import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/localization/language_constrants.dart';
import 'package:flutter_ui_kit/sixvalley/provider/auth_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/profile_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/auth/auth_screen.dart';
import 'package:provider/provider.dart';

class SixSignOutConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(mainAxisSize: MainAxisSize.min, children: [

        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE, vertical: 50),
          child: Text(getTranslated('want_to_sign_out', context), style: robotoBold, textAlign: TextAlign.center),
        ),

        Divider(height: 0, color: ColorResources.HINT_TEXT_COLOR),
        Row(children: [

          Expanded(child: InkWell(
            onTap: () {
              Provider.of<SixAuthProvider>(context, listen: false).clearSharedData().then((condition) {
                Navigator.pop(context);
                Provider.of<SixProfileProvider>(context,listen: false).clearHomeAddress();
                Provider.of<SixProfileProvider>(context,listen: false).clearOfficeAddress();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SixAuthScreen()), (route) => false);
              });
            },
            child: Container(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))),
              child: Text(getTranslated('YES', context), style: titilliumBold.copyWith(color: ColorResources.COLOR_PRIMARY)),
            ),
          )),

          Expanded(child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: ColorResources.RED, borderRadius: BorderRadius.only(bottomRight: Radius.circular(10))),
              child: Text(getTranslated('NO', context), style: titilliumBold.copyWith(color: ColorResources.WHITE)),
            ),
          )),

        ]),
      ]),
    );
  }
}
