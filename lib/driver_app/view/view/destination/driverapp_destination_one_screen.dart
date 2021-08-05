import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/driver_app/provider/destination_provider.dart';
import 'package:flutter_ui_kit/driver_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/driver_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/driver_app/utility/strings.dart';
import 'package:flutter_ui_kit/driver_app/view/view/destination/driverapp_destination_screen_two.dart';
import 'package:flutter_ui_kit/driver_app/view/view/destination/widget/map_widget.dart';
import 'package:flutter_ui_kit/driver_app/view/view/navigation_drawer/navigation_drawer.dart';
import 'package:flutter_ui_kit/driver_app/view/widget/custom_button.dart';
import 'package:flutter_ui_kit/driver_app/view/widget/menu_widget.dart';
import 'package:flutter_ui_kit/rideshare/utility/images.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DriverAppDestinationOneScreen extends StatelessWidget {
  final LatLng currentDeviceLatLng;
  final LatLng destinationLatLng;

  DriverAppDestinationOneScreen({this.currentDeviceLatLng, this.destinationLatLng});

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Provider.of<DestinationProvider>(context, listen: false).initializeDestination();

    return Scaffold(
      key: _drawerKey, // assign key to Scaffold
      drawer: NavigationDrawer(),
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SafeArea(
              child: MapWidget(
                currentDeviceLatLng: currentDeviceLatLng,
                destinationLatLng: destinationLatLng,
              ),
            ),
            MenuWidget(drawerKey: _drawerKey),
            DraggableScrollableSheet(
              initialChildSize: 0.06,
              minChildSize: 0.06,
              maxChildSize: 0.9,
              builder: (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                      color: ColorResources.COLOR_WHITE,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))),
                  child: ListView(
                    controller: scrollController,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: ColorResources.COLOR_PRIMARY,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))),
                        child: Container(
                          height: 4,
                          width: 30,
                          decoration: BoxDecoration(color: ColorResources.COLOR_WHITE, borderRadius: BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                      Consumer<DestinationProvider>(
                        builder: (context, destinationProvider, child) => ListView.builder(
                            padding: EdgeInsets.all(0),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: destinationProvider.destinations.length,
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    destinationProvider.updateRideIndex(index);
                                  },
                                  child: Container(
                                    height: 65,
                                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                                    color: destinationProvider.selectRideIndex == index ? Colors.grey.withOpacity(.2) : Colors.transparent,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        FadeInImage.assetNetwork(
                                          placeholder: Images.place_holder,
                                          image: destinationProvider.destinations[index].imageUrl,
                                          width: 50,
                                          height: 50,
                                        ),
                                        Text(
                                          destinationProvider.destinations[index].title,
                                          style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK, fontSize: 13),
                                        ),
                                        Text(
                                          destinationProvider.destinations[index].price,
                                          style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_PRIMARY, fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                        child: CustomButton(
                          btnTxt: Strings.confirm_ride,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => DriverAppDestinationScreenTwo(
                                    currentDeviceLatLng: currentDeviceLatLng,
                                    destinationLatLng: destinationLatLng,
                                    )));
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
