import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/rideshare/provider/rideshare_destination_provider.dart';
import 'package:flutter_ui_kit/rideshare/utility/colorResources.dart';
import 'package:flutter_ui_kit/rideshare/utility/dimensions.dart';
import 'package:flutter_ui_kit/rideshare/utility/strings.dart';
import 'package:flutter_ui_kit/rideshare/view/view/destination/widget/rideshare_map_widget.dart';
import 'package:flutter_ui_kit/rideshare/view/view/navigation_drawer/navigation_drawer.dart';
import 'package:flutter_ui_kit/rideshare/view/view/tips/tips_screen.dart';
import 'package:flutter_ui_kit/rideshare/view/widget/custom_button.dart';
import 'package:flutter_ui_kit/rideshare/view/widget/destination_location_widget.dart';
import 'package:flutter_ui_kit/rideshare/view/widget/menu_widget.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RideShareDestinationScreenThree extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  final LatLng currentDeviceLatLng;
  final LatLng destinationLatLng;
  final Address driverAddress;
  final Address userAddress;

  RideShareDestinationScreenThree({this.currentDeviceLatLng, this.destinationLatLng, this.driverAddress, this.userAddress});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        if (Provider.of<RideShareDestinationProvider>(context, listen: false).selectIndex == 2) {
          Provider.of<RideShareDestinationProvider>(context, listen: false).changeSelectIndex(1);
        } else if (Provider.of<RideShareDestinationProvider>(context, listen: false).selectIndex == 1) {
          Provider.of<RideShareDestinationProvider>(context, listen: false).changeSelectIndex(0);
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        key: _drawerKey, // assign key to Scaffold
        drawer: NavigationDrawer(),
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            SafeArea(
              child: RideShareMapWidget(
                currentDeviceLatLng: currentDeviceLatLng,
                destinationLatLng: destinationLatLng,
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.09,
              minChildSize: 0.09,
              maxChildSize: 0.40,
              builder: (BuildContext context, ScrollController scrollController) {
                return Container(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  decoration: BoxDecoration(
                      color: ColorResources.COLOR_WHITE,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(26.0),
                        topLeft: Radius.circular(26.0),
                      )),
                  child: ListView(
                    controller: scrollController,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 2, width: 40, color: ColorResources.COLOR_PRIMARY),
                        ],
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      DestinationLocationWidget(
                        fromLocationAddress: '${driverAddress.featureName ?? ''} , ${driverAddress.subAdminArea ?? ''}',
                        toLocationAddress: '${userAddress.featureName ?? ''} , ${userAddress.subAdminArea ?? ''}',
                      ),
                      SizedBox(height: 20),
                      Consumer<RideShareDestinationProvider>(
                        builder: (context, destinationProvider, child) => CustomButton(
                          btnTxt: destinationProvider.selectIndex == 0
                              ? Strings.arrived
                              : destinationProvider.selectIndex == 1
                                  ? Strings.end_ride
                                  : Strings.complete_ride,
                          onTap: () {
                            if (destinationProvider.selectIndex == 0) {
                              destinationProvider.changeSelectIndex(1);
                            } else if (destinationProvider.selectIndex == 1) {
                              destinationProvider.changeSelectIndex(2);
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => TipsScreen()));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            MenuWidget(drawerKey: _drawerKey),
          ],
        ),
      ),
    );
  }
}
