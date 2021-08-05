import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantDeliveryBoyLocationProvider with ChangeNotifier {
  final SharedPreferences sharedPreferences;

  RestaurantDeliveryBoyLocationProvider({@required this.sharedPreferences});

  Address _address = Address();

  Address get address => _address;
  Position currentLocation;

  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    final currentCoordinates = new Coordinates(currentLocation.latitude, currentLocation.longitude);
    var currentAddresses = await Geocoder.local.findAddressesFromCoordinates(currentCoordinates);
    _address = currentAddresses.first;
    notifyListeners();
  }
}
