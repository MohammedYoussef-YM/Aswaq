import 'dart:async';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_kit/rideshare/provider/rideshare_home_provider.dart';
import 'package:flutter_ui_kit/rideshare/view/view/destination/rideshare_destination_one_screen.dart';
import 'package:flutter_ui_kit/rideshare/view/view/navigation_drawer/navigation_drawer.dart';
import 'package:flutter_ui_kit/rideshare/view/widget/menu_widget.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui_kit/all_app_screen.dart';

class RideShareHomeScreen extends StatefulWidget {
  @override
  _RideShareHomeScreenState createState() => _RideShareHomeScreenState();
}

class _RideShareHomeScreenState extends State<RideShareHomeScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  GoogleMapController _controller;
  double deviceLatitude;
  double deviceLontidute;
  double newDeviceLatitude;
  double newDeviceLontudute;
  Address currentAddress;
  Address destinationAddress;

  //Marker _marker;
  Position position = Position(longitude: 0, latitude: 0, timestamp: DateTime.now(), accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1);

  List<Marker> _markers = <Marker>[];

  void getCurrentLocation(GoogleMapController _controller) async {
    try {
      Geolocator.getCurrentPosition().then((newLocalData) async {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(bearing: 192.8334901395799, target: LatLng(newLocalData.latitude, newLocalData.longitude), tilt: 0, zoom: 16.00)));
          position = newLocalData;


          final driverCoordinates = new Coordinates(newLocalData.latitude, newLocalData.longitude);
          var driverAddresses = await Geocoder.local.findAddressesFromCoordinates(driverCoordinates);
          final userCoordinates = new Coordinates(newLocalData.latitude + 0.005, newLocalData.longitude + 0.005);
          var userAddresses = await Geocoder.local.findAddressesFromCoordinates(userCoordinates);
          var first = driverAddresses.first;

          deviceLatitude = newLocalData.latitude;
          deviceLontidute = newLocalData.longitude;
          newDeviceLatitude = newLocalData.longitude + 0.005;
          newDeviceLontudute = newLocalData.longitude + 0.005;
          currentAddress = driverAddresses.first;
          destinationAddress = userAddresses.first;

          _markers.add(Marker(
            markerId: MarkerId(newLocalData.latitude.toString()),
            position: LatLng(newLocalData.latitude, newLocalData.longitude),
            infoWindow: InfoWindow(title: first.featureName, snippet: first.subAdminArea),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => RideShareDestinationScreenOne(
                        currentDeviceLatLng: LatLng(newLocalData.latitude, newLocalData.longitude),
                        destinationLatLng: LatLng(newLocalData.latitude + 0.005, newLocalData.longitude + 0.005),
                        driverAddress: driverAddresses.first,
                        userAddress: userAddresses.first,
                      )));
            },
            icon: await convertImageFileToBitmapDescriptor(
              'assets/rideshare/images/rider_car.png',
            ),
          ));
          setState(() {});
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation(_controller);
    Provider.of<RideShareHomeProvider>(context, listen: false).initializeAddres();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => RideShareDestinationScreenOne(
            currentDeviceLatLng: LatLng(deviceLatitude??23.8103, deviceLontidute??90.4125),
            destinationLatLng: LatLng(newDeviceLatitude??23.8203, newDeviceLontudute??90.425),
            driverAddress: currentAddress??Address(featureName: 'New York', subAdminArea: 'USA'),
            userAddress: destinationAddress??Address(featureName: 'Denvar', subAdminArea: 'USA'),
          )));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => AllAppScreen()), (route) => false) ?? false;
      },
      child: Scaffold(
        key: _drawerKey, // assign key to Scaffold
        drawer: NavigationDrawer(),
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(position.latitude ?? 0.0, position.longitude ?? 0.0),
                zoom: 12,
              ),
              zoomControlsEnabled: false,
              compassEnabled: false,
              indoorViewEnabled: true,
              mapToolbarEnabled: true,
              markers: Set<Marker>.of(_markers),
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
            ),
            MenuWidget(drawerKey: _drawerKey),
          ],
        ),
      ),
    );
  }

  Future<BitmapDescriptor> convertImageFileToBitmapDescriptor(String imageFile,
      {int size = 150,
      bool addBorder = false,
      Color borderColor = Colors.white,
      double borderSize = 10,
      String title,
      Color titleColor = Colors.white,
      Color titleBackgroundColor = Colors.black}) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color;
    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );
    final double radius = size / 2;

    //make canvas clip path to prevent image drawing over the circle
    final Path clipPath = Path();
    clipPath.addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.toDouble(), size.toDouble()), Radius.circular(100)));
    clipPath.addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, size * 8 / 10, size.toDouble(), size * 3 / 10), Radius.circular(100)));
    canvas.clipPath(clipPath);

    //paintImage
    ByteData data = await rootBundle.load(imageFile);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: 100);
    final ui.FrameInfo imageFI = await codec.getNextFrame();
    paintImage(canvas: canvas, fit: BoxFit.scaleDown, rect: Rect.fromLTWH(0, 0, size.toDouble(), size.toDouble()), image: imageFI.image);

    if (addBorder) {
      //draw Border
      paint..color = borderColor;
      paint..style = PaintingStyle.stroke;
      paint..strokeWidth = borderSize;
      canvas.drawCircle(Offset(radius, radius), radius, paint);
    }

    if (title != null) {
      if (title.length > 9) {
        title = title.substring(0, 9);
      }
      //draw Title background
      paint..color = titleBackgroundColor;
      paint..style = PaintingStyle.fill;
      canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, size * 8 / 10, size.toDouble(), size * 3 / 10), Radius.circular(100)), paint);

      //draw Title
      textPainter.text = TextSpan(
          text: title,
          style: TextStyle(
            fontSize: radius / 2.5,
            fontWeight: FontWeight.bold,
            color: titleColor,
          ));
      textPainter.layout();
      textPainter.paint(canvas, Offset(radius - textPainter.width / 2, size * 9.5 / 10 - textPainter.height / 2));
    }

    //convert canvas as PNG bytes
    final _image = await pictureRecorder.endRecording().toImage(size, (size * 1.1).toInt());
    final dataa = await _image.toByteData(format: ui.ImageByteFormat.png);

    //convert PNG bytes as BitmapDescriptor
    return BitmapDescriptor.fromBytes(dataa.buffer.asUint8List());
  }
}
