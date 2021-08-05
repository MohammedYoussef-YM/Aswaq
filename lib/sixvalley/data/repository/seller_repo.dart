import 'package:flutter_ui_kit/sixvalley/data/model/response/seller_model.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';

class SixSellerRepo {

  SellerModel getSeller() {
    SellerModel sellerModel = SellerModel(1, 'John', 'Doe', '+886745575', Images.brand_three, Shop(sellerId: '1', name: 'Daraz', image: Images.banner_one));
    return sellerModel;
  }
}