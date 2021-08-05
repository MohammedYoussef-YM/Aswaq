import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/wallet/data/models/charity_model.dart';
import 'package:flutter_ui_kit/wallet/utility/colorResources.dart';
import 'package:flutter_ui_kit/wallet/utility/dimensions.dart';
import 'package:flutter_ui_kit/wallet/utility/images.dart';
import 'package:flutter_ui_kit/wallet/utility/strings.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';

class CharityCardWidget extends StatelessWidget {
  final CharityModel charity;
  CharityCardWidget(this.charity);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: ColorResources.COLOR_WHITE),
      child: Column(
        children: [
          Container(
            height: 120,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FadeInImage.assetNetwork(
                    placeholder: Images.place_holder,
                    image: charity.imageUrl, width: double.infinity, fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 80,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      gradient: LinearGradient(colors: [charity.color1, charity.color2, charity.color3])),
                    child: Text(charity.condition, style: poppinsRegular.copyWith(fontSize: 10)),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_LARGE),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(charity.title, style: poppinsSemiBold),
                FadeInImage.assetNetwork(placeholder: Images.place_holder, image: charity.titleRightImageUrl, width: 50, height: 38,fit: BoxFit.fill,),
              ],
            ),
          ),
          Text(charity.description, style: montserratSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL)),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: Dimensions.PADDING_SIZE_LARGE),
            height: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: ColorResources.COLOR_WHITE_SMOKE),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: ColorResources.COLOR_PRIMARY_DARK),
                    child: Text(Strings.DOLLER29, style: poppinsRegular.copyWith(color: ColorResources.COLOR_WHITE)),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(Strings.DOLLER_49, style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY)),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(Strings.DONATE),
              SizedBox(width: 10),
              Icon(Icons.chevron_right, size: 25, color: ColorResources.COLOR_ROYAL_BLUE),
            ],
          ),
        ],
      ),
    );
  }
}
