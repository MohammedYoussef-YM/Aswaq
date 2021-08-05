import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/order_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/provider/profile_provider.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/utill/images.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/screens/home/widget/order_widget.dart';
import 'package:flutter_ui_kit/restaurant_delivery_boy/view/screens/language/choose_language_screen.dart';
import 'package:provider/provider.dart';

class RestaurantDeliveryBoyHomeScreen extends StatelessWidget {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        leadingWidth: 0,
        actions: [
          Consumer<RestaurantDeliveryBoyOrderProvider>(
            builder: (context, orderProvider, child) => orderProvider.currentOrders.length > 0
                ? SizedBox.shrink()
                : IconButton(
                    icon: Icon(Icons.refresh, color: Theme.of(context).focusColor),
                    onPressed: () {
                      orderProvider.refresh();
                    }),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'language':
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => ChooseLanguageScreen(fromHomeScreen: true)));
              }
            },
            icon: Icon(
              Icons.more_vert_outlined,
              color: Theme.of(context).focusColor,
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'language',
                child: Row(
                  children: [
                    Icon(Icons.language, color: Theme.of(context).focusColor),
                    SizedBox(width: RestaurantDeliveryBoyDimensions.PADDING_SIZE_LARGE),
                    Text(
                      getTranslated('change_language', context),
                      style: Theme.of(context).textTheme.headline2.copyWith(color: Theme.of(context).focusColor),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
        leading: SizedBox.shrink(),
        title: Consumer<RestaurantDeliveryBoyProfileProvider>(
          builder: (context, profileProvider, child) => profileProvider.userInfoModel != null
              ? Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child:FadeInImage.assetNetwork(
                          placeholder: RestaurantDeliveryBoyImages.placeholder,
                          image: profileProvider.userInfoModel.image,
                          width: 40,
                          height: 40,
                          fit: BoxFit.fill,)
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      profileProvider.userInfoModel.fName != null
                          ? '${profileProvider.userInfoModel.fName ?? ''} ${profileProvider.userInfoModel.lName ?? ''}'
                          : "",
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE, color: Theme.of(context).focusColor),
                    )
                  ],
                )
              : SizedBox.shrink(),
        ),
      ),
      body: Consumer<RestaurantDeliveryBoyOrderProvider>(
          builder: (context, orderProvider, child) => Padding(
                padding: const EdgeInsets.all(RestaurantDeliveryBoyDimensions.PADDING_SIZE_LARGE),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(getTranslated('active_order', context),
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            .copyWith(fontSize: RestaurantDeliveryBoyDimensions.FONT_SIZE_LARGE, color: Theme.of(context).accentColor)),
                    SizedBox(height: 18),
                    Expanded(
                      child: RefreshIndicator(
                        child: orderProvider.currentOrders != null
                            ? orderProvider.currentOrders.length != 0
                                ? ListView.builder(
                                    itemCount: orderProvider.currentOrders.length,
                                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                    itemBuilder: (context, index) => OrderWidget(
                                      orderModel: orderProvider.currentOrders[index],
                                      index: index,
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      getTranslated('no_order_found', context),
                                      style: Theme.of(context).textTheme.headline3.copyWith(color: Theme.of(context).primaryColor),
                                    ),
                                  )
                            : SizedBox.shrink(),
                        key: _refreshIndicatorKey,
                        displacement: 0,
                        color: RestaurantDeliveryBoyColorResources.COLOR_WHITE,
                        backgroundColor: Theme.of(context).primaryColor,
                        onRefresh: () {
                          return orderProvider.refresh();
                        },
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
