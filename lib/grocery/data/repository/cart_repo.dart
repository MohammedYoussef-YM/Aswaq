import 'package:flutter_ui_kit/grocery/data/models/product.dart';
import 'package:flutter_ui_kit/grocery/utility/images.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';

class CartRepo {
  List<GroceryProduct> getAllSingleItems = [
    GroceryProduct(
        imageUrl: Images.banana,
        isFabourite: false,
        name: Strings.banana,
        runningPrice: Strings.doller_49_125,
        rating: Strings.ratting_4_9,
        quantity: Strings.one_pics_box,
        id: 1,
        previoudPrice: Strings.doller_580,
        off: Strings.ten_percent_off,
        count: 1),
    GroceryProduct(
        imageUrl: Images.carrot,
        isFabourite: false,
        name: Strings.carrot,
        runningPrice: Strings.doller_49_125,
        rating: Strings.ratting_4_9,
        id: 2,
        quantity: Strings.one_pics_box,
        previoudPrice: Strings.doller_580,
        off: Strings.ten_percent_off,
        count: 1),
  ];

  List<GroceryProduct> getFreshSaladPastaProducts = [
    GroceryProduct(
        imageUrl: Images.cauliflower,
        isFabourite: false,
        name: Strings.cauliflower,
        runningPrice: Strings.doller_49_125,
        rating: Strings.ratting_4_9,
        quantity: Strings.one_pics_box,
        id: 1,
        previoudPrice: Strings.doller_580,
        off: Strings.ten_percent_off,
        count: 1),
    GroceryProduct(
        imageUrl: Images.coconut,
        isFabourite: false,
        name: Strings.coconut,
        runningPrice: Strings.doller_49_125,
        rating: Strings.ratting_4_9,
        id: 2,
        quantity: Strings.one_pics_box,
        previoudPrice: Strings.doller_580,
        off: Strings.ten_percent_off,
        count: 1),
    GroceryProduct(
        imageUrl: Images.corn,
        isFabourite: false,
        name: Strings.corn,
        runningPrice: Strings.doller_49_125,
        rating: Strings.ratting_4_9,
        quantity: Strings.one_pics_box,
        id: 1,
        previoudPrice: Strings.doller_580,
        off: Strings.ten_percent_off,
        count: 1),
    GroceryProduct(
        imageUrl: Images.garlic,
        isFabourite: false,
        name: Strings.garlic,
        runningPrice: Strings.doller_49_125,
        rating: Strings.ratting_4_9,
        id: 2,
        quantity: Strings.one_pics_box,
        previoudPrice: Strings.doller_580,
        off: Strings.ten_percent_off,
        count: 1),
    GroceryProduct(
        imageUrl: Images.mango,
        isFabourite: false,
        name: Strings.mango,
        runningPrice: Strings.doller_49_125,
        rating: Strings.ratting_4_9,
        quantity: Strings.one_pics_box,
        id: 1,
        previoudPrice: Strings.doller_580,
        off: Strings.ten_percent_off,
        count: 1),
    GroceryProduct(
        imageUrl: Images.nut,
        isFabourite: false,
        name: Strings.nuts,
        runningPrice: Strings.doller_49_125,
        rating: Strings.ratting_4_9,
        id: 2,
        quantity: Strings.one_pics_box,
        previoudPrice: Strings.doller_580,
        off: Strings.ten_percent_off,
        count: 1),

  ];
}
