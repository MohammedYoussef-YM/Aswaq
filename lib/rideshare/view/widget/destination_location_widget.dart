import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/driver_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/driver_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/driver_app/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';

class DestinationLocationWidget extends StatelessWidget {
  final String fromLocationAddress;
  final String toLocationAddress;
  final bool isShowFromTo;

  DestinationLocationWidget({this.fromLocationAddress, this.toLocationAddress, this.isShowFromTo = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          alignment: Alignment.center,
          child: Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    child: CircularProgressIndicator(
                      value: 1,
                      strokeWidth: 3,
                      valueColor: new AlwaysStoppedAnimation<Color>(ColorResources.COLOR_PRIMARY),
                    ),
                  ),
                  Positioned(
                      bottom: -15,
                      child: CircleAvatar(
                        radius: 2,
                        backgroundColor: ColorResources.COLOR_PRIMARY,
                      ))
                ],
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isShowFromTo
                        ? Text(Strings.from, style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY, fontSize: 13))
                        : SizedBox.shrink(),
                    Text(
                      fromLocationAddress ?? Strings.address_one,
                      style: poppinsRegular,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          height: 1,
          color: ColorResources.COLOR_GRAY.withOpacity(.3),
          margin: EdgeInsets.only(
              left: 30,
              right: Dimensions.PADDING_SIZE_DEFAULT,
              top: Dimensions.PADDING_SIZE_EXTRA_SMALL,
              bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL),
        ),
        Container(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(),
                  Positioned(
                      left: -5,
                      top: -8,
                      child: Icon(
                        Icons.location_on,
                        color: ColorResources.COLOR_PRIMARY,
                        size: 15,
                      )),
                  Positioned(
                      bottom: 20,
                      child: CircleAvatar(
                        radius: 2,
                        backgroundColor: ColorResources.COLOR_PRIMARY,
                      )),
                ],
              ),
              SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isShowFromTo
                        ? Text(Strings.to, style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY, fontSize: 13))
                        : SizedBox.shrink(),
                    Text(
                      toLocationAddress ?? Strings.address_three,
                      style: poppinsRegular,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
