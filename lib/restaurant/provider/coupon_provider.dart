import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/base/api_response.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/coupon_model.dart';
import 'package:flutter_ui_kit/restaurant/data/repository/coupon_repo.dart';

class RestCouponProvider extends ChangeNotifier {
  final RestCouponRepo couponRepo;
  RestCouponProvider({@required this.couponRepo});

  List<CouponModel> _couponList;
  CouponModel _coupon;
  double _discount = 0.0;
  bool _isLoading = false;

  CouponModel get coupon => _coupon;
  double get discount => _discount;
  bool get isLoading => _isLoading;
  List<CouponModel> get couponList => _couponList;

  void getCouponList(BuildContext context) async {
    ApiResponse apiResponse = await couponRepo.getCouponList();
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _couponList = [];
      apiResponse.response.data.forEach((category) => _couponList.add(category));
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(apiResponse.error.toString())));
    }
  }

  Future<double> applyCoupon(String coupon, double order) async {
    _isLoading = true;
    notifyListeners();
    if (coupon == _couponList[0].code || coupon == _couponList[1].code) {
      if(coupon == _couponList[0].code) {
        _coupon = _couponList[0];
      }else {
        _coupon = _couponList[1];
      }
      if (_coupon.minPurchase != null && double.parse(_coupon.minPurchase) < order) {
        if(_coupon.discountType == 'percent') {
          _discount = (double.parse(_coupon.discount) * order / 100) < double.parse(_coupon.maxDiscount)
              ? (double.parse(_coupon.discount) * order / 100) : double.parse(_coupon.maxDiscount);
        }else {
          _discount = double.parse(_coupon.discount);
        }
      } else {
        _discount = 0.0;
      }
    } else {
      _discount = 0.0;
    }
    _isLoading = false;
    notifyListeners();
    return _discount;
  }

  void removeCouponData() {
    _coupon = null;
    _isLoading = false;
    _discount = 0.0;
    notifyListeners();
  }
}