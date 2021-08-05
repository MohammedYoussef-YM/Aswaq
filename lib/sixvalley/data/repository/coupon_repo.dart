import 'package:flutter_ui_kit/sixvalley/data/model/response/coupon_model.dart';

class SixCouponRepo {

  CouponModel getCoupon() {
    CouponModel couponModel = CouponModel(id: 1, title: '', code: 'ABC', minPurchase: '100', maxDiscount: '1000', discount: '60', discountType: 'percent');
    return couponModel;
  }
}