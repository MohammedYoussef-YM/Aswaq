import 'dart:collection';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_kit/driver_app/utility/colorResources.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RideShareMapWidget extends StatefulWidget {
  final LatLng currentDeviceLatLng;
  final LatLng destinationLatLng;

  RideShareMapWidget({this.currentDeviceLatLng, this.destinationLatLng});

  @override
  _RideShareMapWidgetState createState() => _RideShareMapWidgetState();
}

class _RideShareMapWidgetState extends State<RideShareMapWidget> {


  Set<Marker> _markers = HashSet<Marker>();
  Polyline _polyline;
  GoogleMapController controller;
  List<LatLng> latLngLists = [];

  @override
  void initState() {
    super.initState();
    //line segment 1
    latLngLists.add(widget.currentDeviceLatLng??LatLng(23.8103, 90.4125));
    latLngLists.add(widget.destinationLatLng??LatLng(23.8109, 90.4120));
    setMarkerAndPolyline();
  }


  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: widget.currentDeviceLatLng,
        zoom: 14,
      ),
      zoomControlsEnabled: false,
      compassEnabled: true,
      indoorViewEnabled: true,
      mapToolbarEnabled: true,
      markers: _markers,
      polylines: Set.of((_polyline != null) ? [_polyline] : []),
      onMapCreated: (GoogleMapController c) {
        controller = c;
      },
    );
  }


  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Future<Uint8List> convertAssetToUnit8List(String imagePath, {int width = 50}) async {
    ByteData data = await rootBundle.load(imagePath);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png)).buffer.asUint8List();
  }

  void setMarkerAndPolyline() async {
    Uint8List circleImageData = await convertAssetToUnit8List('assets/rideshare/images/current_place.png');
    Uint8List startCapImageData = await convertAssetToUnit8List('assets/rideshare/images/rider_car.png', width: 100);
    Uint8List endCapImageData = await convertAssetToUnit8List('assets/rideshare/images/end_destination.png', width: 100);

    // Polyline
    if (latLngLists.length > 0) {
      _polyline = Polyline(
        polylineId: PolylineId('polyline_id'),
        points: latLngLists,
        color: ColorResources.COLOR_PRIMARY,
        jointType: JointType.bevel,
        width: 5,
      );
    } else {
      _polyline = null;
    }

    // Marker
    _markers = HashSet<Marker>();
    for (int index = 0; index < latLngLists.length; index++) {

      final coordinates = new Coordinates(latLngLists[index].latitude, latLngLists[index].longitude);
      Address address;
      try{
        List<Address> addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
        address = addresses.first;
      }catch(e) {
      }

      _markers.add(Marker(
        markerId: MarkerId('marker_id_$index'),
        position: LatLng(latLngLists[index].latitude, latLngLists[index].longitude),
        infoWindow: InfoWindow(
          title: address != null ? address.featureName : '',
          snippet: address != null ? address.subAdminArea : '',
        ),
        flat: true,
        anchor: index == 0
            ? Offset(0.3, 0.9)
            : index == latLngLists.length - 1
            ? Offset(0.6, 0.2)
            : Offset(0.5, 0.5),
        rotation: 180,
        icon: BitmapDescriptor.fromBytes(index == 0
            ? startCapImageData
            : index == latLngLists.length - 1
            ? endCapImageData
            : circleImageData),
      ));
    }

    // Animate to coordinate
    if (controller != null && latLngLists.length != 0) {
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        bearing: 192.8334901395799,
        target: latLngLists[0],
        tilt: 0,
        zoom: 15,
      )));
    }
    setState(() {});
  }
}
