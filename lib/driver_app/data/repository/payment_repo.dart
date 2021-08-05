import 'package:flutter_ui_kit/driver_app/data/model/creadit_cart_model.dart';
import 'package:flutter_ui_kit/driver_app/data/model/payment_model.dart';
import 'package:flutter_ui_kit/driver_app/utility/strings.dart';

class DriverAppPaymentRepo {
  List<PaymentModel> getAllPaymentMethod = [
    PaymentModel('assets/rideshare/images/hand_cash.png', Strings.payment_by_cash),
    PaymentModel('assets/rideshare/images/creadit_card.png', Strings.credit_card),
    PaymentModel('assets/rideshare/images/paypal.png', Strings.paypal),
  ];

  List<CreditCartModel> getAllCreditCartList = [
    CreditCartModel(cartName: Strings.debit_card, cartNumber: Strings.card_number_one, balance: Strings.doller_12),
    CreditCartModel(cartName: Strings.credit_card, cartNumber: Strings.card_number_two, balance: Strings.doller_30),
  ];

}
