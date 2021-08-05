import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/localization/language_constrants.dart';
import 'package:flutter_ui_kit/sixvalley/provider/seller_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/title_row.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/chat/chat_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/seller/seller_screen.dart';
import 'package:provider/provider.dart';

class SellerView extends StatelessWidget {
  final String sellerId;
  SellerView({@required this.sellerId});

  @override
  Widget build(BuildContext context) {
    Provider.of<SixSellerProvider>(context, listen: false).initSeller(sellerId);

    return Consumer<SixSellerProvider>(
      builder: (context, seller, child) {
        return Container(
          margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          color: Theme.of(context).accentColor,
          child: Column(children: [
            TitleRow(title: getTranslated('seller', context), isDetailsPage: true),
            Row(children: [
              Expanded(
                child: InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SellerScreen(seller: seller.sellerModel))),
                  child: Text(
                    seller.sellerModel != null ? seller.sellerModel.fName+' '+seller.sellerModel.lName : '',
                    style: titilliumSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: ColorResources.getSellerTxt(context)),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  if(seller.sellerModel != null) {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(seller: seller.sellerModel)));
                  }
                },
                icon: Image.asset(Images.chat_image, color: ColorResources.getSellerTxt(context), height: Dimensions.ICON_SIZE_DEFAULT),
              ),
            ]),
          ]),
        );
      },
    );
  }
}
