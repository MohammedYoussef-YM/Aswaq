import 'package:flutter/foundation.dart';
import 'package:flutter_ui_kit/driver_app/data/model/creadit_cart_model.dart';
import 'package:flutter_ui_kit/driver_app/data/model/payment_model.dart';
import 'package:flutter_ui_kit/driver_app/data/repository/payment_repo.dart';

class DriverAppPaymentProvider with ChangeNotifier {
  final DriverAppPaymentRepo paymentRepo;

  DriverAppPaymentProvider({@required this.paymentRepo});

  List<PaymentModel> _getAllPaymentMethod = [];

  List<PaymentModel> get getAllPaymentMethod => _getAllPaymentMethod;

  initializeAllPaymentMethod() {
    if (_getAllPaymentMethod.length == 0) {
      _getAllPaymentMethod.clear();
      _getAllPaymentMethod = paymentRepo.getAllPaymentMethod;
      notifyListeners();
    }
  }

  int _selectPaymentMethodIndex = 0;

  int get selectPaymentMethodIndex => _selectPaymentMethodIndex;

  updateSelectPaymentMethod(int index) {
    _selectPaymentMethodIndex = index;
    notifyListeners();
  }

  List<CreditCartModel> _creditCards = [];

  List<CreditCartModel> get creditCards => _creditCards;

  initializeCreditCards() {
    if (_creditCards.length == 0) {
      _creditCards.clear();
      _creditCards = paymentRepo.getAllCreditCartList;
      notifyListeners();
    }
  }
}
