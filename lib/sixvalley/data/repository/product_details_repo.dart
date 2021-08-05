
import 'dart:collection';

import 'package:flutter_ui_kit/sixvalley/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/review_model.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';

class SixProductDetailsRepo {
  Product getProduct() {
    Product product = Product(1, 'admin', '1', 'Lamborghini', '', [], '', '', '1', '', ['assets/sixvalley/images/white_car.png', 'assets/sixvalley/images/blue_car.png'], Images.blue_car, '', '', '', '', [ProductColors(name: 'Black', code: '#000000')], '', [], [], [], '', '500', '450', '5', 'percent', '10', 'percent', '10', 'Tripod Projection Screen. This durable tripod projection screen from Apollo sets up in seconds. The screen is ideal for computer, video, slide and overhead projections. Keystone eliminator ends distortion problems which occur when screen and projector are on uneven planes, Flame-retardant, Matte white finish, Black 1-inch border, Easy-roll mechanism sets up quickly, Screen measures 70 inches long x 70 inches high, Origin- USA. No warranty', '', '', '', '', '', '', [Rating(average: '3.7')]);
    return product;
  }

  List<ReviewModel> getReviews() {
    List<ReviewModel> reviewList = [
      ReviewModel(id: 1, productId: '1', customerId: '1', comment: 'Good product', rating: '3', updatedAt: DateTime.now().toString(), customer: Customer(name: '', fName: 'John', lName: 'Doe', phone: '+88665674', email: 'johndoe@gmail.com', image: Images.person), attachment: []),
    ];
    return reviewList;
  }

  Map getCount() {
    Map map = HashMap();
    map['order_count'] = 54;
    map['wishlist_count'] = 64;
    return map;
  }

  String getSharableLink() {
    return 'https://www.facebook.com';
  }
}