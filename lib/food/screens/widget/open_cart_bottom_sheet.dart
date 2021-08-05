import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/provider/home_provider.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/utility/dimensions.dart';
import 'package:flutter_ui_kit/food/utility/images.dart';
import 'package:flutter_ui_kit/food/utility/strings.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';

void openCartBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (builder) {
        Provider.of<HomeProvider>(context, listen: false).setCounter(1);
        return Container(
          height: MediaQuery.of(context).size.height / 2.4,
          decoration: BoxDecoration(
              color: ColorResources.COLOR_WHITE,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  top: -100,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 200,
                        width: 220,
                        child: Image.asset(
                          'assets/food/images/home_blob_bg.png',
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  top: -100,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 200,
                        width: 220,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(120),
                          child: FadeInImage.assetNetwork(
                            placeholder: Images.place_holder,
                            image: Images.home_chicken,
                            fit: BoxFit.contain,),
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  top: 100,
                  child: Padding(
                    padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    Strings.CHIKENJOY_C1,
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.TEXT_SIZE_DEFAULT),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        Strings.USD,
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.TEXT_SIZE_DEFAULT),
                                      ),
                                      Text(
                                        Strings.USD89,
                                        style: TextStyle(
                                            color: ColorResources.COLOR_PRIMARY,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Dimensions.TEXT_SIZE_EXTRA_LARGE),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    Strings.DEMO_DESCRIPTION,
                                    style:
                                        TextStyle(color: ColorResources.COLOR_GREY, fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL),
                                  ),
                                ),
                                Container(
                                  height: 55,
                                  margin: EdgeInsets.only(right: 25),
                                  padding: const EdgeInsets.all(8.0),
                                  child: LiteRollingSwitch(
                                    //initial value
                                    value: true,
                                    textOn: 'Large',
                                    textOff: 'Small',
                                    colorOn: ColorResources.COLOR_PRIMARY,
                                    colorOff: ColorResources.COLOR_GREY,
                                    iconOn: Icons.done,
                                    iconOff: Icons.remove_circle_outline,
                                    textSize: 16.0,
                                    onChanged: (bool state) {
                                      //Use it to manage the different states
                                      print('Current State of SWITCH IS: $state');
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 50.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to cart'), backgroundColor: Colors.green));
                                    },
                                    child: Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width / 3,
                                      decoration: BoxDecoration(
                                          color: ColorResources.COLOR_PRIMARY,
                                          borderRadius: BorderRadius.all(Radius.circular(10))),
                                      child: Center(
                                        child: Text(
                                          Strings.ADD_TO_CART,
                                          style: TextStyle(
                                              fontSize: Dimensions.TEXT_SIZE_DEFAULT, color: ColorResources.COLOR_WHITE),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: ColorResources.COLOR_WHITE,
                                            borderRadius: BorderRadius.all(Radius.circular(100)),
                                            border: Border.all(width: 2, color: ColorResources.COLOR_GREY.withOpacity(0.3))),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.all(0),
                                          ),
                                          onPressed: () {
                                            Provider.of<HomeProvider>(context, listen: false).decrementCounter();
                                          },
                                          child: Center(
                                            child: Icon(
                                              Icons.remove,
                                              color: ColorResources.COLOR_GREY,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Consumer<HomeProvider>(
                                        builder: (context, homeProvider, child) => Padding(
                                            padding: const EdgeInsets.only(
                                                right: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                                left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                            child: Container(
                                                child: Text(
                                              homeProvider.count.toString(),
                                              style:
                                                  TextStyle(fontSize: Dimensions.TEXT_SIZE_DEFAULT, fontWeight: FontWeight.bold),
                                            ))),
                                      ),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: ColorResources.COLOR_WHITE,
                                            borderRadius: BorderRadius.all(Radius.circular(100)),
                                            border: Border.all(width: 2, color: ColorResources.COLOR_GREY.withOpacity(0.3))),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.all(0),
                                          ),
                                          onPressed: () {
                                            Provider.of<HomeProvider>(context, listen: false).incrementCounter();
                                          },
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              color: ColorResources.COLOR_GREY,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        );
      });
}
