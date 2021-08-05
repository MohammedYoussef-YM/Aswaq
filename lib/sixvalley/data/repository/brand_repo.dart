import 'package:flutter_ui_kit/sixvalley/data/model/response/brand_model.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';

class SixBrandRepo {

  List<BrandModel> getBrandList() {
    List<BrandModel> brandList = [
      BrandModel(image: Images.brand, name: 'Xiaomi'),
      BrandModel(image: Images.brand_one, name: 'Apple'),
      BrandModel(image: Images.brand_two, name: 'Huawei'),
      BrandModel(image: Images.brand_three, name: 'Samsung'),
      BrandModel(image: Images.brand_four, name: 'Toyota'),
      BrandModel(image: Images.brand, name: 'Xiaomi'),
      BrandModel(image: Images.brand_one, name: 'Apple'),
      BrandModel(image: Images.brand_two, name: 'Huawei'),
      BrandModel(image: Images.brand_three, name: 'Samsung'),
      BrandModel(image: Images.brand_four, name: 'Toyota'),
      BrandModel(image: Images.brand, name: 'Xiaomi'),
      BrandModel(image: Images.brand_one, name: 'Apple'),
      BrandModel(image: Images.brand_two, name: 'Huawei'),
      BrandModel(image: Images.brand_three, name: 'Samsung'),
      BrandModel(image: Images.brand_four, name: 'Toyota'),
    ];
    return brandList;
  }
}