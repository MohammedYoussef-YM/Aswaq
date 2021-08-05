import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/localization/language_constrants.dart';
import 'package:flutter_ui_kit/sixvalley/provider/localization_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/splash_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/app_constants.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui_kit/main/main_provider.dart';
import 'package:flutter_ui_kit/main/app.dart';

class SixCurrencyDialog extends StatelessWidget {
  final bool isCurrency;
  SixCurrencyDialog({this.isCurrency = true});
  @override
  Widget build(BuildContext context) {
    int index;
    if(isCurrency) {
      index = Provider.of<SixSplashProvider>(context, listen: false).currencyIndex;
    }else {
      index = Provider.of<SixLocalizationProvider>(context, listen: false).languageIndex;
    }

    return Dialog(
      backgroundColor: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [

        Padding(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: Text(isCurrency ? getTranslated('currency', context) : getTranslated('language', context), style: titilliumSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
        ),

        SizedBox(height: 150, child: Consumer<SixSplashProvider>(
          builder: (context, splash, child) {
            List<String> _valueList = [];
            if(isCurrency) {
              splash.configModel.currencyList.forEach((currency) => _valueList.add(currency.name));
            }else {
              SixAppConstants.languages.forEach((language) => _valueList.add(language.languageName));
            }
            return CupertinoPicker(
              itemExtent: 40,
              useMagnifier: true,
              magnification: 1.2,
              scrollController: FixedExtentScrollController(initialItem: index),
              onSelectedItemChanged: (int i) {
                index = i;
              },
              children: _valueList.map((value) {
                return Center(child: Text(value, style: TextStyle(color: Theme.of(context).textTheme.bodyText1.color)));
              }).toList(),
            );
          },
        )),

        Divider(height: Dimensions.PADDING_SIZE_EXTRA_SMALL, color: ColorResources.HINT_TEXT_COLOR),
        Row(children: [
          Expanded(child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(getTranslated('CANCEL', context), style: robotoRegular.copyWith(color: ColorResources.getYellow(context))),
          )),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child: VerticalDivider(width: Dimensions.PADDING_SIZE_EXTRA_SMALL, color: Theme.of(context).hintColor),
          ),
          Expanded(child: TextButton(
            onPressed: () {
              if(isCurrency) {
                Provider.of<SixSplashProvider>(context, listen: false).setCurrency(index);
              }else {
                Provider.of<SixLocalizationProvider>(context, listen: false).setLanguage(Locale(
                  SixAppConstants.languages[index].languageCode,
                  SixAppConstants.languages[index].countryCode,
                ));
                Provider.of<MainProvider>(context, listen: false).setThemeAndLocale(App.SIXVALLEY, context);
              }
              Navigator.pop(context);
            },
            child: Text(getTranslated('ok', context), style: robotoRegular.copyWith(color: ColorResources.getGreen(context))),
          )),
        ]),

      ]),
    );
  }
}