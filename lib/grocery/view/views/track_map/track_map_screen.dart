import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/utility/images.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackMapScreen extends StatefulWidget {
  @override
  _TrackMapScreenState createState() => _TrackMapScreenState();
}

class _TrackMapScreenState extends State<TrackMapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(24.0178493, 90.4159996);

  final Set<Marker> _markers = {};


  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 16.0,
            ),
            mapType: MapType.satellite,
            markers: _markers,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
          ),
          Positioned(
              bottom: Dimensions.PADDING_SIZE_SMALL,
              left: Dimensions.PADDING_SIZE_SMALL,
              right: Dimensions.PADDING_SIZE_SMALL,
              child: Container(
                height: 200,
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                margin: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                decoration: BoxDecoration(color: ColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(8.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.shipper_information,
                      style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK.withOpacity(.5)),
                    ),
                    Container(
                        height: 1,
                        margin: EdgeInsets.only(
                          bottom: Dimensions.PADDING_SIZE_LARGE,
                          top: Dimensions.PADDING_SIZE_DEFAULT,
                        ),
                        color: ColorResources.COLOR_BLACK.withOpacity(.05)),
                    Row(
                      children: [
                       FadeInImage.assetNetwork(
                         placeholder: Images.place_holder,
                         image: Images.profile,
                         fit: BoxFit.fill,
                         width: 50,
                         height: 50,),
                        SizedBox(
                          width: Dimensions.PADDING_SIZE_SMALL,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Strings.martin_schmidt,
                                style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK.withOpacity(.8)),
                              ),
                              Text(
                                Strings.phone_number_two,
                                style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK.withOpacity(.5)),
                              ),
                            ],
                          ),
                        ),
                        Image.asset('assets/grocery/icon/call.png'),
                        SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                        Image.asset('assets/grocery/icon/chat.png'),
                      ],
                    ),
                    Container(
                        height: 1,
                        margin: EdgeInsets.only(
                          top: Dimensions.PADDING_SIZE_LARGE,
                          bottom: Dimensions.PADDING_SIZE_DEFAULT,
                        ),
                        color: ColorResources.COLOR_BLACK.withOpacity(.05)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.estimated_time,
                          style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK.withOpacity(.8)),
                        ),
                        Text(
                          Strings.four2_mins,
                          style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK.withOpacity(.8)),
                        ),
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
