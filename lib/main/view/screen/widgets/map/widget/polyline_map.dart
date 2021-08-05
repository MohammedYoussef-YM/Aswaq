import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import 'dart:collection';
import 'dart:typed_data';
import 'dart:ui';

class PolylineMapWidget extends StatefulWidget {

  @override
  _TrackingMapWidgetState createState() => _TrackingMapWidgetState();
}

class _TrackingMapWidgetState extends State<PolylineMapWidget> {
  GoogleMapController _mapController;
  Set<Polyline> _polyline=HashSet<Polyline>();
  Set<Marker> _markers = HashSet<Marker>();
  LatLng _bdPoint = LatLng(23.781775981702292, 90.35255866621337);
  LatLng _endPoint = LatLng(23.78546743288411, 90.35880284876527);


  void _setPolyline(){
    List<LatLng> polylineLatLongs=[];
    polylineLatLongs.add(LatLng(23.78405369800732, 90.35380321118934));
    polylineLatLongs.add(LatLng(23.781736710381576, 90.35433965298934));
    polylineLatLongs.add(LatLng(23.782934480326716, 90.3558846053733));

    _polyline.add(
        Polyline(
            polylineId: PolylineId('0'),
            points: polylineLatLongs,
            color: Colors.red,
            width: 3)
    );
  }

  @override
  void initState() {
    super.initState();
    _setPolyline();
  }

  @override
  void dispose() {
    super.dispose();
    _mapController ?.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Polyline Map'),
        backgroundColor: Color(0xff5050D5),
      ),
      body:  GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target: _bdPoint, zoom: 18),
        zoomControlsEnabled: true,
        markers: _markers,
        polylines: _polyline,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
          setMarker();
        },
      ),
    );
  }

  void setMarker() async {
    Uint8List startImage = await convertAssetToUnit8List(
        'assets/restaurant/icon/marker.png', width: 50);

    // Animate to coordinate
    LatLngBounds bounds;
    if(_mapController != null) {
      if (_bdPoint.latitude < _endPoint.latitude) {
        bounds = LatLngBounds(southwest: _bdPoint, northeast: _endPoint);
      }else {
        bounds = LatLngBounds(southwest: _endPoint, northeast: _bdPoint);
      }
    }
    LatLng centerBounds = LatLng(
        (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
        (bounds.northeast.longitude + bounds.southwest.longitude) / 2
    );

    _mapController.moveCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: centerBounds, zoom: 17)));
    zoomToFit(_mapController, bounds, centerBounds);

    // Marker
    _markers = HashSet<Marker>();
    _markers.add(Marker(
      markerId: MarkerId('StartPoint'),
      position: _bdPoint,
      infoWindow: InfoWindow(
        title: 'StartPoint',
        snippet: 'View to The Australia',
      ),
      icon: BitmapDescriptor.fromBytes(startImage),
    ));

    setState(() {});
  }

  Future<void> zoomToFit(GoogleMapController controller, LatLngBounds bounds,
      LatLng centerBounds) async {
    bool keepZoomingOut = true;

    while (keepZoomingOut) {
      final LatLngBounds screenBounds = await controller.getVisibleRegion();
      if (fits(bounds, screenBounds)) {
        keepZoomingOut = false;
        final double zoomLevel = await controller.getZoomLevel() - 0.5;
        controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: centerBounds,
          zoom: zoomLevel,
        )));
        break;
      }
      else {
        // Zooming out by 0.1 zoom level per iteration
        final double zoomLevel = await controller.getZoomLevel() - 0.1;
        controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: centerBounds,
          zoom: zoomLevel,
        )));
      }
    }
  }

  bool fits(LatLngBounds fitBounds, LatLngBounds screenBounds) {
    final bool northEastLatitudeCheck = screenBounds.northeast.latitude >=
        fitBounds.northeast.latitude;
    final bool northEastLongitudeCheck = screenBounds.northeast.longitude >=
        fitBounds.northeast.longitude;

    final bool southWestLatitudeCheck = screenBounds.southwest.latitude <=
        fitBounds.southwest.latitude;
    final bool southWestLongitudeCheck = screenBounds.southwest.longitude <=
        fitBounds.southwest.longitude;

    return northEastLatitudeCheck && northEastLongitudeCheck &&
        southWestLatitudeCheck && southWestLongitudeCheck;
  }

  Future<Uint8List> convertAssetToUnit8List(String imagePath,
      {int width = 50}) async {
    ByteData data = await rootBundle.load(imagePath);
    Codec codec = await instantiateImageCodec(
        data.buffer.asUint8List(), targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png)).buffer
        .asUint8List();
  }
}
