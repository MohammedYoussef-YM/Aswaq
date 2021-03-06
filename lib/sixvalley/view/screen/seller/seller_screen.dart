import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/seller_model.dart';
import 'package:flutter_ui_kit/sixvalley/helper/network_info.dart';
import 'package:flutter_ui_kit/sixvalley/helper/product_type.dart';
import 'package:flutter_ui_kit/sixvalley/provider/product_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/rating_bar.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/search_widget.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/home/widget/products_view.dart';
import 'package:provider/provider.dart';

class SellerScreen extends StatelessWidget {
  final SellerModel seller;
  SellerScreen({@required this.seller});

  @override
  Widget build(BuildContext context) {
    Provider.of<SixProductProvider>(context, listen: false).removeFirstLoading();
    ScrollController _scrollController = ScrollController();
    NetworkInfo.checkConnectivity(context);

    return Scaffold(
      backgroundColor: ColorResources.getIconBg(context),

      body: Column(
        children: [

          SearchWidget(
            hintText: 'Search product...',
            onTextChanged: (String newText) => Provider.of<SixProductProvider>(context, listen: false).filterData(newText),
            onClearPressed: () {},
          ),

          Expanded(
            child: ListView(
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(0),
              children: [

                // Banner
                Padding(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage.assetNetwork(
                      placeholder: Images.placeholder_image,
                      image: seller.shop.image,
                      height: 120,
                      fit: BoxFit.cover,),
                  ),
                ),

                Container(
                  color: Theme.of(context).accentColor,
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  child: Column(children: [

                    // Seller Info
                    Row(children: [
                     FadeInImage.assetNetwork(
                       placeholder: Images.placeholder_image,
                       image: seller.image,
                       height: 80,
                       width: 80,
                       fit: BoxFit.cover,),
                      SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(
                          seller.fName+' '+seller.lName,
                          style: titilliumSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        Row(children: [
                          Text('3.7', style: titilliumSemiBold.copyWith(
                            fontSize: Dimensions.FONT_SIZE_LARGE,
                            color: Theme.of(context).hintColor,
                          )),
                          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          RatingBar(rating: 3.7),
                          SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                          Text('${0} Reviews', style: titilliumRegular.copyWith(
                            fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                            color: Theme.of(context).hintColor,
                          )),
                        ]),
                      ]),
                    ]),

                  ]),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                Padding(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  child: ProductView(productType: ProductType.SELLER_PRODUCT, scrollController: _scrollController, sellerId: seller.id.toString()),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
