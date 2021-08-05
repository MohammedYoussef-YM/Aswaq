import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/address_model.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/repository/location_repo.dart';
import 'package:flutter_ui_kit/restaurant/data/repository/response_model.dart';
import 'package:flutter_ui_kit/restaurant/utill/app_constants.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestLocationProvider with ChangeNotifier {
  final SharedPreferences sharedPreferences;
  final RestLocationRepo locationRepo;

  RestLocationProvider({@required this.sharedPreferences, this.locationRepo});

  Position _position = Position(longitude: 0, latitude: 0, timestamp: DateTime.now(), accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1);
  Position get position => _position;
  Address _address = Address();
  Address get address => _address;
  List<Marker> _markers = <Marker>[];
  List<Marker> get markers => _markers;

  // for get current location
  void getCurrentLocation({GoogleMapController mapController}) async {
    try {
      Geolocator.getCurrentPosition().then((newLocalData) async {
        if (mapController != null) {
          mapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(bearing: 192.8334901395799, target: LatLng(newLocalData.latitude, newLocalData.longitude), tilt: 0, zoom: 16.00)));
          _position = newLocalData;

          final currentCoordinates = new Coordinates(newLocalData.latitude, newLocalData.longitude);
          var currentAddresses = await Geocoder.local.findAddressesFromCoordinates(currentCoordinates);
          _address = currentAddresses.first;
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
    notifyListeners();
  }

  // update Position
  void updatePosition(CameraPosition position) async {
    _position = Position(
      latitude: position.target.latitude, longitude: position.target.longitude, timestamp: DateTime.now(),
      heading: 1, accuracy: 1, altitude: 1, speedAccuracy: 1, speed: 1,
    );
    notifyListeners();
  }

  // End Address Position
  void dragableAddress() async {
    final currentCoordinates = new Coordinates(_position.latitude, _position.longitude);
    var currentAddresses = await Geocoder.local.findAddressesFromCoordinates(currentCoordinates);
    _address = currentAddresses.first;
    notifyListeners();
  }

  // delete usser address
  void deleteUserAddressByID(int id, int index, Function callback) async {
    _addressList.removeAt(index);
    callback(true, 'Deleted address successfully');
    notifyListeners();
  }

  bool _isAvaibleLocation = false;

  bool get isAvaibleLocation => _isAvaibleLocation;

  // user address
  List<AddressModel> _addressList = [];

  List<AddressModel> get addressList => _addressList;

  void initAddressList() async {
    ApiResponse apiResponse = await locationRepo.getAllAddress();
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _addressList = [];
      apiResponse.response.data.forEach((address) => _addressList.add(address));
      notifyListeners();
    } else {
      print(apiResponse.error.toString());
    }
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  String _addressStatusMessage = '';
  String get addressStatusMessage => _addressStatusMessage;
  updateAddressStatusMessae({String message}){
    _addressStatusMessage = message;
    notifyListeners();
  }
  updateErrorMessage({String message}){
    _errorMessage = message;
    notifyListeners();
  }

  Future<ResponseModel> addAddress(AddressModel addressModel) async {
    _isLoading = true;
    notifyListeners();
    _errorMessage = '';
    _addressStatusMessage = null;
    _isLoading = false;
    ResponseModel responseModel;
    if (_addressList == null) {
      _addressList = [];
    }
    _addressList.add(addressModel);
    responseModel = ResponseModel('Successful', true);
    _addressStatusMessage = 'Successful';
    notifyListeners();
    return responseModel;
  }

  // for address update screen
  Future<ResponseModel> updateAddress({AddressModel addressModel, int addressId}) async {
    _isLoading = true;
    notifyListeners();
    _errorMessage = '';
    _addressStatusMessage = null;
    _isLoading = false;
    ResponseModel responseModel;
    responseModel = ResponseModel('Successful', true);
    _addressStatusMessage = 'Successful';
    notifyListeners();
    return responseModel;
  }

  // for save user address Section
  Future<void> saveUserAddress({Address address}) async {
    String userAddress = jsonEncode(address);
    try {
      await sharedPreferences.setString(RestAppConstants.USER_ADDRESS, userAddress);
    } catch (e) {
      throw e;
    }
  }

  String getUserAddress() {
    return sharedPreferences.getString(RestAppConstants.USER_ADDRESS) ?? "";
  }

  // for Label Us
  List<String> _getAllAddressType = [];

  List<String> get getAllAddressType => _getAllAddressType;
  int _selectAddressIndex = 0;

  int get selectAddressIndex => _selectAddressIndex;
  String _addressType = '';

  String get addressType => _addressType;

  updateAddressIndex(int index) {
    _selectAddressIndex = index;
    _addressType = _getAllAddressType[index];
    notifyListeners();
  }

  initializeAllAddressType({BuildContext context}) {
    if (_getAllAddressType.length == 0) {
      _getAllAddressType.clear();
      _getAllAddressType = locationRepo.getAllAddressType(context: context);
      _addressType = locationRepo.getAllAddressType(context: context)[0];
      notifyListeners();
    }
  }

}
