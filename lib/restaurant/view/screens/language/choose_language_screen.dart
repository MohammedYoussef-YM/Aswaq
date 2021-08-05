import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_kit/main/app.dart';
import 'package:flutter_ui_kit/main/main_provider.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/language_model.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/language_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/localization_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant/utill/strings.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_button.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/language/widget/search_widget.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';

class ChooseLanguageScreen extends StatelessWidget {
  final bool fromMenu;
  ChooseLanguageScreen({this.fromMenu = false});

  @override
  Widget build(BuildContext context) {
    Provider.of<RestLanguageProvider>(context, listen: false).initializeAllLanguages(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_LARGE, top: Dimensions.PADDING_SIZE_LARGE),
              child: Text(
                Strings.choose_the_language,
                style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 22, color: Theme.of(context).textTheme.bodyText1.color),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_LARGE, right: Dimensions.PADDING_SIZE_LARGE),
              child: SearchWidget(),
            ),
            SizedBox(height: 30),
            Consumer<RestLanguageProvider>(
                builder: (context, languageProvider, child) => Expanded(
                    child: ListView.builder(
                        itemCount: languageProvider.languages.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => _languageWidget(
                            context: context, languageModel: languageProvider.languages[index], languageProvider: languageProvider, index: index)))),
            Consumer<RestLanguageProvider>(
                builder: (context, languageProvider, child) => Padding(
                      padding: const EdgeInsets.only(
                          left: Dimensions.PADDING_SIZE_LARGE, right: Dimensions.PADDING_SIZE_LARGE, bottom: Dimensions.PADDING_SIZE_LARGE),
                      child: CustomButton(
                        btnTxt: getTranslated('save', context),
                        onTap: () {
                          Provider.of<RestLocalizationProvider>(context, listen: false).toggleLanguage(languageProvider.selectIndex);
                          Provider.of<MainProvider>(context, listen: false).setThemeAndLocale(App.RESTAURANT, context);
                          if (fromMenu) {
                            Navigator.pop(context);
                          } else {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => RestOnBoardingScreen()));
                          }
                        },
                      ),
                    )),
          ],
        ),
      ),
    );
  }

  Widget _languageWidget({BuildContext context, LanguageModel languageModel, RestLanguageProvider languageProvider, int index}) {
    return InkWell(
      onTap: () {
        languageProvider.changeSelectIndex(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: languageProvider.selectIndex == index ? ColorResources.COLOR_PRIMARY.withOpacity(.15) : null,
          border: Border(
              top: BorderSide(width: 1.0, color: languageProvider.selectIndex == index ? ColorResources.COLOR_PRIMARY : Colors.transparent),
              bottom: BorderSide(width: 1.0, color: languageProvider.selectIndex == index ? ColorResources.COLOR_PRIMARY : Colors.transparent)),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color: languageProvider.selectIndex == index ? Colors.transparent : ColorResources.COLOR_GREY_CHATEAU.withOpacity(.3))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                Image.asset(languageModel.imageUrl, width: 34, height: 34),
                  SizedBox(width: 30),
                  Text(
                    languageModel.languageName,
                    style: Theme.of(context).textTheme.headline2.copyWith(color: Theme.of(context).textTheme.bodyText1.color),
                  ),
                ],
              ),
              languageProvider.selectIndex == index
                  ? Image.asset(
                      Images.done,
                      width: 17,
                      height: 17,
                    )
                  : SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
