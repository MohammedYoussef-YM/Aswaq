import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/rideshare/provider/rideshare_destination_provider.dart';
import 'package:flutter_ui_kit/rideshare/utility/colorResources.dart';
import 'package:flutter_ui_kit/rideshare/utility/dimensions.dart';
import 'package:flutter_ui_kit/rideshare/utility/strings.dart';
import 'package:flutter_ui_kit/rideshare/view/view/destination/rideshare_destination_two_screen.dart';
import 'package:flutter_ui_kit/rideshare/view/view/destination/widget/rideshare_map_widget.dart';
import 'package:flutter_ui_kit/rideshare/view/view/navigation_drawer/navigation_drawer.dart';
import 'package:flutter_ui_kit/rideshare/view/widget/custom_button.dart';
import 'package:flutter_ui_kit/rideshare/view/widget/destination_location_widget.dart';
import 'package:flutter_ui_kit/rideshare/view/widget/menu_widget.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RideShareDestinationScreenOne extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  final LatLng currentDeviceLatLng;
  final LatLng destinationLatLng;
  final Address driverAddress;
  final Address userAddress;

  RideShareDestinationScreenOne({this.currentDeviceLatLng, this.destinationLatLng, this.driverAddress, this.userAddress});

  Widget _distanceTimeCash({String title, String subtitle}) {
    return Column(
      children: [
        Text(title, style: poppinsBold.copyWith(color: ColorResources.COLOR_BLACK, fontSize: 15)),
        Text(subtitle, style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY, fontSize: 13)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<RideShareDestinationProvider>(context, listen: false).initializeDestination();
    return Scaffold(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 19.0,
                          backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/2182970/pexels-photo-2182970.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                        Text(
                          Strings.john_doe,
                          style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_GRAY_DEEP, fontSize: 17),
                        ),
                        SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                        Image.asset('assets/rideshare/images/star.png')
                      ],
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: _distanceTimeCash(title: Strings.km4_8, subtitle: Strings.distance)),
                            Expanded(child: _distanceTimeCash(title: Strings.min_30, subtitle: Strings.time)),
                            Expanded(child: _distanceTimeCash(title: Strings.tk_120, subtitle: Strings.cash_trip)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                    Padding(
                      padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT),
                      child: CustomButton(
                        btnTxt: Strings.accept_ride_request,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => RideShareDestinationScreenTwo(
                                    currentDeviceLatLng: currentDeviceLatLng,
                                    destinationLatLng: destinationLatLng,
                                    driverAddress: driverAddress,
                                    userAddress: userAddress,
                                  )));
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          MenuWidget(drawerKey: _drawerKey),
          Positioned(left: 30, top: 145, right: 30, child: destination()),
        ],
      ),
    );
  }

  Widget destination() {
    return Container(
      decoration: BoxDecoration(
        color: ColorResources.COLOR_WHITE,
        borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DestinationLocationWidget(
            fromLocationAddress: '${driverAddress.featureName ?? ''} , ${driverAddress.subAdminArea ?? ''}',
            toLocationAddress: '${userAddress.featureName ?? ''} , ${userAddress.subAdminArea ?? ''}',
            isShowFromTo: true,
          ),
        ],
      ),
    );
  }
}
