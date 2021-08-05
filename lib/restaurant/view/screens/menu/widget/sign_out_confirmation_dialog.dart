import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/auth/login_screen.dart';

class SignOutConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(mainAxisSize: MainAxisSize.min, children: [

        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE, vertical: 50),
          child: Text(getTranslated('want_to_sign_out', context), style: rubikBold, textAlign: TextAlign.center),
        ),

        Divider(height: 0, color: ColorResources.getHintColor(context)),
        Row(children: [

          Expanded(child: InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => RestLoginScreen()), (route) => false);
            },
            child: Container(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))),
              child: Text(getTranslated('yes', context), style: rubikBold.copyWith(color: ColorResources.COLOR_PRIMARY)),
            ),
          )),

          Expanded(child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: ColorResources.getPrimaryColor(context), borderRadius: BorderRadius.only(bottomRight: Radius.circular(10))),
              child: Text(getTranslated('no', context), style: rubikBold.copyWith(color: Colors.white)),
            ),
          )),

        ]),
      ]),
    );
  }
}
