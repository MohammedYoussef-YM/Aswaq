import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationMap extends StatefulWidget {
  @override
  _CurrentPositionState createState() => _CurrentPositionState();
}

class _CurrentPositionState extends State<CurrentLocationMap> {

  Completer<GoogleMapController> _controllerGoogleMap=Completer();
  GoogleMapController _mapController;
  Position currentPositin;
  var geolocator = Geolocator();


  void _locatedPosition() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPositin = position;

    LatLng latlangPosition= LatLng(position.latitude, position.longitude);
    
    CameraPosition cameraPosition = new CameraPosition(target: latlangPosition,zoom: 14);
    _mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

  }

  static final CameraPosition _goolePlex = CameraPosition(
      target: LatLng(37.42236380142103, -122.08397168559924),
      zoom: 15);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            GoogleMap(
                myLocationEnabled: true,
                onMapCreated: (GoogleMapController controller){
                  _controllerGoogleMap.complete(controller);
                  _mapController = controller;
                },
                initialCameraPosition: _goolePlex),
            Positioned( bottom: 10, right: 60,
                child: FloatingActionButton(
                  onPressed:  _locatedPosition,
                  elevation: 5,
                  child: Icon(Icons.location_on),
                ),
            )
          ],
        ),
      )
    );
  }
}
