import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/rideshare/utility/colorResources.dart';
import 'package:flutter_ui_kit/rideshare/utility/dimensions.dart';
import 'package:flutter_ui_kit/rideshare/view/widget/destination_location_widget.dart';
import 'package:geocoder/geocoder.dart';

class DestinationWidget extends StatelessWidget {
  final bool isTransparentShadow;
  final Address driverAddress;
  final Address userAddress;

  DestinationWidget({this.isTransparentShadow = false, this.userAddress, this.driverAddress});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorResources.COLOR_WHITE,
        borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT),
        boxShadow: [
          BoxShadow(
            color: !isTransparentShadow ? Colors.grey.withOpacity(0.2) : Colors.transparent,
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DestinationLocationWidget(
            fromLocationAddress: '${driverAddress.featureName ?? ''} , ${driverAddress.subAdminArea ?? ''}',
            toLocationAddress: '${userAddress.featureName ?? ''} , ${userAddress.subAdminArea ?? ''}',
            isShowFromTo: true,
          ),
        ],
      ),
    );
  }
}
