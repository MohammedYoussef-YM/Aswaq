import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/provider/checkout_provider.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/views/home/widgets/search_widget.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_text_field.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddNewAddressScreen extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(24.0178493, 90.4159996);

  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<CheckoutProvider>(context, listen: false).initializeAddressTypeIcon();
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 16.0,
            ),
            mapType: MapType.satellite,
            markers: _markers,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
          ),
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 6,
                  blurRadius: 8,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
          SafeArea(
              child: Column(
            children: [
              SizedBox(
                height: Dimensions.PADDING_SIZE_LARGE,
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back, color: ColorResources.COLOR_WHITE, size: 20),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.only(right: Dimensions.PADDING_SIZE_DEFAULT),
                          child: SearchWidget(
                            hintText: Strings.type_location_you_want,
                          ))),
                ],
              ),
              Expanded(child: SizedBox.shrink()),
              Container(
                height: 340,
                width: double.infinity,
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                decoration: BoxDecoration(
                    color: ColorResources.COLOR_WHITE,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.PADDING_SIZE_LARGE), topLeft: Radius.circular(Dimensions.PADDING_SIZE_LARGE))),
                child: Column(
                  children: [
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Strings.clear, style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY.withOpacity(.8))),
                        Text(Strings.add_new_address,
                            style: poppinsRegular.copyWith(color: ColorResources.COLOR_LIGHT_BLACK, fontSize: Dimensions.FONT_SIZE_LARGE)),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(Strings.save, style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY)),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                    Row(
                      children: [
                        Expanded(
                          child: Consumer<CheckoutProvider>(
                            builder: (context, checkoutProvider, child) => Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              //decoration: BoxDecoration(color: ColorResources.COLOR_CART_BACKGROUND, borderRadius: BorderRadius.circular(10)),

                              // dropdown below..
                              child: DropdownButton<IconData>(
                                  value: checkoutProvider.initializeIconData,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  iconSize: 30,
                                  isExpanded: true,
                                  underline: SizedBox(),
                                  onChanged: checkoutProvider.changeAddressType,
                                  items: checkoutProvider.getAllAddressTypeIcon.map<DropdownMenuItem<IconData>>((IconData value) {
                                    return DropdownMenuItem<IconData>(
                                      value: value,
                                      child: Icon(
                                        value,
                                        color: ColorResources.COLOR_GRAY,
                                      ),
                                    );
                                  }).toList()),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: CustomTextField(
                              hintText: Strings.name_of_address,
                            )),
                      ],
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                    Row(
                      children: [
                        Expanded(
                            child: CustomTextField(
                          hintText: Strings.your_address,
                        )),
                        SizedBox(
                          width: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                        ),
                        Container(
                          width: 42,
                          height: 42,
                          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          decoration:
                              BoxDecoration(color: ColorResources.COLOR_PRIMARY, borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL)),
                          child: Icon(
                            Icons.location_searching,
                            color: ColorResources.COLOR_WHITE.withOpacity(.8),
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                    Container(
                      padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorResources.COLOR_LIGHT_GRAY),
                          borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL)),
                      child: Row(
                        children: [
                          CountryCodePicker(
                            onChanged: print,
                            initialSelection: 'BD',
                            favorite: ['+88', 'BD'],
                            showCountryOnly: false,
                            textStyle: poppinsRegular.copyWith(
                              fontSize: 13,
                            ),
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                          ),
                          Expanded(
                            child: CustomTextField(
                              hintText: Strings.phone_number,
                              inputType: TextInputType.phone,
                              //focusNode: _phoneNumberFocus,
                              isCountryPicker: true,
                              isBorder: false,
                              //nextFocus: _dateFocus,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                    Consumer<CheckoutProvider>(
                      builder: (context, checkoutProvider, child) => InkWell(
                        onTap: () {
                          checkoutProvider.toggolDeliveryAddress();
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: !checkoutProvider.isDefaultDeliveryAddress
                                      ? Border.all(color: ColorResources.COLOR_GRAY.withOpacity(.2))
                                      : null,
                                  color: checkoutProvider.isDefaultDeliveryAddress ? ColorResources.COLOR_PRIMARY : null),
                              child: checkoutProvider.isDefaultDeliveryAddress
                                  ? Icon(
                                      Icons.done,
                                      color: ColorResources.COLOR_WHITE,
                                      size: 10,
                                    )
                                  : SizedBox.shrink(),
                            ),
                            SizedBox(
                              width: Dimensions.PADDING_SIZE_DEFAULT,
                            ),
                            Text(
                              Strings.default_delivery_address,
                              style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
