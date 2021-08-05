import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/all_app_screen.dart';
import 'package:flutter_ui_kit/main/app.dart';
import 'package:flutter_ui_kit/main/main_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/profile_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/images.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/base/status_widget.dart';
import 'package:provider/provider.dart';

class RestaurantDeliveryBoyProfileScreen extends StatelessWidget {
  final bool isFromAllAppScreen;

  RestaurantDeliveryBoyProfileScreen({this.isFromAllAppScreen=false});

  @override
  Widget build(BuildContext context) {
    Provider.of<RestaurantDeliveryBoyProfileProvider>(context, listen: false).getUserInfo();
    return WillPopScope(
      onWillPop: ()async{
        if(isFromAllAppScreen){
          Provider.of<MainProvider>(context, listen: false).setThemeAndLocale(App.MAIN, context);
        }
       return  Future.value(true);

      },
      child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Consumer<RestaurantDeliveryBoyProfileProvider>(
            builder: (context, profileProvider, child) => SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: 275,
                    color: Theme.of(context).primaryColor,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          getTranslated('my_profile', context),
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE, color: Theme.of(context).primaryColorDark),
                        ),
                        SizedBox(height: 42),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, border: Border.all(color: RestaurantDeliveryBoyColorResources.COLOR_WHITE, width: 3)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: FadeInImage.assetNetwork(
                                placeholder: RestaurantDeliveryBoyImages.placeholder,
                                image: profileProvider.userInfoModel.image??Images.user,
                                width: 80,
                                height: 80,
                                fit: BoxFit.fill,)),
                        ),
                        SizedBox(height: 24),
                        Text(
                          profileProvider.userInfoModel.fName != null
                              ? '${profileProvider.userInfoModel.fName ?? ''} ${profileProvider.userInfoModel.lName ?? ''}'
                              : "",
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_EXTRA_LARGE, color: Theme.of(context).primaryColorDark),
                        ),
                        SizedBox(height: 27),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(RestaurantDeliveryBoyDimensions.PADDING_SIZE_LARGE),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              getTranslated('theme_style', context),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(color: Theme.of(context).accentColor, fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE),
                            ),
                            StatusWidget()
                          ],
                        ),
                        SizedBox(height: 42),
                        _userInfoWidget(context: context, text: profileProvider.userInfoModel.fName),
                        SizedBox(height: 18),
                        _userInfoWidget(context: context, text: profileProvider.userInfoModel.lName),
                        SizedBox(height: 18),
                        _userInfoWidget(context: context, text: profileProvider.userInfoModel.phone),
                        SizedBox(height: 40),
                        InkWell(
                          onTap: () {
                            Provider.of<MainProvider>(context, listen: false).setThemeAndLocale(App.MAIN, context);
                            return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => AllAppScreen()), (route) => false) ?? false;
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Image.asset(RestaurantDeliveryBoyImages.log_out, width: 20, height: 20, color: Theme.of(context).accentColor),
                                SizedBox(width: 19),
                                Text(getTranslated('logout', context),
                                    style: rubikMedium.copyWith(
                                        fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE, color: Theme.of(context).accentColor))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget _userInfoWidget({String text, BuildContext context}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RestaurantDeliveryBoyDimensions.PADDING_SIZE_SMALL),
          color: Theme.of(context).cardColor,
          border: Border.all(color: RestaurantDeliveryBoyColorResources.BORDER_COLOR)),
      child: Text(
        text ?? '',
        style: Theme.of(context).textTheme.headline2.copyWith(color: Theme.of(context).focusColor),
      ),
    );
  }
}
