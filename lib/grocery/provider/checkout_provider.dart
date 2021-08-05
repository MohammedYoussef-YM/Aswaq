import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/data/models/payment.dart';
import 'package:flutter_ui_kit/grocery/data/repository/checkout_repo.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';

class CheckoutProvider with ChangeNotifier {
  final CheckoutRepo checkoutRepo;

  CheckoutProvider({this.checkoutRepo});

  List<String> _getDeliveryTime = [];
  List<String> get getDeliveryTime => _getDeliveryTime;

  List<String> _getOrderList = [];
  List<String> get getOrderList => _getOrderList;

  List<PaymentModel> _getPaymentsModels = [];
  List<PaymentModel> get getPaymentsModels => _getPaymentsModels;
  int _selectPaymentIndex=0;
  int get selectPaymentIndex=>_selectPaymentIndex;

  updatePaymentIndex(int index){
    _selectPaymentIndex=index;
    notifyListeners();
  }

  String _order = '';
  String get order => _order;

  String _deliveryTime = '';
  String get deliveryTime => _deliveryTime;

  String _selectDate=Strings.date;
  String get selectDate=>_selectDate;

  updateDate(String value){
    _selectDate=value;
    notifyListeners();
  }

  changeDeliveryTime(String value) {
    _deliveryTime=value;
    notifyListeners();
  }
  changeOrderList(String value) {
    _order=value;
    notifyListeners();
  }
  initializeChangeDeliveryTime() {
    if (_getDeliveryTime.length == 0) {
      _getDeliveryTime.clear();
      _getDeliveryTime = checkoutRepo.getDeliveryTime;
      _deliveryTime=checkoutRepo.getDeliveryTime[0];
      notifyListeners();
    }
  }
  initializeOrderList() {
    if (_getOrderList.length == 0) {
      _getOrderList.clear();
      _getOrderList = checkoutRepo.getOrderList;
      _order=checkoutRepo.getOrderList[0];
      notifyListeners();
    }
  }
  initializePaymentModel() {
    if (_getPaymentsModels.length == 0) {
      _getPaymentsModels.clear();
      _getPaymentsModels = checkoutRepo.getPaymentModels;
      notifyListeners();
    }
  }

  List<IconData> _getAllAddressTypeIcon=[];
  List<IconData> get getAllAddressTypeIcon=>_getAllAddressTypeIcon;

  IconData _initializeIconData;
  IconData get initializeIconData=>_initializeIconData;

  changeAddressType(IconData iconData){
    _initializeIconData=iconData;
    notifyListeners();
  }

  initializeAddressTypeIcon(){
    if (_getAllAddressTypeIcon.length == 0) {
      _getAllAddressTypeIcon.clear();
      _getAllAddressTypeIcon = checkoutRepo.getAllAddressTypeIcon;
      _initializeIconData=checkoutRepo.getAllAddressTypeIcon[0];
      notifyListeners();
    }
  }

  bool _isDefaultDeliveryAddress=false;
  bool get isDefaultDeliveryAddress=>_isDefaultDeliveryAddress;

  toggolDeliveryAddress(){
    _isDefaultDeliveryAddress=!_isDefaultDeliveryAddress;
    notifyListeners();
  }
}
