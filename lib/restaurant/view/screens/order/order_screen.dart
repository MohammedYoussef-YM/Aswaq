import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/order_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_app_bar.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/order/widget/order_view.dart';
import 'package:provider/provider.dart';

class RestOrderScreen extends StatefulWidget {
  @override
  _RestOrderScreenState createState() => _RestOrderScreenState();
}

class _RestOrderScreenState extends State<RestOrderScreen> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    Provider.of<RestOrderProvider>(context, listen: false).getOrderList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      appBar: CustomAppBar(title: getTranslated('my_order', context),isBackButtonExist: false,),
      body: Consumer<RestOrderProvider>(
        builder: (context, order, child) {
          return Column(children: [

            Container(
              color: Theme.of(context).accentColor,
              child: TabBar(
                controller: _tabController,
                labelColor: Theme.of(context).textTheme.bodyText1.color,
                indicatorColor: ColorResources.COLOR_PRIMARY,
                indicatorWeight: 3,
                unselectedLabelStyle: rubikRegular.copyWith(color: ColorResources.COLOR_HINT, fontSize: Dimensions.FONT_SIZE_SMALL),
                labelStyle: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                tabs: [
                  Tab(text: getTranslated('running', context)),
                  Tab(text: getTranslated('history', context)),
                ],
              ),
            ),

            Expanded(child: TabBarView(
              controller: _tabController,
              children: [
                OrderView(isRunning: true),
                OrderView(isRunning: false),
              ],
            )),

          ]);
        },
      ),
    );
  }
}
