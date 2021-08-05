import 'package:flutter_ui_kit/wallet/data/models/charity_model.dart';
import 'package:flutter_ui_kit/wallet/utility/colorResources.dart';
import 'package:flutter_ui_kit/wallet/utility/images.dart';
import 'package:flutter_ui_kit/wallet/utility/strings.dart';

class CharityRepo {
  List<CharityModel> getCharityList() {
    List<CharityModel> charityList = [
      CharityModel(
        imageUrl: Images.image_one,
        condition: Strings.ONGOING,
        title: Strings.TREE_PLANTATION,
        description: Strings.DUIS_AUTE,
        titleRightImageUrl: Images.image_two,
        price1: Strings.DOLLER29,
        price2: Strings.DOLLER49,
        color1: ColorResources.COLOR_BRIGHT_TURQUOISE,
        color2: ColorResources.COLOR_BRIGHT_TURQUOISE,
        color3: ColorResources.COLOR_DODGER_BLUE,
      ),
      CharityModel(
        imageUrl: Images.image_one,
        condition: Strings.CLOSED,
        title: Strings.TREE_PLANTATION,
        description: Strings.DUIS_AUTE,
        titleRightImageUrl: Images.image_two,
        price1: Strings.DOLLER29,
        price2: Strings.DOLLER49,
        color1: ColorResources.COLOR_CARROT_ORANGE,
        color2: ColorResources.COLOR_CARROT_ORANGE,
        color3: ColorResources.COLOR_ALIZARIN,
      ),
      CharityModel(
        imageUrl: Images.image_one,
        condition: Strings.ONGOING,
        title: Strings.TREE_PLANTATION,
        description: Strings.DUIS_AUTE,
        titleRightImageUrl: Images.image_two,
        price1: Strings.DOLLER29,
        price2: Strings.DOLLER49,
        color1: ColorResources.COLOR_BRIGHT_TURQUOISE,
        color2: ColorResources.COLOR_BRIGHT_TURQUOISE,
        color3: ColorResources.COLOR_DODGER_BLUE,
      ),
    ];
    return charityList;
  }
}
