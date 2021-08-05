import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/wallet/data/models/e_shopping_model.dart';
import 'package:flutter_ui_kit/wallet/utility/colorResources.dart';
import 'package:flutter_ui_kit/wallet/utility/images.dart';
import 'package:flutter_ui_kit/wallet/utility/strings.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/button/custom_button.dart';

class ProductWidget extends StatelessWidget {
  final EShoppingModel eshoppingModel;
  ProductWidget(this.eshoppingModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 7, right: 7, bottom: 9, top: 7),
      decoration: BoxDecoration(
          color: ColorResources.COLOR_WHITE,
          borderRadius: BorderRadius.circular(7)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.favorite,
                color: ColorResources.COLOR_ROYAL_BLUE,
                size: 15,
              ),
              Icon(
                Icons.shop,
                color: ColorResources.COLOR_DARK_ORCHID,
                size: 15,
              ),
            ],
          ),
          Expanded(
            flex: 6,
            child: FadeInImage.assetNetwork(placeholder: Images.place_holder,
              image: eshoppingModel.imageUrl,
              fit: BoxFit.fill,),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                eshoppingModel.productName,
                style: poppinsRegular,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                eshoppingModel.productPrice,
                style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_PRIMARY_DARK,),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(5),
              child: CustomButton(
                btnTxt: Strings.BUY,
                btnHeight: 20,
                isProduct: true,
                onTap: (){},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
