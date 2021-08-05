import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import 'dart:collection';
import 'dart:typed_data';
import 'dart:ui';

class MultipleMarker extends StatefulWidget {

  @override
  _TrackingMapWidgetState createState() => _TrackingMapWidgetState();
}

class _TrackingMapWidgetState extends State<MultipleMarker> {
  GoogleMapController _mapController;
  Set<Polyline> _polyline=HashSet<Polyline>();
  Set<Marker> _markers = HashSet<Marker>();
  LatLng _startPoint=LatLng(-24.62131652550684, 134.49176913863505);
  LatLng _endPoint=LatLng(48.85440332913087, 63.47614451846606);
  LatLng _indiaPoint=LatLng(22.824846705683477, 79.70427301412212);
  LatLng _bdPoint=LatLng(24.1481058052766, 89.73537054994269);
  LatLng _chinaPoint=LatLng(36.15715494482757, 102.72511628183041);
  LatLng _pakPoint=LatLng(29.935825982042797, 69.20939853937455);


  void _setPolyline(){
    List<LatLng> polylineLatLongs= [];
    polylineLatLongs.add(LatLng(-24.62131652550684, 134.49176913863505));
    polylineLatLongs.add(LatLng(48.85440332913087, 63.47614451846606));
    polylineLatLongs.add(LatLng(36.15715494482757, 102.72511628183041));

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
        title: Text('Google Map'),
        backgroundColor: Color(0xff5050D5),
      ),
      body:  GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target: _bdPoint, zoom: 18),
        zoomControlsEnabled: true,
        markers: _markers,
        polylines: _polyline,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
          setMarker();
        },
      ),
    );
  }

  void setMarker() async {
    Uint8List startImage = await convertAssetToUnit8List('assets/rideshare/images/end_destination.png', width: 50);
    Uint8List endImage = await convertAssetToUnit8List('assets/rideshare/images/location.png', width: 50);
    Uint8List indiaImage = await convertAssetToUnit8List('assets/restaurant/icon/marker.png', width: 50);
    Uint8List bdImage = await convertAssetToUnit8List('assets/rideshare/images/location.png', width: 50);
    Uint8List chinaImage = await convertAssetToUnit8List('assets/restaurant/icon/marker.png', width: 50);
    Uint8List pakImage = await convertAssetToUnit8List('assets/rideshare/images/end_destination.png', width: 50);

    // Animate to coordinate
    LatLngBounds bounds;
    double _rotation = 0;
    if(_mapController != null) {
      if (_startPoint.latitude < _endPoint.latitude) {
        bounds = LatLngBounds(southwest: _startPoint, northeast: _endPoint);
        _rotation = 0;
      }else {
        bounds = LatLngBounds(southwest: _endPoint, northeast: _startPoint);
        _rotation = 180;
      }
    }
    LatLng centerBounds = LatLng(
        (bounds.northeast.latitude + bounds.southwest.latitude)/2,
        (bounds.northeast.longitude + bounds.southwest.longitude)/2
    );

    _mapController.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(target: centerBounds, zoom: 17)));
    zoomToFit(_mapController, bounds, centerBounds);

    // Marker
    _markers = HashSet<Marker>();
    _markers.add(Marker(
      markerId: MarkerId('StartPoint'),
      position: _startPoint,
      infoWindow: InfoWindow(
        title: 'StartPoint',
        snippet: 'View to The Australia',
      ),
      icon: BitmapDescriptor.fromBytes(startImage),
    ));

    _markers.add(Marker(
      markerId: MarkerId('EndPoint'),
      position: _endPoint,
      infoWindow: InfoWindow(
        title: 'EndPoint',
        snippet: 'View to The Kazakhstan',
      ),
      rotation: _rotation,
      icon: BitmapDescriptor.fromBytes(endImage),
    ));

    _markers.add(Marker(
      markerId: MarkerId('IndiaPoint'),
      position: _indiaPoint,
      infoWindow: InfoWindow(
        title: 'IndiaPoint',
        snippet: 'View to The India',
      ),
      icon: BitmapDescriptor.fromBytes(indiaImage),
    ));



    _markers.add(Marker(
      markerId: MarkerId('Bangladesh'),
      position: _bdPoint,
      infoWindow: InfoWindow(
        title: 'Bangladesh',
        snippet: 'View to The Bangladesh',
      ),
      rotation: _rotation,
      icon: BitmapDescriptor.fromBytes(bdImage),
    ));

    _markers.add(Marker(
      markerId: MarkerId('ChinaPoint'),
      position: _chinaPoint,
      infoWindow: InfoWindow(
        title: 'ChinaPoint',
        snippet: 'View to the China',
      ),
      rotation: _rotation,
      icon: BitmapDescriptor.fromBytes(chinaImage),
    ));

    _markers.add(Marker(
      markerId: MarkerId('Pakistan'),
      position: _pakPoint,
      infoWindow: InfoWindow(
        title: 'Pakistan',
        snippet: 'View to the Pakistan',
      ),
      rotation: _rotation,
      icon: BitmapDescriptor.fromBytes(pakImage),
    ));

    setState(() {});
  }

  Future<void> zoomToFit(GoogleMapController controller, LatLngBounds bounds, LatLng centerBounds) async {
    bool keepZoomingOut = true;

    while(keepZoomingOut) {
      final LatLngBounds screenBounds = await controller.getVisibleRegion();
      if(fits(bounds, screenBounds)){
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
    final bool northEastLatitudeCheck = screenBounds.northeast.latitude >= fitBounds.northeast.latitude;
    final bool northEastLongitudeCheck = screenBounds.northeast.longitude >= fitBounds.northeast.longitude;

    final bool southWestLatitudeCheck = screenBounds.southwest.latitude <= fitBounds.southwest.latitude;
    final bool southWestLongitudeCheck = screenBounds.southwest.longitude <= fitBounds.southwest.longitude;

    return northEastLatitudeCheck && northEastLongitudeCheck && southWestLatitudeCheck && southWestLongitudeCheck;
  }

  Future<Uint8List> convertAssetToUnit8List(String imagePath, {int width = 50}) async {
    ByteData data = await rootBundle.load(imagePath);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png)).buffer.asUint8List();
  }
}
