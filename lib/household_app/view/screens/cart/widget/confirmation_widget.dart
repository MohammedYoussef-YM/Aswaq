import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/utility/images.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui_kit/household_app/provider/cart_provider.dart';

class ConfirmationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.symmetric(vertical: HouseHoldDimensions.PADDING_SIZE_LARGE), children: [

      Text(Strings.item_list, style: manropeMedium.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),

      Container(
        margin: EdgeInsets.only(top: HouseHoldDimensions.PADDING_SIZE_SMALL),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: HouseHoldColorResources.COLOR_WHITE),
        child: Row(children: [
          FadeInImage.assetNetwork(placeholder: Images.place_holder, image: Images.clean,fit: BoxFit.fill,),
          Expanded(child: Padding(
            padding: EdgeInsets.all(HouseHoldDimensions.PADDING_SIZE_EXTRA_SMALL),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(Strings.color_painting, style: manropeMedium.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),
              SizedBox(height: 10),
              Row( children: [
                IconButton(icon: Icon(Icons.remove), onPressed: () => Provider.of<HouseCartProvider>(context, listen: false).setCartQuantity(false)),
                Text(Provider.of<HouseCartProvider>(context).cartQty.toString(), style: manropeSemiBold.copyWith(color: HouseHoldColorResources.COLOR_CRANBERRY, fontSize: HouseHoldDimensions.PADDING_SIZE_LARGE)),
                IconButton(icon: Icon(Icons.add), onPressed: () => Provider.of<HouseCartProvider>(context, listen: false).setCartQuantity(true)),
                Expanded(child: SizedBox()),
                Text('\$50', style: manropeBold.copyWith(fontSize: 24, color: HouseHoldColorResources.COLOR_PRIMARY)),
              ])
            ]),
          )),
        ]),
      ),
      SizedBox(height: 20),

      Text(Strings.bill_details, style: manropeMedium.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),
      SizedBox(height: 10),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(Strings.item_total, style: manropeLight.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),
        Text('\$50', style: manropeRegular.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(Strings.vat, style: manropeLight.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),
        Text('\$0.5', style: manropeRegular.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),
      ]),
      Divider(color: HouseHoldColorResources.COLOR_PRIMARY),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(Strings.to_pay, style: manropeMedium.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE, color: HouseHoldColorResources.COLOR_PRIMARY)),
        Text('\$ 50.5', style: manropeMedium.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE, color: HouseHoldColorResources.COLOR_PRIMARY)),
      ]),

    ]);
  }
}
