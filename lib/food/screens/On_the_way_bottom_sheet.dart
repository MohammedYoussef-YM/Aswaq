import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/screens/dashboard_screen.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/utility/dimensions.dart';
import 'package:flutter_ui_kit/food/utility/images.dart';
import 'package:flutter_ui_kit/food/utility/strings.dart';

class OnTheWayBottomSheet {
  static void orderStatus(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return Container(
            height: MediaQuery.of(context).size.height*0.90,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.height / 5,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: ColorResources.COLOR_WHITE,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                Strings.YOUR_ORDER_IS,
                                style: TextStyle(
                                    fontSize: Dimensions.TEXT_SIZE_SMALL,
                                    color: ColorResources.COLOR_PRIMARY,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Strings.INVOICE_NUMBER,
                                    style: TextStyle(
                                        fontSize: Dimensions.TEXT_SIZE_SMALL,
                                        color: ColorResources.COLOR_BLACK,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ' ' + Strings.NUMBER,
                                    style: TextStyle(
                                        fontSize: Dimensions.TEXT_SIZE_SMALL,
                                        color: ColorResources.COLOR_PRIMARY,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 50, left: 60),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                color: ColorResources
                                                    .COLOR_PRIMARY,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(100))),
                                            child: Center(
                                                child: Icon(
                                              Icons.alarm,
                                              size: 20,
                                              color: ColorResources.COLOR_WHITE,
                                            )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: Dimensions
                                                    .PADDING_SIZE_DEFAULT),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  Strings.ORDER_RECEIVED,
                                                  style: TextStyle(
                                                      fontSize: Dimensions
                                                          .TEXT_SIZE_SMALL,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  Strings.TIME_DATE,
                                                  style: TextStyle(
                                                    fontSize: Dimensions
                                                        .TEXT_SIZE_EXTRA_SMALL,
                                                    color: ColorResources
                                                        .COLOR_GREY,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 17.5),
                                        child: Container(
                                          height: 60,
                                          width: 2,
                                          color: ColorResources.COLOR_PRIMARY,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                color: ColorResources
                                                    .COLOR_PRIMARY,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(100))),
                                            child: Center(
                                                child: Icon(
                                              Icons.directions_bike,
                                              size: 20,
                                              color: ColorResources.COLOR_WHITE,
                                            )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: Dimensions
                                                    .PADDING_SIZE_DEFAULT),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  Strings.ORDER_RECEIVED,
                                                  style: TextStyle(
                                                      fontSize: Dimensions
                                                          .TEXT_SIZE_SMALL,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  Strings.TIME_DATE,
                                                  style: TextStyle(
                                                    fontSize: Dimensions
                                                        .TEXT_SIZE_EXTRA_SMALL,
                                                    color: ColorResources
                                                        .COLOR_GREY,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 17.5),
                                        child: Container(
                                          height: 60,
                                          width: 2,
                                          color: ColorResources.COLOR_GREY,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                color:
                                                    ColorResources.COLOR_WHITE,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(100)),
                                                border: Border.all(
                                                    color: ColorResources
                                                        .COLOR_GREY,
                                                    width: 2)),
                                            child: Center(
                                                child: Icon(
                                              Icons.location_on,
                                              size: 20,
                                              color: ColorResources.COLOR_GREY,
                                            )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: Dimensions
                                                    .PADDING_SIZE_DEFAULT),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  Strings.ORDER_RECEIVED,
                                                  style: TextStyle(
                                                      fontSize: Dimensions
                                                          .TEXT_SIZE_SMALL,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  Strings.TIME_DATE,
                                                  style: TextStyle(
                                                    fontSize: Dimensions
                                                        .TEXT_SIZE_EXTRA_SMALL,
                                                    color: ColorResources
                                                        .COLOR_GREY,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(
                                    Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () => Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(builder: (_) => DashboardScreen()),
                                              (route) => false,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: Dimensions
                                                  .PADDING_SIZE_EXTRA_SMALL),
                                          child: Container(
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color:
                                                    ColorResources.COLOR_PRIMARY,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Center(
                                              child: Text(
                                                Strings.CONFIRM_DELIVERY,
                                                style: TextStyle(
                                                    fontSize: Dimensions
                                                        .TEXT_SIZE_EXTRA_SMALL,
                                                    color: ColorResources
                                                        .COLOR_WHITE),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                            color: ColorResources.COLOR_GREY,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Center(
                                          child: Text(
                                            Strings.ORDERED_AGAIN,
                                            style: TextStyle(
                                                fontSize: Dimensions
                                                    .TEXT_SIZE_EXTRA_SMALL,
                                                color: ColorResources
                                                    .COLOR_WHITE),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 5 - 100,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(Images.on_the_way_bike,
                        height: 200,
                        width: 200,),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}