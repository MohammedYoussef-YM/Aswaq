import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/screens/account/account_setting_screen.dart';
import 'package:flutter_ui_kit/food/screens/account/favourite_screen.dart';
import 'package:flutter_ui_kit/food/screens/account/recent_order_screen.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/utility/dimensions.dart';
import 'package:flutter_ui_kit/food/utility/images.dart';
import 'package:flutter_ui_kit/food/utility/strings.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

enum Account { recentOrder, favourite, accountSetting }

class _AccountScreenState extends State<AccountScreen> {
  var currentPage = Account.accountSetting;
  var pageIndex = 2;

  final List<Widget> _children = [
    RecentOrderScreen(),
    FavouriteScreen(),
    AccountSettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage('assets/food/images/account_background.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    Strings.MY_ACCOUNT,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorResources.COLOR_WHITE,
                      fontSize: Dimensions.TEXT_SIZE_LARGE,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 4.5 - 10,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: ColorResources.COLOR_WHITE,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 40.0, left: 0, right: 0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Text(
                          Strings.SUNNY_SULTAN,
                          style: TextStyle(
                              fontSize: Dimensions.TEXT_SIZE_DEFAULT,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: ColorResources.COLOR_BLACK,
                            ),
                            Text(
                              Strings.LOREM_IPSUM,
                              style: TextStyle(
                                  fontSize: Dimensions.TEXT_SIZE_SMALL),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.PADDING_SIZE_SMALL,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    Dimensions.PADDING_SIZE_SMALL),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentPage = Account.recentOrder;
                                      pageIndex = 0;
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: currentPage == Account.recentOrder
                                          ? ColorResources.COLOR_PRIMARY
                                          : ColorResources.COLOR_WHITE,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: currentPage ==
                                                  Account.recentOrder
                                              ? ColorResources.COLOR_PRIMARY
                                                  .withOpacity(0.3)
                                              : ColorResources.COLOR_GREY
                                                  .withOpacity(0.3),
                                          spreadRadius: 2,
                                          blurRadius: 15,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        Strings.RECENT_ORDER,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: currentPage ==
                                                  Account.recentOrder
                                              ? ColorResources.COLOR_WHITE
                                              : ColorResources.COLOR_GREY,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    Dimensions.PADDING_SIZE_SMALL),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentPage = Account.favourite;
                                      pageIndex = 1;
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: currentPage == Account.favourite
                                          ? ColorResources.COLOR_PRIMARY
                                          : ColorResources.COLOR_WHITE,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              currentPage == Account.favourite
                                                  ? ColorResources.COLOR_PRIMARY
                                                      .withOpacity(0.3)
                                                  : ColorResources.COLOR_GREY
                                                      .withOpacity(0.3),
                                          spreadRadius: 2,
                                          blurRadius: 15,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        Strings.FAVOURITE,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color:
                                              currentPage == Account.favourite
                                                  ? ColorResources.COLOR_WHITE
                                                  : ColorResources.COLOR_GREY,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    Dimensions.PADDING_SIZE_SMALL),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentPage = Account.accountSetting;
                                      pageIndex = 2;
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color:
                                          currentPage == Account.accountSetting
                                              ? ColorResources.COLOR_PRIMARY
                                              : ColorResources.COLOR_WHITE,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: currentPage ==
                                                  Account.accountSetting
                                              ? ColorResources.COLOR_PRIMARY
                                                  .withOpacity(0.3)
                                              : ColorResources.COLOR_GREY
                                                  .withOpacity(0.3),
                                          spreadRadius: 2,
                                          blurRadius: 15,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        Strings.ACCOUNT_SETTING,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: currentPage ==
                                                  Account.accountSetting
                                              ? ColorResources.COLOR_WHITE
                                              : ColorResources.COLOR_GREY,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: _children[pageIndex],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height/4.5 - 100,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 140,
                      height: 140,
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: FadeInImage.assetNetwork(
                            placeholder: Images.place_holder,
                            image: Images.product_one,
                            fit: BoxFit.scaleDown,),
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
