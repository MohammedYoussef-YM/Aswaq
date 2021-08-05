import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/view/widget/custom_text_field.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressWidget extends StatelessWidget {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.421997, -122.084100),
    zoom: 15,
  );
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.symmetric(vertical: HouseHoldDimensions.PADDING_SIZE_LARGE), children: [
      Text(Strings.service_location, style: manropeMedium.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),
      SizedBox(height: 10),
      Container(
        height: 200,
        padding: EdgeInsets.all(HouseHoldDimensions.PADDING_SIZE_EXTRA_SMALL),
        decoration: BoxDecoration(
          color: HouseHoldColorResources.COLOR_WHITE,
          borderRadius: BorderRadius.circular(HouseHoldDimensions.PADDING_SIZE_EXTRA_SMALL),
        ),
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          indoorViewEnabled: true,
          onMapCreated: (GoogleMapController controller) {},
        ),
      ),
      SizedBox(height: 20),

      Text(Strings.phone_number, style: manropeMedium.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),
      SizedBox(height: 10),
      CustomTextField(
        isBorder: false,
        prefixIcon: Icon(Icons.call_outlined, color: HouseHoldColorResources.COLOR_CRANBERRY),
        hintText: Strings.phone_number_one,
        inputAction: TextInputAction.next,
        inputType: TextInputType.phone,
        controller: _phoneController,
        focusNode: _phoneFocus,
        nextFocus: _addressFocus,
      ),
      SizedBox(height: 10),
      Text(Strings.your_address, style: manropeMedium.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),
      SizedBox(height: 10),
      CustomTextField(
        isBorder: false,
        prefixIcon: Icon(Icons.location_on, color: HouseHoldColorResources.COLOR_CRANBERRY),
        hintText: Strings.lorem__ips,
        inputAction: TextInputAction.done,
        controller: _addressController,
        focusNode: _addressFocus,
      ),
    ]);
  }
}
