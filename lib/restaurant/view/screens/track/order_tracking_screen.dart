import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/order_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/theme_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_app_bar.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_button.dart';
import 'package:flutter_ui_kit/restaurant/view/base/rating_bar.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/rare_review/rate_review_screen.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/track/widget/custom_stepper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderTrackingScreen extends StatelessWidget {
  final String orderID;
  OrderTrackingScreen({@required this.orderID});

  @override
  Widget build(BuildContext context) {
    LatLng deliveryLatLng = LatLng(37.42796133580664, -122.085749655962);
    Provider.of<RestOrderProvider>(context, listen: false).trackOrder(orderID);
    final List<String> _statusList = ['pending', 'confirmed', 'processing' ,'out_for_delivery', 'delivered', 'returned', 'failed', 'canceled'];

    return Scaffold(
      appBar: CustomAppBar(title: getTranslated('order_tracking', context)),
      body: Consumer<RestOrderProvider>(
        builder: (context, order, child) {
          String _status;
          if(order.trackModel != null) {
            _status = order.trackModel.orderStatus;
          }

          if(_status != null && _status == _statusList[5] || _status == _statusList[6] || _status == _statusList[7]) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_status),
                SizedBox(height: 50),
                CustomButton(btnTxt: getTranslated('back_home', context), onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => RestDashboardScreen()), (route) => false);
                }),
              ],
            );
          } else if(order.responseModel != null && !order.responseModel.isSuccess) {
            return Center(child: Text(order.responseModel.message));
          }

          return _status != null ? ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            children: [

              order.trackModel.deliveryMan != null ? InkWell(
                onTap: () {
                  launch('tel:${order.trackModel.deliveryMan.phone}');
                },
                child: Container(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      color: Colors.grey[Provider.of<RestThemeProvider>(context).darkTheme ? 700 : 300],
                      blurRadius: 5, spreadRadius: 1,
                    )],
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(getTranslated('delivery_man', context), style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL)),
                    ListTile(
                      leading: ClipOval(
                        child:FadeInImage.assetNetwork(
                          placeholder: Images.placeholder,
                          image: order.trackModel.deliveryMan.image,
                            height: 40, width: 40, fit: BoxFit.cover,
                        )
                      ),
                      title: Text(
                        '${order.trackModel.deliveryMan.fName} ${order.trackModel.deliveryMan.lName}',
                        style: rubikRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),
                      ),
                      subtitle: RatingBar(rating: 0.0, size: 15),
                      trailing: Container(
                        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: ColorResources.getSearchBg(context)),
                        child: Icon(Icons.call_outlined),
                      ),
                    ),
                  ]),
                ),
              ) : SizedBox(),
              order.trackModel.deliveryMan != null ? SizedBox(height: 30) : SizedBox(),

              CustomStepper(title: getTranslated('order_placed', context), isActive: true, haveTopBar: false),
              CustomStepper(title: getTranslated('order_accepted', context), isActive: _status != _statusList[0]),
              CustomStepper(title: getTranslated('preparing_food', context), isActive: _status != _statusList[0] && _status != _statusList[1]),
              CustomStepper(title: getTranslated('food_in_the_way', context), isActive: _status != _statusList[0] && _status != _statusList[1] && _status != _statusList[2]),
              CustomStepper(title: getTranslated('delivered_the_food', context), isActive: _status == _statusList[4], height: _status == _statusList[3] ? 170 : 30,
                child: _status == _statusList[3] ? Container(
                  height: 130, width: MediaQuery.of(context).size.width - 100,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: deliveryLatLng.latitude != null ? GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: deliveryLatLng,
                      zoom: 18,
                    ),
                    zoomControlsEnabled: false,
                    markers: Set.of([Marker(
                      markerId: MarkerId("home"),
                      position: deliveryLatLng,
                      icon: BitmapDescriptor.defaultMarker,
                    )]),
                    onMapCreated: (GoogleMapController controller) {},
                    onTap: (latLng) async {
                      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
                      String url ='https://www.google.com/maps/dir/?api=1&origin=${deliveryLatLng.latitude},${deliveryLatLng.longitude}'
                          '&destination=${position.latitude},${position.longitude}&mode=d';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ) : Text('No delivery man data found'),
                ) : null,
              ),
              SizedBox(height: 50),

              CustomButton(btnTxt: _status == _statusList[4] ? getTranslated('rate_the_food', context) : getTranslated('back_home', context), onTap: () {
                if(_status == _statusList[3]) {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => RateReviewScreen()));
                }else {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => RestDashboardScreen()), (route) => false);
                }
              }),

            ],
          ) : Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)));
        },
      ),
    );
  }
}
