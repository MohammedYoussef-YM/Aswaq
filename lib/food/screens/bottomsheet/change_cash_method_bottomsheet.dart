import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/utility/dimensions.dart';
import 'package:flutter_ui_kit/food/utility/strings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui_kit/food/provider/home_provider.dart';

void changeCashMethodMethod(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (builder) {
        return Wrap(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: ColorResources.COLOR_WHITE, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                    child: Text(
                      Strings.SELECT_PAYMENT_METHOD,
                      style: TextStyle(color: ColorResources.COLOR_BLACK, fontSize: Dimensions.TEXT_SIZE_EXTRA_LARGE),
                    ),
                  ),
                  Consumer<HomeProvider>(
                    builder: (context, home, child) {
                      return Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => home.setPaymentIndex(0),
                              child: Padding(
                                padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: ColorResources.COLOR_WHITE,
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        border: home.paymentIndex == 0 ? Border.all(color: ColorResources.COLOR_PRIMARY, width: 2) : null,
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorResources.COLOR_GREY.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 15,
                                            offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
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
                                padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: ColorResources.COLOR_WHITE,
                                        border: home.paymentIndex == 1 ? Border.all(color: ColorResources.COLOR_PRIMARY, width: 2) : null,
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorResources.COLOR_GREY.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 15,
                                            offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
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
                                padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: ColorResources.COLOR_WHITE,
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        border: home.paymentIndex == 2 ? Border.all(color: ColorResources.COLOR_PRIMARY, width: 2) : null,
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorResources.COLOR_GREY.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 15,
                                            offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
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
                                            color: ColorResources.COLOR_GREY.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 15,
                                            offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL, left: Dimensions.PADDING_SIZE_SMALL),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        Strings.YOUR_LINKED_CARD,
                        style: TextStyle(color: ColorResources.COLOR_BLACK, fontSize: Dimensions.TEXT_SIZE_LARGE),
                      ),
                    ),
                  ),
                  linkedCards(context)
                ],
              ),
            ),
          ],
        );
      });
}

Widget linkedCards(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
    child: Consumer<HomeProvider>(
      builder: (context, home, child) {
        return Column(
          children: [
            InkWell(
              onTap: () => home.setCardIndex(0),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorResources.COLOR_WHITE,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: home.cardIndex == 0 ? Border.all(width: 2, color: ColorResources.COLOR_PRIMARY) : null,
                  boxShadow: [
                    BoxShadow(
                      color: ColorResources.COLOR_GREY.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 15,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/food/images/change_payment_paymaya.png',
                        width: 30,
                        height: 25,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Strings.CARD_ONE,
                                style: TextStyle(fontSize: Dimensions.TEXT_SIZE_SMALL, color: ColorResources.COLOR_BLACK),
                              ),
                              Text(
                                Strings.EXPIRE_DATE,
                                style: TextStyle(fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL, color: ColorResources.COLOR_GREY),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.PADDING_SIZE_SMALL,
            ),
            InkWell(
              onTap: () => home.setCardIndex(1),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorResources.COLOR_WHITE,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: home.cardIndex == 1 ? Border.all(width: 2, color: ColorResources.COLOR_PRIMARY) : null,
                  boxShadow: [
                    BoxShadow(
                      color: ColorResources.COLOR_GREY.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 15,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/food/images/change_payment_paymaya.png',
                        width: 30,
                        height: 25,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Strings.CARD_ONE,
                                style: TextStyle(fontSize: Dimensions.TEXT_SIZE_SMALL, color: ColorResources.COLOR_BLACK),
                              ),
                              Text(
                                Strings.EXPIRE_DATE,
                                style: TextStyle(fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL, color: ColorResources.COLOR_GREY),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}
