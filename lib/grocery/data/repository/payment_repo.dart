import 'package:flutter_ui_kit/grocery/data/models/payment.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';

class PaymentRepo {
  List<PaymentModel> getPaymentModels = [
    PaymentModel(imageUrl: 'assets/grocery/images/mastarcard.png', cartNumber: Strings.cart_one, methodName: Strings.master_card),
    PaymentModel(imageUrl: 'assets/grocery/images/visa.png', cartNumber: Strings.cart_two, methodName: Strings.visa_card),
  ];
}
