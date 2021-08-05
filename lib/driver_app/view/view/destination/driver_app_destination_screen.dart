import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/driver_app/view/view/destination/driverapp_destination_one_screen.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/driver_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/driver_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/driver_app/utility/strings.dart';
import 'package:flutter_ui_kit/driver_app/view/widget/custom_button.dart';
import 'package:flutter_ui_kit/driver_app/view/widget/custom_text_field.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverAppDestinationScreen extends StatelessWidget {
  final LatLng currentDeviceLatLng;
  final LatLng destinationLatLng;

  DriverAppDestinationScreen({this.currentDeviceLatLng, this.destinationLatLng});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
            color: ColorResources.COLOR_GRAY_LIGHT,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          Strings.choose_destination,
          style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_WHITE),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                    decoration: BoxDecoration(
                      color: ColorResources.COLOR_WHITE,
                      borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 9,
                          blurRadius: 7,
                          offset: Offset(0, 10), // changes position of shadow
                        ),
                      ],
                    ),
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
                                bottom: -30,
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: ColorResources.COLOR_PRIMARY,
                                ))
                          ],
                        ),
                        SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Strings.from,
                                style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY, fontSize: 13),
                              ),
                              CustomTextField(
                                hintText: Strings.address_four,
                                isBorder: false,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                        //padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                        decoration: BoxDecoration(
                          color: ColorResources.COLOR_WHITE,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: ColorResources.COLOR_PRIMARY,
                          radius: 3,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                    decoration: BoxDecoration(
                      color: ColorResources.COLOR_WHITE,
                      borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 9,
                          blurRadius: 7,
                          offset: Offset(10, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 8,
                              height: 15,
                              margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
                              child: Image.asset('assets/rideshare/images/location.png'),
                            ),
                            Positioned(
                                bottom: 30,
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: ColorResources.COLOR_PRIMARY,
                                )),
                          ],
                        ),
                        SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Strings.to,
                                style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY, fontSize: 13),
                              ),
                              CustomTextField(
                                hintText: Strings.address_five,
                                isBorder: false,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                  _searchText(Strings.address_three),
                  SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                  _searchText(Strings.address_four),
                  SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                  _searchText(Strings.address_five),
                  SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                  _searchText(Strings.address_one),
                ],
              ),
            ),
            CustomButton(
              btnTxt: Strings.done,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => DriverAppDestinationOneScreen(
                          currentDeviceLatLng: currentDeviceLatLng,
                          destinationLatLng: destinationLatLng,
                        )));
              },
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  Widget _searchText(String address) {
    return Row(
      children: [
        Icon(Icons.access_time_sharp, color: ColorResources.COLOR_GRAY_SIMPLE.withOpacity(.8), size: 22),
        SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
        Text(address, style: poppinsRegular.copyWith(height: 1.8))
      ],
    );
  }
}
