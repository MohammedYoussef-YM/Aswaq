import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/app.dart';
import 'package:flutter_ui_kit/main/main_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/data/model/response/language_model.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/language_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/localization_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/images.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/base/custom_button.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/screens/auth/login_screen.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/screens/language/widget/search_widget.dart';
import 'package:provider/provider.dart';

class ChooseLanguageScreen extends StatelessWidget {
  final bool fromHomeScreen;

  ChooseLanguageScreen({this.fromHomeScreen = false});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: RestaurantDeliveryBoyDimensions.PADDING_SIZE_LARGE, top: RestaurantDeliveryBoyDimensions.PADDING_SIZE_LARGE),
              child: Text(
                getTranslated('choose_the_language', context)??'',
                style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 22, color: Theme.of(context).accentColor),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: RestaurantDeliveryBoyDimensions.PADDING_SIZE_LARGE, right: RestaurantDeliveryBoyDimensions.PADDING_SIZE_LARGE),
              child: RestaurantDeliveryBoySearchWidget(),
            ),
            SizedBox(height: 30),
            Consumer<RestaurantDeliveryBoyLanguageProvider>(
                builder: (context, languageProvider, child) => Expanded(
                    child: ListView.builder(
                        itemCount: languageProvider.languages.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => _languageWidget(
                            context: context, languageModel: languageProvider.languages[index], languageProvider: languageProvider, index: index)))),
            Consumer<RestaurantDeliveryBoyLanguageProvider>(
                builder: (context, languageProvider, child) => Padding(
                      padding: const EdgeInsets.only(
                          left: RestaurantDeliveryBoyDimensions.PADDING_SIZE_LARGE, right: RestaurantDeliveryBoyDimensions.PADDING_SIZE_LARGE, bottom: RestaurantDeliveryBoyDimensions.PADDING_SIZE_LARGE),
                      child: CustomButton(
                        btnTxt: getTranslated('save', context),
                        onTap: () {
                          Provider.of<RestaurantDeliveryBoyLocalizationProvider>(context, listen: false)
                              .toggleLanguage(languageCode: languageProvider.languages[languageProvider.selectIndex].languageCode);
                          Provider.of<MainProvider>(context, listen: false).setThemeAndLocale(App.RESTAURANT_DELIVERY_BOY, context);
                          if (fromHomeScreen) {
                            Navigator.pop(context);
                          } else {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => RestaurantDeliveryBoyLoginScreen()));
                          }
                        },
                      ),
                    )),
          ],
        ),
      ),
    );
  }

  Widget _languageWidget({BuildContext context, LanguageModel languageModel, RestaurantDeliveryBoyLanguageProvider languageProvider, int index}) {
    return InkWell(
      onTap: () {
        languageProvider.changeSelectIndex(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: languageProvider.selectIndex == index ? Theme.of(context).primaryColor.withOpacity(.15) : null,
          border: Border(
              top: BorderSide(
                  width: languageProvider.selectIndex == index ? 1.0 : 0.0,
                  color: languageProvider.selectIndex == index ? Theme.of(context).primaryColor : Colors.transparent),
              bottom: BorderSide(
                  width: languageProvider.selectIndex == index ? 1.0 : 0.0,
                  color: languageProvider.selectIndex == index ? Theme.of(context).primaryColor : Colors.transparent)),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color: languageProvider.selectIndex == index
                        ? Colors.transparent
                        : (languageProvider.selectIndex - 1) == (index - 1)
                            ? Colors.transparent
                            : Theme.of(context).dividerColor.withOpacity(.2))),
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
                    style: Theme.of(context).textTheme.headline2.copyWith(color: Theme.of(context).focusColor),
                  ),
                ],
              ),
              languageProvider.selectIndex == index
                  ? Image.asset(
                      RestaurantDeliveryBoyImages.done,
                      width: 17,
                      height: 17,
                      color: Theme.of(context).primaryColorLight,
                    )
                  : SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
