import 'package:flutter_ui_kit/food/model/order_model.dart';
import 'package:flutter_ui_kit/food/model/product.dart';
import 'package:flutter_ui_kit/food/utility/images.dart';

class MockData{

  static List<Product> productList = [
    Product(
        id:1,
        name: 'Chickenjoy C1',
        description: 'Lorem ipsum, Lorem',
        image: Images.product_two,
        status: 'HOT',
        price: 45),
    Product(
        id:2,
        name: 'Coke Float',
        description: 'Lorem ipsum, Lorem ',
        image: Images.product_three,
        status: 'Large',
        price: 60),
    Product(
        id:3,
        name: 'Chickenjoy C1',
        description: 'Lorem ipsum, Lorem ',
        image: Images.product_one,
        status: 'HOT',
        price: 45),
    Product(
        id:4,
        name: 'Chickenjoy C1',
        description: 'Lorem ipsum, Lorem',
        image: Images.product_two,
        status: 'HOT',
        price: 45),
    Product(
        id:5,
        name: 'Coke Float',
        description: 'Lorem ipsum, Lorem ',
        image: Images.product_three,
        status: 'Large',
        price: 60),
    Product(
        id:6,
        name: 'Chickenjoy C1',
        description: 'Lorem ipsum, Lorem ',
        image: Images.product_one,
        status: 'HOT',
        price: 45),
    Product(
        id:7,
        name: 'Chickenjoy C1',
        description: 'Lorem ipsum, Lorem',
        image: Images.product_two,
        status: 'HOT',
        price: 45),
    Product(
        id:8,
        name: 'Coke Float',
        description: 'Lorem ipsum, Lorem ',
        image: Images.product_three,
        status: 'Large',
        price: 60),
    Product(
        id:9,
        name: 'Chickenjoy C1',
        description: 'Lorem ipsum, Lorem ',
        image: Images.product_two,
        status: 'HOT',
        price: 45),
  ];

  static List<Product> cartList = [
    Product(
        id:1,
        name: 'Chickenjoy C1',
        description: 'Lorem ipsum, Lorem',
        image: Images.product_two,
        status: 'HOT',
        price: 45),
    Product(
        id:2,
        name: 'Coke Float',
        description: 'Lorem ipsum, Lorem ',
        image: Images.product_one,
        status: 'Large',
        price: 60),
  ];
  // static List<OrderModel> order_list = [
  //   OrderModel(
  //     Product(
  //         id:1,
  //         name: 'Chickenjoy C1',
  //         description: 'Lorem ipsum, Lorem',
  //         image: 'assets/food/images/product_two.png',
  //         status: 'HOT',
  //         price: 45),
  //     1,
  //   ),
  //   OrderModel(
  //     Product(
  //         id:2,
  //         name: 'Coke Float',
  //         description: 'Lorem ipsum, Lorem ',
  //         image: 'assets/food/images/product_three.png',
  //         status: 'Large',
  //         price: 60),
  //     1,
  //   ),
  // ];

  static List<OrderModel> orderList = [
    OrderModel(
      Product(
          id:1,
          name: 'Chickenjoy C1',
          description: 'Lorem ipsum, Lorem',
          image: Images.product_two,
          status: 'HOT',
          price: 45),
      1,
    ),
    OrderModel(
      Product(
          id:2,
          name: 'Coke Float',
          description: 'Lorem ipsum, Lorem ',
          image: Images.product_three,
          status: 'Large',
          price: 60),
      1,
    ),
  ];

}