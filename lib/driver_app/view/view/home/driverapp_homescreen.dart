import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_kit/driver_app/provider/driverapp_home_provider.dart';
import 'package:flutter_ui_kit/driver_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/driver_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/driver_app/utility/strings.dart';
import 'package:flutter_ui_kit/driver_app/view/view/destination/driver_app_destination_screen.dart';
import 'package:flutter_ui_kit/driver_app/view/view/destination/driverapp_destination_one_screen.dart';
import 'package:flutter_ui_kit/driver_app/view/view/navigation_drawer/navigation_drawer.dart';
import 'package:flutter_ui_kit/driver_app/view/widget/menu_widget.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui_kit/all_app_screen.dart';
import 'dart:ui' as ui;

// ignore: must_be_immutable
class DriverAppHomeScreen extends StatefulWidget {
  @override
  _DriverAppHomeScreenState createState() => _DriverAppHomeScreenState();
}

class _DriverAppHomeScreenState extends State<DriverAppHomeScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  GoogleMapController _controller;

  LatLng currentDeviceLatLng;
  LatLng destinationDeviceLatLng;

  //Marker _marker;
  Position position = Position(longitude: 0, latitude: 0, timestamp: DateTime.now(), accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1);
  List<Marker> _markers = <Marker>[];

  void _add(Position p) async {
    var rng = new Random();
    Position pn = Position(latitude: p.latitude + rng.nextDouble() * 0.005, longitude: p.longitude + rng.nextDouble() * 0.005,
      timestamp: DateTime.now(), heading: 1, accuracy: 1, altitude: 1, speedAccuracy: 1, speed: 1);

    currentDeviceLatLng = LatLng(p.latitude, p.longitude);
    destinationDeviceLatLng = LatLng(pn.latitude, pn.longitude);

    for (int i = 0; i <= 10; i++) {
      final coordinates = new Coordinates(pn.latitude, pn.longitude);
      var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;

      _markers.add(Marker(
        markerId: MarkerId(i.toString()),
        position: LatLng(pn.latitude, pn.longitude),
        infoWindow: InfoWindow(title: first.featureName, snippet: first.subAdminArea),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => DriverAppDestinationOneScreen(
                    currentDeviceLatLng: LatLng(p.latitude, p.longitude),
                    destinationLatLng: LatLng(pn.latitude, pn.longitude),
                  )));
        },
        icon: await convertImageFileToBitmapDescriptor(
          i == 0
              ? 'assets/rideshare/images/car_small.png'
              : i == 2
                  ? 'assets/rideshare/images/scooter.png'
                  : i == 5
                      ? 'assets/rideshare/images/car_left.png'
                      : 'assets/rideshare/images/car_right.png',
        ),
      ));

      setState(() {
        pn = Position(latitude: pn.latitude + rng.nextDouble() * 0.005, longitude: pn.longitude + rng.nextDouble() * 0.005,
            timestamp: DateTime.now(), heading: 1, accuracy: 1, altitude: 1, speedAccuracy: 1, speed: 1);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<DriverAppHomeProvider>(context, listen: false).initializeAddres();
    return WillPopScope(
      onWillPop: () {
        return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => AllAppScreen()), (route) => false);
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
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 230,
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  decoration: BoxDecoration(
                      color: ColorResources.COLOR_WHITE,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(26.0),
                        topLeft: Radius.circular(26.0),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Container(
                        height: 55,
                        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                        decoration: BoxDecoration(
                            color: ColorResources.COLOR_SEARCH_BACKGROUND, borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL)),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => DriverAppDestinationScreen(
                                      currentDeviceLatLng: currentDeviceLatLng,
                                      destinationLatLng: destinationDeviceLatLng,
                                    )));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: ColorResources.COLOR_PRIMARY,
                                    radius: 5,
                                  ),
                                  SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                                  Text(
                                    Strings.where_to,
                                    style:
                                        poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE, color: ColorResources.COLOR_GRAY_SIMPLE),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.search,
                                color: ColorResources.COLOR_PRIMARY,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 100,
                        width: double.infinity,
                        child: Consumer<DriverAppHomeProvider>(
                          builder: (context, homeProvider, child) => ListView.builder(
                              itemCount: homeProvider.allAddressModel.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => DriverAppDestinationOneScreen(
                                        currentDeviceLatLng: currentDeviceLatLng,
                                        destinationLatLng: destinationDeviceLatLng,
                                      )));
                                    },
                                    child: Container(
                                      width: 200,
                                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                                      margin: EdgeInsets.only(
                                          right: Dimensions.PADDING_SIZE_DEFAULT,
                                          bottom: Dimensions.PADDING_SIZE_DEFAULT,
                                          top: Dimensions.PADDING_SIZE_SMALL),
                                      decoration: BoxDecoration(
                                        color: homeProvider.selectIndex == index ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_WHITE,
                                        borderRadius: BorderRadius.circular(6.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            homeProvider.allAddressModel[index].iconData,
                                            color: homeProvider.selectIndex == index
                                                ? ColorResources.COLOR_WHITE
                                                : ColorResources.COLOR_GRAY_SIMPLE.withOpacity(.8),
                                            size: 30,
                                          ),
                                          SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  homeProvider.allAddressModel[index].name,
                                                  style: poppinsRegular.copyWith(
                                                      color: homeProvider.selectIndex == index
                                                          ? ColorResources.COLOR_WHITE
                                                          : ColorResources.COLOR_PRIMARY,
                                                      fontSize: 13),
                                                ),
                                                Text(
                                                  homeProvider.allAddressModel[index].address,
                                                  style: poppinsRegular.copyWith(
                                                      color:
                                                          homeProvider.selectIndex == index ? ColorResources.COLOR_WHITE : ColorResources.COLOR_GRAY,
                                                      fontSize: Dimensions.FONT_SIZE_SMALL),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
                right: Dimensions.PADDING_SIZE_DEFAULT,
                bottom: 250,
                child: InkWell(
                  onTap: () {
                    getCurrentLocation();
                    Provider.of<DriverAppHomeProvider>(context, listen: false).updateSelectIndex(-1);
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: ColorResources.COLOR_PRIMARY,
                    child: Icon(
                      Icons.gps_fixed,
                      color: ColorResources.COLOR_WHITE,
                      size: 20,
                    ),
                  ),
                )),
            MenuWidget(drawerKey: _drawerKey),
          ],
        ),
      ),
    );
  }

  void getCurrentLocation() async {
    try {
      Geolocator.getCurrentPosition().then((newLocalData) {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(bearing: 192.8334901395799, target: LatLng(newLocalData.latitude, newLocalData.longitude), tilt: 0, zoom: 16.00)));
        }
        setState(() {
          position = Position(
            latitude: newLocalData.latitude,
            longitude: newLocalData.longitude,
              timestamp: DateTime.now(), heading: 1, accuracy: 1, altitude: 1, speedAccuracy: 1, speed: 1
          );
        });
        _markers = [];
        _add(newLocalData);
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
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
