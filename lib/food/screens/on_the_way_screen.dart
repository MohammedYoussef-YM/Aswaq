import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/utility/dimensions.dart';
import 'package:flutter_ui_kit/food/utility/images.dart';
import 'package:flutter_ui_kit/food/utility/strings.dart';

class OnTheWayScreen extends StatefulWidget {
  @override
  _OnTheWayScreenState createState() => _OnTheWayScreenState();
}

class _OnTheWayScreenState extends State<OnTheWayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: 260,
              color: Colors.grey.withOpacity(0.5),
            ),
            Positioned(
              top: 220,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: ColorResources.COLOR_WHITE,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: _body(context),
              ),
            ),
            Positioned(
              top: 120,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                      Images.on_the_way_bike,
                      height: 200,
                      width: 200),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
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
                padding: const EdgeInsets.only(top: 50, left: 60),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: ColorResources.COLOR_PRIMARY,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            child: Center(
                                child: Icon(
                              Icons.alarm,
                              size: 20,
                              color: ColorResources.COLOR_WHITE,
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: Dimensions.PADDING_SIZE_DEFAULT),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Strings.ORDER_RECEIVED,
                                  style: TextStyle(
                                      fontSize: Dimensions.TEXT_SIZE_SMALL,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  Strings.TIME_DATE,
                                  style: TextStyle(
                                    fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                                    color: ColorResources.COLOR_GREY,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 17.5),
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
                                color: ColorResources.COLOR_PRIMARY,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            child: Center(
                                child: Icon(
                              Icons.directions_bike,
                              size: 20,
                              color: ColorResources.COLOR_WHITE,
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: Dimensions.PADDING_SIZE_DEFAULT),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Strings.ORDER_RECEIVED,
                                  style: TextStyle(
                                      fontSize: Dimensions.TEXT_SIZE_SMALL,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  Strings.TIME_DATE,
                                  style: TextStyle(
                                    fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                                    color: ColorResources.COLOR_GREY,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 17.5),
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
                                color: ColorResources.COLOR_WHITE,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                border: Border.all(
                                    color: ColorResources.COLOR_GREY,
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
                                left: Dimensions.PADDING_SIZE_DEFAULT),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Strings.ORDER_RECEIVED,
                                  style: TextStyle(
                                      fontSize: Dimensions.TEXT_SIZE_SMALL,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  Strings.TIME_DATE,
                                  style: TextStyle(
                                    fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                                    color: ColorResources.COLOR_GREY,
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
              confirmationButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget confirmationButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: Dimensions.PADDING_SIZE_EXTRA_SMALL),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    color: ColorResources.COLOR_PRIMARY,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: Text(
                    Strings.CONFIRM_DELIVERY,
                    style: TextStyle(
                        fontSize: Dimensions.TEXT_SIZE_SMALL,
                        color: ColorResources.COLOR_WHITE),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: Dimensions.PADDING_SIZE_EXTRA_SMALL),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    color: ColorResources.COLOR_GREY,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                  child: Text(
                    Strings.ORDERED_AGAIN,
                    style: TextStyle(
                        fontSize: Dimensions.TEXT_SIZE_SMALL,
                        color: ColorResources.COLOR_WHITE),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
