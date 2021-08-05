import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/images.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/views/checkout/change_delivery_address_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/my_order/my_order_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/payment_method/payment_method_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/profile/acount_information_screen.dart';

class GroceryProfileScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      body: CustomScrollView(controller: _scrollController, physics: BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: double.infinity,
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
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 95,
                      height: 95,
                      child: Stack(
                        children: [
                         FadeInImage.assetNetwork(
                           placeholder: Images.place_holder,
                           image: Images.profile,
                           fit: BoxFit.fill,
                           width: 95,
                           height: 95,
                         ),
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: CircleAvatar(
                                backgroundColor: ColorResources.COLOR_PRIMARY,
                                radius: 13,
                                child: Icon(
                                  Icons.add,
                                  color: ColorResources.COLOR_WHITE,
                                  size: 15,
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_DEFAULT,
                    ),
                    Text(
                      Strings.todd_benson,
                      style: poppinsRegular.copyWith(color: ColorResources.COLOR_LIGHT_BLACK, fontSize: 17),
                    ),
                    Text(
                      Strings.email_frees,
                      style: poppinsRegular.copyWith(color: ColorResources.COLOR_SILVER, fontSize: 13),
                    ),
                  ],
                ),
              ),
              Container(
                color: ColorResources.COLOR_CART_BACKGROUND,
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                child: ListView(
                  shrinkWrap: true, // 1st add
                  physics: ClampingScrollPhysics(), // 2nd add
                  children: [
                    Container(
                      height: 230,
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                      decoration: BoxDecoration(
                        color: ColorResources.COLOR_WHITE,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _profileTab(
                              imageUrl: 'assets/grocery/icon/search.png',
                              title: Strings.account_information,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AccountInformationScreen()));
                              }),
                          Container(
                            height: 1,
                            color: ColorResources.COLOR_DIM_GRAY.withOpacity(.1),
                            margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL, bottom: Dimensions.PADDING_SIZE_SMALL),
                          ),
                          _profileTab(
                              imageUrl: 'assets/grocery/icon/my_order.png',
                              title: Strings.my_order,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyOrderScreen()));
                              }),
                          Container(
                            height: 1,
                            color: ColorResources.COLOR_DIM_GRAY.withOpacity(.1),
                            margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL, bottom: Dimensions.PADDING_SIZE_SMALL),
                          ),
                          _profileTab(
                              imageUrl: 'assets/grocery/icon/payment.png',
                              title: Strings.payment_method,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentMethodScreen()));
                              }),
                          Container(
                            height: 1,
                            color: ColorResources.COLOR_DIM_GRAY.withOpacity(.1),
                            margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL, bottom: Dimensions.PADDING_SIZE_SMALL),
                          ),
                          _profileTab(
                              imageUrl: 'assets/grocery/icon/delivery_address.png',
                              title: Strings.delivery_address,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeDeliveryAddressScreen()));
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_DEFAULT,
                    ),
                    Container(
                      height: 230,
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                      decoration: BoxDecoration(
                        color: ColorResources.COLOR_WHITE,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _profileTab(imageUrl: 'assets/grocery/icon/settings.png', title: Strings.settings, onTap: () {}),
                          Container(
                            height: 1,
                            color: ColorResources.COLOR_DIM_GRAY.withOpacity(.1),
                            margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL, bottom: Dimensions.PADDING_SIZE_SMALL),
                          ),
                          _profileTab(
                              imageUrl: 'assets/grocery/icon/help_center.png',
                              title: Strings.help_center,
                              onTap: () {

                              }),
                          Container(
                            height: 1,
                            color: ColorResources.COLOR_DIM_GRAY.withOpacity(.1),
                            margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL, bottom: Dimensions.PADDING_SIZE_SMALL),
                          ),
                          _profileTab(imageUrl: 'assets/grocery/icon/about_us.png', title: Strings.about_us, onTap: () {}),
                          Container(
                            height: 1,
                            color: ColorResources.COLOR_DIM_GRAY.withOpacity(.1),
                            margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL, bottom: Dimensions.PADDING_SIZE_SMALL),
                          ),
                          _profileTab(imageUrl: 'assets/grocery/icon/share.png', title: Strings.share_app, onTap: () {}),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.PADDING_SIZE_DEFAULT,
                    ),
                    Container(
                      height: 72,
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                      decoration: BoxDecoration(
                        color: ColorResources.COLOR_WHITE,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/grocery/icon/logout.png',
                                width: 32,
                                height: 32,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                width: Dimensions.PADDING_SIZE_DEFAULT,
                              ),
                              Text(
                                Strings.logout,
                                style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }

  Widget _profileTab({String imageUrl, String title, Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                imageUrl,
                width: 32,
                height: 32,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: Dimensions.PADDING_SIZE_DEFAULT,
              ),
              Text(
                title,
                style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 15,
            color: ColorResources.COLOR_DIM_GRAY.withOpacity(.5),
          )
        ],
      ),
    );
  }
}
