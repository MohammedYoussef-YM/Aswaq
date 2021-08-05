import 'package:flutter_ui_kit/rideshare/data/model/creadit_cart_model.dart';
import 'package:flutter_ui_kit/rideshare/utility/strings.dart';

class WalletRepo {
  List<CreditCartModel> getAllCreditCartList = [
    CreditCartModel(cartName: Strings.debit_card, cartNumber: Strings.card_number_one, balance: Strings.doller_12),
    CreditCartModel(cartName: Strings.credit_card, cartNumber: Strings.card_number_two, balance: Strings.doller_30),
    CreditCartModel(cartName: Strings.debit_card, cartNumber: Strings.card_number_one, balance: Strings.doller_11),
    CreditCartModel(cartName: Strings.credit_card, cartNumber: Strings.card_number_two, balance: Strings.doller_10),
    CreditCartModel(cartName: Strings.debit_card, cartNumber: Strings.card_number_one, balance: Strings.doller_12),
    CreditCartModel(cartName: Strings.credit_card, cartNumber: Strings.card_number_two, balance: Strings.doller_30),
    CreditCartModel(cartName: Strings.debit_card, cartNumber: Strings.card_number_one, balance: Strings.doller_12),
    CreditCartModel(cartName: Strings.credit_card, cartNumber: Strings.card_number_two, balance: Strings.doller_30),
  ];
}
