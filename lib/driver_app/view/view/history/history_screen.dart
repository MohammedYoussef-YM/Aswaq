import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/driver_app/provider/history_provider.dart';
import 'package:flutter_ui_kit/driver_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/driver_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/driver_app/utility/strings.dart';
import 'package:flutter_ui_kit/driver_app/view/view/history/widget/history_details_widget.dart';
import 'package:flutter_ui_kit/driver_app/view/view/navigation_drawer/navigation_drawer.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:provider/provider.dart';

class DriverAppHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<DriverAppHistoryProvider>(context, listen: false).initializeHistory();
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      key: _drawerKey,
      drawer: NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: ColorResources.COLOR_WHITE,
        elevation: 0,
        title: Text(
          Strings.history,
          style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE, fontSize: Dimensions.FONT_SIZE_LARGE),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: ColorResources.COLOR_PRIMARY,
          ),
          onPressed: () {
            _drawerKey.currentState.openDrawer();
          },
        ),
      ),
      body: Consumer<DriverAppHistoryProvider>(
        builder: (context, historyProvider, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Strings.total_tips, style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE)),
                      Text('570', style: poppinsBold.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE, fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Strings.price, style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE)),
                      Text('\$2487',
                          style: poppinsBold.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE, fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Strings.years, style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE)),
                      Text('3.5', style: poppinsBold.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE, fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE)),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              child: Text(
                Strings.recent_ride,
                style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE, fontSize: Dimensions.FONT_SIZE_LARGE),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: historyProvider.historyModels.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                  child: HistoryDetailsWidget(),
                                );
                              });
                        },
                        child: Container(
                          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    historyProvider.historyModels[index].time,
                                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE),
                                  ),
                                  Container(
                                    width: 35,
                                    height: 18,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.0), color: ColorResources.COLOR_GAINSBORO.withOpacity(.6)),
                                    child: Text(
                                      'AM',
                                      style: montserratRegular.copyWith(fontSize: 11),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              historyProvider.historyModels[index].title,
                                              style: poppinsRegular.copyWith(
                                                  color: ColorResources.COLOR_GRAY_SIMPLE, fontSize: Dimensions.FONT_SIZE_LARGE),
                                            ),
                                            Text(historyProvider.historyModels[index].subtitle,
                                                style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
                                          ],
                                        ),
                                        Text(historyProvider.historyModels[index].price,
                                            style: poppinsRegular.copyWith(
                                                color: ColorResources.COLOR_GRAY_SIMPLE, fontSize: Dimensions.FONT_SIZE_LARGE)),
                                      ],
                                    ),
                                    SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                                    Divider(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
