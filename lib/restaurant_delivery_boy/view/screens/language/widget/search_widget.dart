import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/language_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/images.dart';
import 'package:provider/provider.dart';

class RestaurantDeliveryBoySearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantDeliveryBoyLanguageProvider>(
      builder: (context, searchProvider, child) => TextField(
        cursorColor: RestaurantDeliveryBoyColorResources.COLOR_PRIMARY,
        onChanged: (String query) {
          searchProvider.searchLanguage(query, context);
        },
        style: Theme.of(context).textTheme.headline2.copyWith(color: RestaurantDeliveryBoyColorResources.COLOR_BLACK, fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: BorderSide(style: BorderStyle.none, width: 0),
          ),
          isDense: true,
          hintText: getTranslated('find_language', context),
          fillColor: RestaurantDeliveryBoyColorResources.COLOR_WHITE,
          hintStyle: Theme.of(context).textTheme.headline2.copyWith(fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_SMALL, color: RestaurantDeliveryBoyColorResources.COLOR_GREY_CHATEAU),
          filled: true,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(left: RestaurantDeliveryBoyDimensions.PADDING_SIZE_LARGE, right: RestaurantDeliveryBoyDimensions.PADDING_SIZE_SMALL),
            child: Image.asset(RestaurantDeliveryBoyImages.search, width: 15, height: 15),
          ),
        ),
      ),
    );
  }
}
