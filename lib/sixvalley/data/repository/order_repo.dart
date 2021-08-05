import 'package:flutter_ui_kit/sixvalley/data/model/response/order_details.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/order_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/shipping_method_model.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';

class SixOrderRepo {

  List<OrderModel> getOrderList() {
    List<OrderModel> orderList = [
      OrderModel(id: 100030, customerId: '1', paymentStatus: 'pending', paymentMethod: 'Cash On Delivery', orderAmount: '10000', shippingAddress: 'Dhaka, Bangladesh', discountAmount: '1000', discountType: 'amount', createdAt: '12-12-20', orderStatus: 'pending'),
      OrderModel(id: 100031, customerId: '1', paymentStatus: 'pending', paymentMethod: 'Ssl Ecommerce', orderAmount: '20000', shippingAddress: 'Dhaka, Bangladesh', discountAmount: '2000', discountType: 'amount', createdAt: '12-12-20', orderStatus: 'delivered'),
    ];
    return orderList;
  }

  List<OrderDetailsModel> getOrderDetails() {
    List<OrderDetailsModel> orderDetailsList = [
    OrderDetailsModel(id: 1, orderId: '1', productId: '1', sellerId: '1', productDetails: Product(1, 'admin', '1', 'Lamborghini', '', [], '', '', '1', '', [Images.white_car, Images.blue_car], Images.blue_car, '', '', '', '', [ProductColors(name: 'Black', code: '#000000')], '', [], [], [], '', '500', '450', '5', 'percent', '10', 'percent', '10', 'Tripod Projection Screen. This durable tripod projection screen from Apollo sets up in seconds. The screen is ideal for computer, video, slide and overhead projections. Keystone eliminator ends distortion problems which occur when screen and projector are on uneven planes, Flame-retardant, Matte white finish, Black 1-inch border, Easy-roll mechanism sets up quickly, Screen measures 70 inches long x 70 inches high, Origin- USA. No warranty', '', '', '', '', '', '', [Rating(average: '3.7')]), qty: '1', price: '10000', discount: '1000', deliveryStatus: 'pending', paymentStatus: 'pending', shippingMethodId: '1', createdAt: '12-12-20'),
    OrderDetailsModel(id: 1, orderId: '1', productId: '1', sellerId: '1', productDetails: Product(1, 'admin', '1', 'Lamborghini', '', [], '', '', '1', '', [Images.white_car, Images.blue_car], Images.blue_car, '', '', '', '', [ProductColors(name: 'Black', code: '#000000')], '', [], [], [], '', '500', '450', '5', 'percent', '10', 'percent', '10', 'Tripod Projection Screen. This durable tripod projection screen from Apollo sets up in seconds. The screen is ideal for computer, video, slide and overhead projections. Keystone eliminator ends distortion problems which occur when screen and projector are on uneven planes, Flame-retardant, Matte white finish, Black 1-inch border, Easy-roll mechanism sets up quickly, Screen measures 70 inches long x 70 inches high, Origin- USA. No warranty', '', '', '', '', '', '', [Rating(average: '3.7')]), qty: '1', price: '10000', discount: '1000', deliveryStatus: 'pending', paymentStatus: 'pending', shippingMethodId: '1', createdAt: '12-12-20'),
    ];
    return orderDetailsList;
  }

  List<ShippingMethodModel> getShippingList() {
    List<ShippingMethodModel> shippingMethodList = [
      ShippingMethodModel(id: 1, title: 'Currier', cost: '20', duration: '2-3 days'),
      ShippingMethodModel(id: 2, title: 'Company Vehicle', cost: '10', duration: '8-10 days'),
    ];
    return shippingMethodList;
  }

}
