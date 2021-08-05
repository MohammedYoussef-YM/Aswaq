import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/screens/bottomsheet/payment_bottomsheet.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/utility/dimensions.dart';
import 'package:flutter_ui_kit/food/utility/strings.dart';

class AccountSettingScreen extends StatefulWidget {
  @override
  _AccountSettingScreenState createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL, right: Dimensions.PADDING_SIZE_SMALL),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: ColorResources.COLOR_WHITE,
              boxShadow: [
                BoxShadow(
                  color: ColorResources.COLOR_GREY.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 15,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      child: Image.asset(
                        'assets/food/images/account_setting_location.png',
                        height: 20,
                        width: 20,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        Strings.LOCATION_TRACKING,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(right: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        child: SizedBox(
                            width: 70,
                            height: 40,
                            child: Switch(
                                value: status,
                                activeColor: ColorResources.COLOR_PRIMARY,
                                onChanged: (value) {
                                  print("VALUE : $value");
                                  setState(() {
                                    status = value;
                                  });
                                })))
                  ],
                ),
                Divider(
                  thickness: 0.2,
                  color: ColorResources.COLOR_GREY,
                ),
                Container(
                  width: double.infinity,
                  height: 37,
                  padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  child: MaterialButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      PaymentBottomSheet.paymentStatus(context);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/food/images/account_setting_payment.png',
                          height: 20,
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          child: Text(
                            Strings.PAYMENTS,
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.2,
                  color: ColorResources.COLOR_GREY,
                ),
                Container(
                  width: double.infinity,
                  height: 37,
                  padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  child: MaterialButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      //PaymentBottomSheet.paymentStatus(context);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/food/images/account_setting_edit_profile.png',
                          height: 20,
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          child: Text(
                            Strings.EDIT_PROFILE,
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.2,
                  color: ColorResources.COLOR_GREY,
                ),
                Container(
                  width: double.infinity,
                  height: 37,
                  padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  child: MaterialButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      //PaymentBottomSheet.paymentStatus(context);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/food/images/account_setting_deliver_address.png',
                          height: 20,
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          child: Text(
                            Strings.DELIVERY_ADDRESS,
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.2,
                  color: ColorResources.COLOR_GREY,
                ),
                Container(
                  width: double.infinity,
                  height: 37,
                  padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  child: MaterialButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      //PaymentBottomSheet.paymentStatus(context);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/food/images/account_setting_link_account.png',
                          height: 20,
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          child: Text(
                            Strings.LINKED_ACCOUNTS,
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.2,
                  color: ColorResources.COLOR_GREY,
                ),
                Container(
                  width: double.infinity,
                  height: 37,
                  padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  child: MaterialButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      //PaymentBottomSheet.paymentStatus(context);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/food/images/account_setting_logout.png',
                          height: 20,
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          child: Text(
                            Strings.LOGOUT,
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: SizedBox(
              height: 200,
            ),
          )
        ],
      ),
    );
  }
}
