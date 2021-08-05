import 'package:flutter_ui_kit/academy/data/model/payment_model.dart';
import 'package:flutter_ui_kit/academy/utility/images.dart';

class AcademyPaymentRepo {
  List<PaymentModel> getPayments() {
    List<PaymentModel> paymentList = [
      PaymentModel(Images.mastercard, 'HDFC credit card', '4642 …. ….7456'),
      PaymentModel(Images.visa, 'HDFC credit card', '4642 …. ….7456'),
    ];
    return paymentList;
  }
}