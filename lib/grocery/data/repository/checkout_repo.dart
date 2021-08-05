import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/data/models/payment.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';

class CheckoutRepo {
  List<String> getDeliveryTime = [
    'Time Slot',
    '6:00 Am',
    '8:00 Am',
    '6:00 pm',
    '8:00 pm',
  ];

  List<String> getOrderList = [
    '12 Items',
    '6 Items',
    '8 Items',
    '4 Items',
    '1 Items',
  ];

  List<PaymentModel> getPaymentModels = [
    PaymentModel(
      imageUrl: 'assets/grocery/images/mastarcard.png',
      cartNumber: Strings.cart_one,
    ),
    PaymentModel(
      imageUrl: 'assets/grocery/images/visa.png',
      cartNumber: Strings.cart_two,
    ),
    PaymentModel(
      cartNumber: Strings.cash_to_driver,
    ),
  ];
  List<IconData> getAllAddressTypeIcon = [Icons.home, Icons.local_post_office_outlined, Icons.devices_other];
}
