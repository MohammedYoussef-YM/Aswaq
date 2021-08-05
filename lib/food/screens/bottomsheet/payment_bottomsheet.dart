import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/utility/dimensions.dart';
import 'package:flutter_ui_kit/food/utility/images.dart';
import 'package:flutter_ui_kit/food/utility/strings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui_kit/food/provider/home_provider.dart';

class PaymentBottomSheet {
  static void paymentStatus(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return Container(
            height: MediaQuery.of(context).size.height,
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
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT),
                                    child: Text(
                                      Strings.PAYMENTS,
                                      style: TextStyle(
                                          fontSize: Dimensions.TEXT_SIZE_DEFAULT,
                                          color: ColorResources.COLOR_BLACK,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT),
                                child: Consumer<HomeProvider>(
                                  builder: (context, home, child) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: () => home.setPaymentIndex(0),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  Dimensions.PADDING_SIZE_SMALL),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: ColorResources.COLOR_WHITE,
                                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                                      border: home.paymentIndex == 0 ? Border.all(color: ColorResources.COLOR_PRIMARY, width: 2) : null,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: ColorResources.COLOR_GREY
                                                              .withOpacity(0.3),
                                                          spreadRadius: 2,
                                                          blurRadius: 15,
                                                          offset: Offset(0,
                                                              3), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(Dimensions
                                                          .PADDING_SIZE_SMALL),
                                                      child: Center(
                                                        child: Image.asset(
                                                          'assets/food/images/change_payment_cash.png',
                                                          width: 35,
                                                          height: 35,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    Strings.CASH + '\n',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                                                      color: home.paymentIndex == 0 ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_BLACK,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () => home.setPaymentIndex(1),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  Dimensions.PADDING_SIZE_SMALL),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: ColorResources.COLOR_WHITE,
                                                      border: home.paymentIndex == 1 ? Border.all(color: ColorResources.COLOR_PRIMARY, width: 2) : null,
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(10)),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: ColorResources.COLOR_GREY
                                                              .withOpacity(0.3),
                                                          spreadRadius: 2,
                                                          blurRadius: 15,
                                                          offset: Offset(0,
                                                              3), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(Dimensions
                                                          .PADDING_SIZE_SMALL),
                                                      child: Center(
                                                        child: Image.asset(
                                                          'assets/food/images/change_payment_card.png',
                                                          width: 35,
                                                          height: 35,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    Strings.CREDIT_DEBIT,
                                                    textAlign: TextAlign.center,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                                                      color: home.paymentIndex == 1 ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_BLACK,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () => home.setPaymentIndex(2),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  Dimensions.PADDING_SIZE_SMALL),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: ColorResources.COLOR_WHITE,
                                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                                      border: home.paymentIndex == 2 ? Border.all(color: ColorResources.COLOR_PRIMARY, width: 2) : null,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: ColorResources.COLOR_GREY
                                                              .withOpacity(0.3),
                                                          spreadRadius: 2,
                                                          blurRadius: 15,
                                                          offset: Offset(0,
                                                              3), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(Dimensions
                                                          .PADDING_SIZE_SMALL),
                                                      child: Center(
                                                        child: Image.asset(
                                                          'assets/food/images/change_payment_visa.png',
                                                          width: 35,
                                                          height: 35,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    Strings.GCASH + '\n',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                                                      color: home.paymentIndex == 2 ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_BLACK,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () => home.setPaymentIndex(3),
                                            child: Padding(
                                              padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: ColorResources.COLOR_WHITE,
                                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                                      border: home.paymentIndex == 3 ? Border.all(color: ColorResources.COLOR_PRIMARY, width: 2) : null,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: ColorResources.COLOR_GREY
                                                              .withOpacity(0.3),
                                                          spreadRadius: 2,
                                                          blurRadius: 15,
                                                          offset: Offset(0,
                                                              3), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(Dimensions
                                                          .PADDING_SIZE_SMALL),
                                                      child: Center(
                                                        child: Image.asset(
                                                          'assets/food/images/change_payment_paymaya.png',
                                                          width: 35,
                                                          height: 35,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    Strings.PAYMAYA + '\n',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                                                        color: home.paymentIndex == 3 ? ColorResources.COLOR_PRIMARY : ColorResources.COLOR_BLACK,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 20,),
                              Divider(
                                thickness: 0.5,
                                color: ColorResources.COLOR_GREY,
                              ),
                              SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      Strings.LINKED_CARD,
                                      style: TextStyle(
                                          color: ColorResources.COLOR_BLACK,
                                          fontSize: Dimensions.TEXT_SIZE_DEFAULT,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Container(
                                      height: 25,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: ColorResources.COLOR_PRIMARY,
                                        borderRadius: BorderRadius.all(Radius.circular(30))
                                      ),
                                      child: Center(
                                        child: Text(
                                          Strings.ADD_NEW,
                                          style: TextStyle(
                                              color: ColorResources.COLOR_WHITE,
                                              fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.only(left: 7.0),
                                child: Container(
                                  width: double.infinity,
                                  height:300,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 2,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index){
                                    return Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context).size.height / 4.5,
                                          width: 300,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(30)),
                                            image: DecorationImage(
                                              image:
                                              AssetImage('assets/food/images/account_background.png'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          child: SafeArea(
                                            child: Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topRight,
                                                    child: SvgPicture.asset(
                                                      'assets/food/svg/account_mastercard.svg',
                                                      color: ColorResources.COLOR_WHITE,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          child: Padding(
                                            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                                            child: Container(
                                              height: MediaQuery.of(context).size.height / 4.5,
                                              width: 300,
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      Strings.SUNNY_SULTAN,
                                                      style: TextStyle(
                                                        color: ColorResources.COLOR_WHITE,
                                                        fontSize: Dimensions.TEXT_SIZE_SMALL,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      Strings.DEMO_CARD_NUMBER,
                                                      style: TextStyle(
                                                        color: ColorResources.COLOR_WHITE,
                                                        fontSize: Dimensions.TEXT_SIZE_SMALL,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            child: Container(
                                              height: MediaQuery.of(context).size.height / 4.5,
                                              width: 300,
                                              child: Align(
                                                alignment: Alignment.bottomRight,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                                                  child: Text(
                                                    Strings.EXPIRE_DATE,
                                                    style: TextStyle(
                                                      color: ColorResources.COLOR_WHITE,
                                                      fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                        )
                                      ],
                                    );
                                  }),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 5 - 100,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
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
          );
        });
  }
}