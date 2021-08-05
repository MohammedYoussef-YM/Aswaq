import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/driver_app/provider/payment_provider.dart';
import 'package:flutter_ui_kit/driver_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/driver_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/driver_app/utility/strings.dart';
import 'package:flutter_ui_kit/driver_app/view/view/navigation_drawer/navigation_drawer.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:provider/provider.dart';

class DriverAppWalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<DriverAppPaymentProvider>(context, listen: false).initializeCreditCards();
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      key: _drawerKey,
      drawer: NavigationDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorResources.COLOR_WHITE,
        title: Text(
          Strings.my_wallet,
          style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE, fontSize: Dimensions.FONT_SIZE_LARGE),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: ColorResources.COLOR_PRIMARY,
          ),
          onPressed: () {
            _drawerKey.currentState.openDrawer();
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
          Consumer<DriverAppPaymentProvider>(
            builder: (context, walletProvider, child) => Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
                  itemCount: walletProvider.creditCards.length,
                  itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 17),
                        margin: EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                            color: ColorResources.COLOR_ALL_PORTS,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: ColorResources.COLOR_PRIMARY.withOpacity(0.3),
                                spreadRadius: 4,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            border: Border.all(color: ColorResources.COLOR_PRIMARY, width: 2.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  walletProvider.creditCards[index].cartName,
                                  style: montserratSemiBold.copyWith(color: ColorResources.COLOR_SEARCH_BACKGROUND),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      Strings.exp_date,
                                      style: montserratRegular.copyWith(
                                          fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_SEARCH_BACKGROUND),
                                    ),
                                    Text(
                                      '12/25',
                                      style: montserratSemiBold.copyWith(color: ColorResources.COLOR_SEARCH_BACKGROUND),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Text(
                              walletProvider.creditCards[index].cartNumber,
                              style: montserratSemiBold.copyWith(color: ColorResources.COLOR_SEARCH_BACKGROUND),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                            Text(
                              walletProvider.creditCards[index].balance,
                              style: montserratSemiBold.copyWith(color: ColorResources.COLOR_SEARCH_BACKGROUND),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            Text(
                              Strings.balance,
                              style: montserratRegular.copyWith(color: ColorResources.COLOR_SEARCH_BACKGROUND, fontSize: 9),
                            ),
                          ],
                        ),
                      )),
            ),
          ),
          Container(
            margin: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0), border: Border.all(color: ColorResources.COLOR_PRIMARY, width: 2)),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 14),
                alignment: Alignment.center,
                child: Text(
                  Strings.add_new_payment_method,
                  style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_GRAY_SIMPLE),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
