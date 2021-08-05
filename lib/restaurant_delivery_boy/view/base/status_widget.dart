import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/app.dart';
import 'package:flutter_ui_kit/main/main_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/theme_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/dimensions.dart';
import 'package:provider/provider.dart';

class StatusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantDeliveryBoyThemeProvider>(
        builder: (context, themeProvider, child) => InkWell(
              onTap: (){
                themeProvider.toggleTheme();
                Provider.of<MainProvider>(context, listen: false).setThemeAndLocale(App.RESTAURANT_DELIVERY_BOY, context);
              },
              child: themeProvider.darkTheme
                  ? Container(
                      width: 74,
                      height: 29,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: RestaurantDeliveryBoyColorResources.COLOR_PRIMARY,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            getTranslated('dark', context),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline2.copyWith(
                                  color: RestaurantDeliveryBoyColorResources.COLOR_WHITE,
                                  fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_SMALL,
                                ),
                          )),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: CircleAvatar(
                              radius: 13,
                              backgroundColor: RestaurantDeliveryBoyColorResources.COLOR_WHITE,
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                      width: 74,
                      height: 29,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: RestaurantDeliveryBoyColorResources.COLOR_GREY,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: CircleAvatar(
                              radius: 13,
                              backgroundColor: RestaurantDeliveryBoyColorResources.COLOR_WHITE,
                            ),
                          ),
                          Expanded(
                              child: Text(
                            getTranslated('light', context),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline2.copyWith(
                                  color: RestaurantDeliveryBoyColorResources.COLOR_WHITE,
                                  fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_SMALL,
                                ),
                          )),
                        ],
                      ),
                    ),
            ));
  }
}
