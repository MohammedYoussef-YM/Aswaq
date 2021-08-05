import 'dart:async';

import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/screens/On_the_way_bottom_sheet.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/utility/dimensions.dart';
import 'package:flutter_ui_kit/food/utility/strings.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectDestinationScreen extends StatefulWidget {
  @override
  _SelectDestinationScreenState createState() =>
      _SelectDestinationScreenState();
}

class _SelectDestinationScreenState extends State<SelectDestinationScreen> {
  Completer<GoogleMapController> _controller = Completer();

  LatLng _latLng = LatLng(37.42796133580664, -122.085749655962);

  /*static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      zoom: 20);*/

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ExpandableBottomSheet(
        background: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: _latLng,
                zoom: 15,
              ),
              onTap: (latLng) {
                setState(() {
                  _latLng = latLng;
                });
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: Set.of([Marker(markerId: MarkerId('home'), position: _latLng)]),
            ),
            titleAndAddressBar(context),
            backButton(context),
          ],
        ),
        persistentHeader: Container(
          height: 40,
          margin: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: ColorResources.COLOR_PRIMARY,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30))),
          child: Container(
            height: 4,
            width: 30,
            decoration: BoxDecoration(
                color: ColorResources.COLOR_WHITE,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
        expandableContent: orderDetails(context),
      ),
    );
  }

  Widget titleAndAddressBar(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: ColorResources.COLOR_PRIMARY,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_EXTRA_SMALL),
              child: Text(
                Strings.SELECT_DESTINATION,
                style: TextStyle(
                    color: ColorResources.COLOR_WHITE,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.TEXT_SIZE_EXTRA_LARGE),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 40,
              margin: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
              decoration: BoxDecoration(
                  color: ColorResources.COLOR_WHITE,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: Dimensions.PADDING_SIZE_SMALL),
                    child: Icon(
                      Icons.location_on,
                      color: ColorResources.COLOR_BLACK,
                      size: 20,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: Dimensions.PADDING_SIZE_SMALL),
                      child: Text(
                        Strings.ADDRESS_MAP,
                        style: TextStyle(
                            fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                            color: ColorResources.COLOR_GREY),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget backButton(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_DEFAULT, left: Dimensions.PADDING_SIZE_SMALL),
          child: Icon(
            Icons.arrow_back_ios,
            color: ColorResources.COLOR_WHITE,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget orderDetails(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
      decoration: BoxDecoration(
        color: ColorResources.COLOR_WHITE,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            Strings.DELIVERD_TO,
            style: TextStyle(
                fontSize: Dimensions.TEXT_SIZE_SMALL,
                fontWeight: FontWeight.bold,
                fontFamily: 'GothamRounded'),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: Dimensions.PADDING_SIZE_SMALL,
                bottom: Dimensions.PADDING_SIZE_SMALL),
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: ColorResources.COLOR_WHITE,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      border: Border.all(color: ColorResources.COLOR_GREY.withOpacity(0.3), width: 2),
                  ),
                  child: Icon(
                    Icons.directions_bike,
                    size: 20,
                    color: ColorResources.COLOR_PRIMARY,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                  child: Text(
                    Strings.ADDRESS_MAP,
                    style: TextStyle(fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Text(
            Strings.ESTIMATED_TIME_TITLE,
            style: TextStyle(
                fontSize: Dimensions.TEXT_SIZE_SMALL,
                fontWeight: FontWeight.bold,
                fontFamily: 'GothamRounded'),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: ColorResources.COLOR_WHITE,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      border: Border.all(color: ColorResources.COLOR_GREY.withOpacity(0.3), width: 2),
                  ),
                  child: Icon(
                    Icons.alarm,
                    size: 20,
                    color: ColorResources.COLOR_PRIMARY,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                  child: Text(
                    Strings.FITEEN_MINUTES,
                    style: TextStyle(
                        fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              OnTheWayBottomSheet.orderStatus(context);
            },
            child: Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: ColorResources.COLOR_PRIMARY,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text(
                Strings.DELIVER_ORDER_BUTTON,
                style: TextStyle(
                    fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                    color: ColorResources.COLOR_WHITE),
              ),
            ),
          )
        ],
      ),
    );
  }
}
