import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/address_model.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/location_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_app_bar.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_snackbar.dart';
import 'package:flutter_ui_kit/restaurant/view/base/no_data_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'add_new_address_screen.dart';

class AddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<RestLocationProvider>(context, listen: false).initAddressList();

    return Scaffold(
      appBar: CustomAppBar(title: getTranslated('address', context)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddNewAddressScreen())),
      ),
      body: Consumer<RestLocationProvider>(
        builder: (context, locationProvider, child) {
          return locationProvider.addressList != null
              ? locationProvider.addressList.length > 0
              ? ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            itemCount: locationProvider.addressList.length,
            itemBuilder: (context, index) => addressWidget(
                addressModel: locationProvider.addressList[index],
                context: context,
                index: index),
          )
              : NoDataScreen()
              : Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)));
        },
      ),
    );
  }

  Widget addressWidget({AddressModel addressModel, BuildContext context, int index}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
      margin: EdgeInsets.only(bottom: 8.0),
      height: 70,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL), color: ColorResources.getSearchBg(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                Image.asset(
                  addressModel.addressType.toLowerCase() == "home"
                      ? Images.home_icon
                      : addressModel.addressType.toLowerCase() == "workplace"
                      ? Images.workplace
                      : Images.location,
                  color: Theme.of(context).textTheme.bodyText1.color.withOpacity(.45),
                  width: 20,
                  height: 20,
                ),
                SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        addressModel.addressType,
                        style: Theme.of(context).textTheme.headline2.copyWith(color: Theme.of(context).textTheme.bodyText1.color.withOpacity(.65)),
                      ),
                      Text(
                        addressModel.address,
                        style: Theme.of(context).textTheme.headline2.copyWith(color: Theme.of(context).textTheme.bodyText1.color),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Container(
                  width: 52,
                  margin: EdgeInsets.only(right: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(double.parse(addressModel.latitude) ?? 0.0, double.parse(addressModel.longitude) ?? 0.0),
                        zoom: 12,
                      ),
                      zoomControlsEnabled: false,
                      compassEnabled: false,
                      indoorViewEnabled: false,
                      mapToolbarEnabled: false,
                      onMapCreated: (GoogleMapController controller) {},
                    ),
                  ),
                ),
              ),
              //SizedBox(width: 9.0),
              // Image.asset(Images.menu)
              Positioned(
                right: -10, top: 0, bottom: 0,
                child: PopupMenuButton<String>(
                  padding: EdgeInsets.all(0),
                  onSelected: (String result) {
                    if (result == 'delete') {
                      Provider.of<RestLocationProvider>(context, listen: false).deleteUserAddressByID(addressModel.id, index, (bool isSuccessful, String message) {
                        showCustomSnackBar(message, context, isError: !isSuccessful);
                      });
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => AddNewAddressScreen(isEnableUpdate: true, address: addressModel),
                      ));
                    }
                  },
                  itemBuilder: (BuildContext c) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'edit',
                      child: Text(getTranslated('edit', context), style: Theme.of(context).textTheme.headline2),
                    ),
                    PopupMenuItem<String>(
                      value: 'delete',
                      child: Text(getTranslated('delete', context), style: Theme.of(context).textTheme.headline2),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
