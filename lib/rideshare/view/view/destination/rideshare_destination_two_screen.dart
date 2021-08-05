import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/rideshare/provider/rideshare_destination_provider.dart';
import 'package:flutter_ui_kit/rideshare/utility/colorResources.dart';
import 'package:flutter_ui_kit/rideshare/utility/dimensions.dart';
import 'package:flutter_ui_kit/rideshare/utility/strings.dart';
import 'package:flutter_ui_kit/rideshare/view/view/destination/rideshare_destination_three_screen.dart';
import 'package:flutter_ui_kit/rideshare/view/view/destination/widget/destination_widget.dart';
import 'package:flutter_ui_kit/rideshare/view/view/destination/widget/rideshare_map_widget.dart';
import 'package:flutter_ui_kit/rideshare/view/view/home/rideshare_homescreen.dart';
import 'package:flutter_ui_kit/rideshare/view/view/navigation_drawer/navigation_drawer.dart';
import 'package:flutter_ui_kit/rideshare/view/widget/custom_button.dart';
import 'package:flutter_ui_kit/rideshare/view/widget/menu_widget.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RideShareDestinationScreenTwo extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  final LatLng currentDeviceLatLng;
  final LatLng destinationLatLng;
  final Address driverAddress;
  final Address userAddress;

  RideShareDestinationScreenTwo({this.currentDeviceLatLng, this.destinationLatLng, this.driverAddress, this.userAddress});

  Widget _chatMessageCancelWidget({String imageUrl, String subtitle, Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: ColorResources.COLOR_PRIMARY.withOpacity(.1),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
          Text(subtitle, style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_DEEP, fontSize: 13)),
        ],
      ),
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
                        Text(
                          Strings.min_30,
                          style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_GRAY_DEEP, fontSize: 17),
                        ),
                        SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                        Image.asset(
                          'assets/rideshare/images/profile_one.png',
                          width: 42,
                          height: 42,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                        Text(
                          Strings.km4_8,
                          style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_GRAY_DEEP, fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: _chatMessageCancelWidget(imageUrl: 'assets/rideshare/images/chat.png', subtitle: Strings.chat)),
                            Expanded(child: _chatMessageCancelWidget(imageUrl: 'assets/rideshare/images/sms.png', subtitle: Strings.message)),
                            Expanded(
                                child: _chatMessageCancelWidget(
                                    imageUrl: 'assets/rideshare/images/cancel_one.png',
                                    subtitle: Strings.cancel_trip,
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => RideShareHomeScreen()));
                                    })),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT),
                      child: CustomButton(
                        btnTxt: Strings.arrived,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => RideShareDestinationScreenThree(
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
          Positioned(left: 30, top: 145, right: 30, child: DestinationWidget(userAddress: userAddress, driverAddress: driverAddress)),
        ],
      ),
    );
  }

}
