import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/grocery/data/models/payment.dart';
import 'package:flutter_ui_kit/grocery/data/repository/payment_repo.dart';

class PaymentProvider with ChangeNotifier {
  final PaymentRepo paymentRepo;

  PaymentProvider({@required this.paymentRepo});

  List<PaymentModel> _getAllPaymentMethod = [];

  List<PaymentModel> get getAllPaymentMethod => _getAllPaymentMethod;

  PaymentModel _paymentModel = PaymentModel();

  PaymentModel get paymentModel => _paymentModel;

  changePaymentMethod(PaymentModel payment) {
    _paymentModel = payment;
    notifyListeners();
  }

  int _selectPaymentIndex=0;
  int get selectPaymentIndex=>_selectPaymentIndex;

  updatePaymentIndex(int index){
    _selectPaymentIndex=index;
    notifyListeners();
  }

  initializePaymentMethod() {
    if (_getAllPaymentMethod.length == 0) {
      _getAllPaymentMethod.clear();
      _getAllPaymentMethod = paymentRepo.getPaymentModels;
      _paymentModel=paymentRepo.getPaymentModels[0];
      notifyListeners();
    }
  }
}
