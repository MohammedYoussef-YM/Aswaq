import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/driver_app/provider/payment_provider.dart';
import 'package:flutter_ui_kit/driver_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/driver_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/driver_app/utility/strings.dart';
import 'package:flutter_ui_kit/driver_app/view/view/destination/driverapp_destination_screen_five.dart';
import 'package:flutter_ui_kit/driver_app/view/view/destination/widget/map_widget.dart';
import 'package:flutter_ui_kit/driver_app/view/view/navigation_drawer/navigation_drawer.dart';
import 'package:flutter_ui_kit/driver_app/view/widget/custom_button.dart';
import 'package:flutter_ui_kit/driver_app/view/widget/menu_widget.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/rideshare/utility/images.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DriverAppDestinationScreenFour extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final LatLng currentDeviceLatLng;
  final LatLng destinationLatLng;

  DriverAppDestinationScreenFour({this.currentDeviceLatLng, this.destinationLatLng});

  @override
  Widget build(BuildContext context) {
    Provider.of<DriverAppPaymentProvider>(context, listen: false).initializeAllPaymentMethod();
    return Scaffold(
      key: _drawerKey, // assign key to Scaffold
      drawer: NavigationDrawer(),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SafeArea(
            child: MapWidget(
              currentDeviceLatLng: currentDeviceLatLng,
              destinationLatLng: destinationLatLng,
            ),
          ),
          // Positioned(
          //     bottom: 0,
          //     left: 0,
          //     right: 0,
          //     child: Container(
          //       height: 330,
          //       decoration: BoxDecoration(
          //           color: ColorResources.COLOR_WHITE,
          //           borderRadius: BorderRadius.only(
          //             topRight: Radius.circular(26.0),
          //             topLeft: Radius.circular(26.0),
          //           )),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           SizedBox(height: 15),
          //           Center(
          //               child: Text(
          //             Strings.your_bill_is,
          //             style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_DEEP),
          //           )),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Text(Strings.bd, style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_DEEP, fontSize: Dimensions.FONT_SIZE_SMALL)),
          //               Text(Strings.digit_60, style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_PRIMARY, fontSize: 40.0)),
          //             ],
          //           ),
          //           Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
          //             child: Divider(),
          //           ),
          //           SizedBox(height: 10),
          //           Consumer<DriverAppPaymentProvider>(
          //               builder: (context, paymentProvider, child) => Expanded(
          //                     child: ListView.builder(
          //                         itemCount: paymentProvider.getAllPaymentMethod.length,
          //                         padding: EdgeInsets.only(bottom: 10),
          //                         physics: BouncingScrollPhysics(),
          //                         itemBuilder: (context, index) => _payment(
          //                             imageUrl: paymentProvider.getAllPaymentMethod[index].imageUrl,
          //                             name: paymentProvider.getAllPaymentMethod[index].title,
          //                             context: context,
          //                             paymentProvider: paymentProvider,
          //                             index: index)),
          //                   )),
          //           Padding(
          //             padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
          //             child: CustomButton(
          //               btnTxt: Strings.next,
          //               onTap: () {
          //                 Navigator.of(context).push(MaterialPageRoute(builder: (_) => DriverAppDestinationScreenFive()));
          //               },
          //             ),
          //           )
          //         ],
          //       ),
          //     )),
          MenuWidget(drawerKey: _drawerKey),
          DraggableScrollableSheet(
            initialChildSize: 0.2,
            minChildSize: 0.2,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                    color: ColorResources.COLOR_WHITE,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(26.0),
                      topLeft: Radius.circular(26.0),
                    )),
                child: ListView(
                  controller: scrollController,
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    Center(
                        child: Text(
                      Strings.your_bill_is,
                      style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_DEEP),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Strings.bd, style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_DEEP, fontSize: Dimensions.FONT_SIZE_SMALL)),
                        Text(Strings.digit_60, style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_PRIMARY, fontSize: 40.0)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                      child: Divider(),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    Consumer<DriverAppPaymentProvider>(
                        builder: (context, paymentProvider, child) => ListView.builder(
                            itemCount: paymentProvider.getAllPaymentMethod.length,
                            padding: EdgeInsets.only(bottom: 10),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => _payment(
                                imageUrl: paymentProvider.getAllPaymentMethod[index].imageUrl,
                                name: paymentProvider.getAllPaymentMethod[index].title,
                                context: context,
                                paymentProvider: paymentProvider,
                                index: index))),
                    SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
                      child: CustomButton(
                        btnTxt: Strings.next,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => DriverAppDestinationScreenFive()));
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _payment({String imageUrl, String name, BuildContext context, DriverAppPaymentProvider paymentProvider, int index}) {
    return InkWell(
      onTap: () {
        paymentProvider.updateSelectPaymentMethod(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT, vertical: 5),
        color: paymentProvider.selectPaymentMethodIndex == index ? Colors.grey.withOpacity(.1) : Colors.transparent,
        child: Column(
          children: [
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FadeInImage.assetNetwork(placeholder: Images.place_holder, image: imageUrl, width: 30, height: 30, fit: BoxFit.fill),
                    SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                    Text(
                      name,
                      style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK, fontSize: 13.0),
                    )
                  ],
                ),
                paymentProvider.selectPaymentMethodIndex == index
                    ? Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(color: ColorResources.COLOR_PRIMARY, shape: BoxShape.circle),
                        child: Icon(Icons.done, color: Colors.white, size: 16),
                      )
                    : SizedBox.shrink(),
              ],
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
          ],
        ),
      ),
    );
  }
}
