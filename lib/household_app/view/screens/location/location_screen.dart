import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';
import 'package:flutter_ui_kit/household_app/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_ui_kit/household_app/view/widget/custom_text_field.dart';
import 'package:flutter_ui_kit/household_app/view/widget/custom_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    GoogleMapController _controller;
    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.421997, -122.084100),
      zoom: 15,
    );

    return Scaffold(
      body: Stack(children: [

        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          indoorViewEnabled: true,
          zoomControlsEnabled: false,
          onMapCreated: (GoogleMapController controller) => _controller = controller,
          onCameraMove: (CameraPosition latLng) {
            _kGooglePlex = latLng;
          },
        ),

        Positioned(
          top: 40, left: 20, right: 20,
          child: SafeArea(
            child: CustomTextField(
              hintText: Strings.where_do_you_want_service,
              inputAction: TextInputAction.search,
              prefixIcon: Icon(Icons.search, color: HouseHoldColorResources.COLOR_BLACK, size: 25),
              isBorder: false,
            ),
          ),
        ),

        Positioned(
          top: 100, right: 20,
          child: SafeArea(child: InkWell(
            onTap: () {
              if(_controller != null) {
                _controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
              }
            },
            child: Container(
              padding: EdgeInsets.all(HouseHoldDimensions.PADDING_SIZE_EXTRA_SMALL),
              decoration: BoxDecoration(color: HouseHoldColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(5)),
              child: Icon(Icons.my_location_rounded, color: HouseHoldColorResources.COLOR_PRIMARY),
            ),
          )),
        ),

        Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: HouseHoldDimensions.PADDING_SIZE_LARGE, vertical: HouseHoldDimensions.PADDING_SIZE_SMALL),
              decoration: BoxDecoration(color: HouseHoldColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(5)),
              child: Text(Strings.service_provider_will_arrive_here, style: manropeLight),
            ),
            Icon(Icons.location_on, color: HouseHoldColorResources.COLOR_CRANBERRY, size: 60),
          ]),
        ),

        Positioned(
          bottom: 100,
          right: 15,
          child: Card(
            elevation: 2,
            child: Container(
              color: Color(0xFFFAFAFA),
              width: 40,
              height: 100,
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () async {
                      var currentZoomLevel = await _controller.getZoomLevel();
                      currentZoomLevel = currentZoomLevel + 2;
                      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _kGooglePlex.target, zoom: currentZoomLevel)),
                      );
                    },
                  ),
                  SizedBox(height: 2),
                  IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () async {
                        var currentZoomLevel = await _controller.getZoomLevel();
                        currentZoomLevel = currentZoomLevel - 2;
                        if (currentZoomLevel < 0) currentZoomLevel = 0;
                        _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _kGooglePlex.target, zoom: currentZoomLevel)));
                      }),
                ],
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 40, left: 20, right: 20,
          child: CustomButton(btnTxt: Strings.set_location, onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HouseDashboardScreen()));
          }),
        ),

      ]),
    );
  }
}
