import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/rideshare/provider/rideshare_destination_provider.dart';
import 'package:flutter_ui_kit/rideshare/provider/rideshare_home_provider.dart';
import 'package:flutter_ui_kit/rideshare/utility/colorResources.dart';
import 'package:flutter_ui_kit/rideshare/utility/dimensions.dart';
import 'package:flutter_ui_kit/rideshare/utility/strings.dart';
import 'package:flutter_ui_kit/rideshare/view/view/history/widget/distance_time_cash_widget.dart';
import 'package:flutter_ui_kit/rideshare/view/view/home/rideshare_homescreen.dart';
import 'package:flutter_ui_kit/rideshare/view/view/navigation_drawer/navigation_drawer.dart';
import 'package:flutter_ui_kit/rideshare/view/widget/menu_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TipsScreen extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(24.0178493, 90.4159996);

  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<RideShareHomeProvider>(context, listen: false).initializeAddres();
    return Scaffold(
      key: _drawerKey, // assign key to Scaffold
      drawer: NavigationDrawer(),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 16.0,
            ),
            mapType: MapType.terrain,
            markers: _markers,
            myLocationEnabled: false,
            zoomControlsEnabled: false,
          ),
          Container(
            alignment: Alignment.center,
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => RideShareHomeScreen()));
                },
                child: tipsWidget(context)),
          ),
          MenuWidget(drawerKey: _drawerKey),
        ],
      ),
    );
  }

  Widget tipsWidget(BuildContext context) {
    return Container(
      height: 280,
      width: 334,
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
      decoration: BoxDecoration(
          color: ColorResources.COLOR_WHITE,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(26.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                Strings.your_earned_tips,
                textAlign: TextAlign.center,
              )),
              InkWell(
                  onTap: () {
                    Provider.of<RideShareDestinationProvider>(context, listen: false).changeSelectIndex(0);
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => RideShareHomeScreen()), (route) => false);
                  },
                  child: Icon(Icons.close, color: ColorResources.COLOR_GRAY))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(Strings.bd, style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_DEEP, fontSize: Dimensions.FONT_SIZE_SMALL)),
              Text(Strings.digit_60, style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_PRIMARY, fontSize: 40.0)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/rideshare/images/tips.png',
                width: 30,
                height: 30,
                fit: BoxFit.fill,
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
              Image.asset(
                'assets/rideshare/images/tips.png',
                width: 30,
                height: 30,
                fit: BoxFit.fill,
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
              Image.asset(
                'assets/rideshare/images/tips.png',
                width: 30,
                height: 30,
                fit: BoxFit.fill,
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
              Image.asset(
                'assets/rideshare/images/tips.png',
                width: 30,
                height: 30,
                fit: BoxFit.fill,
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
              Image.asset(
                'assets/rideshare/images/tips.png',
                width: 30,
                height: 30,
                fit: BoxFit.fill,
              ),
            ],
          ),
          SizedBox(height: 40),
          Column(
            children: [
              Row(
                children: [
                  Expanded(child: DistanceTimeCashWidget(title: Strings.km4_8, subtitle: Strings.distance)),
                  Container(height: 70, width: 1, color: ColorResources.COLOR_GRAY.withOpacity(.2)),
                  Expanded(child: DistanceTimeCashWidget(title: Strings.min_30, subtitle: Strings.time)),
                  Container(height: 70, width: 1, color: ColorResources.COLOR_GRAY.withOpacity(.2)),
                  Expanded(child: DistanceTimeCashWidget(title: Strings.tk_120, subtitle: Strings.cash_trip)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
