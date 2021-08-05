
import 'package:flutter_ui_kit/sixvalley/data/model/response/tracking_model.dart';

class SixTrackingRepo {

  TrackingModel getTrackingInfo() {
    TrackingModel trackingModel = TrackingModel(id: 1, customerId: '1', customerType: 'user', paymentStatus: 'pending', orderStatus: 'delivered', orderAmount: '10000', shippingAddress: 'Dhaka, Bangladesh', discountAmount: '1000', discountType: 'percent');
    return trackingModel;
  }
}