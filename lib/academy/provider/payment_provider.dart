import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/data/model/payment_model.dart';
import 'package:flutter_ui_kit/academy/data/repository/payment_repo.dart';

class AcademyPaymentProvider extends ChangeNotifier {
  AcademyPaymentRepo paymentRepo;
  AcademyPaymentProvider({@required this.paymentRepo});

  List<PaymentModel> _paymentList = [];
  int _selectedIndex = 0;
  List<PaymentModel> get paymentList => _paymentList;
  int get selectedIndex => _selectedIndex;

  void getPayments() {
    _paymentList.clear();
    _paymentList.addAll(paymentRepo.getPayments());
    notifyListeners();
  }

  void setSelected(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

}