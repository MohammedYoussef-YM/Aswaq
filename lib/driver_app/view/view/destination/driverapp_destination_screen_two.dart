import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/driver_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/driver_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/driver_app/utility/strings.dart';
import 'package:flutter_ui_kit/driver_app/view/view/destination/driverapp_destination_screen_four.dart';
import 'package:flutter_ui_kit/driver_app/view/view/destination/widget/map_widget.dart';
import 'package:flutter_ui_kit/driver_app/view/view/navigation_drawer/navigation_drawer.dart';
import 'package:flutter_ui_kit/driver_app/view/widget/custom_button.dart';
import 'package:flutter_ui_kit/driver_app/view/widget/menu_widget.dart';
import 'package:flutter_ui_kit/rideshare/utility/images.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class DriverAppDestinationScreenTwo extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final LatLng currentDeviceLatLng;
  final LatLng destinationLatLng;

  DriverAppDestinationScreenTwo({this.currentDeviceLatLng, this.destinationLatLng});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey, // assign key to Scaffold
      drawer: NavigationDrawer(),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SafeArea(
            child: MapWidget(
              currentDeviceLatLng: currentDeviceLatLng,
              destinationLatLng: destinationLatLng,
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 350,
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                decoration: BoxDecoration(
                    color: ColorResources.COLOR_WHITE,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(26.0),
                      topLeft: Radius.circular(26.0),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text(
                      Strings.driver_details,
                      style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_DEEP, fontSize: 17),
                    )),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Row(
                          children: [
                            FadeInImage.assetNetwork(placeholder: Images.place_holder, image: Images.person_one, width: 60, height: 60, fit: BoxFit.fill),
                            SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(Strings.hohn_doe, style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK)),
                                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/rideshare/images/call.png'),
                                    SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                    Text(Strings.phone_number_digit, style: montserratRegular.copyWith(color: ColorResources.COLOR_GRAY_DEEP))
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                            right: 0, child: Image.asset('assets/rideshare/images/ride_share_logo.png', width: 67, height: 64, fit: BoxFit.fill))
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                      child: Row(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                child: CircularProgressIndicator(
                                  value: 1,
                                  strokeWidth: 3,
                                  valueColor: new AlwaysStoppedAnimation<Color>(ColorResources.COLOR_PRIMARY),
                                ),
                              ),
                              Positioned(
                                  bottom: -20,
                                  child: CircleAvatar(
                                    radius: 3,
                                    backgroundColor: ColorResources.COLOR_PRIMARY,
                                  ))
                            ],
                          ),
                          SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Strings.from,
                                  style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY, fontSize: 13),
                                ),
                                Text(
                                  Strings.address_one,
                                  style: poppinsRegular,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                      child: Row(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 8,
                                height: 15,
                                margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
                                child: Image.asset('assets/rideshare/images/location.png'),
                              ),
                              Positioned(
                                  bottom: 30,
                                  child: CircleAvatar(
                                    radius: 3,
                                    backgroundColor: ColorResources.COLOR_PRIMARY,
                                  )),
                            ],
                          ),
                          SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Strings.to,
                                  style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY, fontSize: 13),
                                ),
                                Text(
                                  Strings.address_three,
                                  style: poppinsRegular,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                    Padding(
                      padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT),
                      child: CustomButton(
                        btnTxt: Strings.end_ride,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => DriverAppDestinationScreenFour(
                                    currentDeviceLatLng: currentDeviceLatLng,
                                    destinationLatLng: destinationLatLng,
                                  )));
                        },
                      ),
                    )
                  ],
                ),
              )),
          MenuWidget(drawerKey: _drawerKey),
        ],
      ),
    );
  }
}
