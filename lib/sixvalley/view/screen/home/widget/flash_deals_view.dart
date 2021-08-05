import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/helper/price_converter.dart';
import 'package:flutter_ui_kit/sixvalley/provider/mega_deal_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/theme_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/product/product_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class FlashDealsView extends StatelessWidget {
  final bool isHomeScreen;
  FlashDealsView({this.isHomeScreen = true});

  @override
  Widget build(BuildContext context) {

    return Consumer<SixMegaDealProvider>(
      builder: (context, megaProvider, child) {
        return Provider.of<SixMegaDealProvider>(context).megaDealList.length != 0 ? ListView.builder(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: isHomeScreen ? Axis.horizontal : Axis.vertical,
          itemCount: megaProvider.megaDealList.length == 0 ? 2 : megaProvider.megaDealList.length,
          itemBuilder: (context, index) {

            return InkWell(
              onTap: () {
                Navigator.push(context, PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 1000),
                  pageBuilder: (context, anim1, anim2) => SixProductDetails(product: megaProvider.megaDealList[index]),
                ));
              },
              child: Container(
                margin: EdgeInsets.all(5),
                width: isHomeScreen ? 300 : null,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).accentColor,
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1, blurRadius: 5)]),
                child: Stack(children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [

                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
                        decoration: BoxDecoration(
                          color: ColorResources.getIconBg(context),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        ),
                        child: FadeInImage.assetNetwork(
                            placeholder: Images.placeholder_image,
                            image: megaProvider.megaDealList[index].thumbnail,
                        fit: BoxFit.scaleDown,),
                      ),
                    ),

                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                megaProvider.megaDealList[index].name,
                                style: robotoRegular,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                              Text(
                                PriceConverter.convertPrice(context, double.parse(megaProvider.megaDealList[index].unitPrice),
                                    discountType: megaProvider.megaDealList[index].discountType, discount: megaProvider.megaDealList[index].discount),
                                style: robotoBold.copyWith(color: ColorResources.getPrimary(context)),
                              ),
                              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                              Row(children: [
                                Expanded(
                                  child: Text(
                                    double.parse(megaProvider.megaDealList[index].discount) > 0
                                        ? PriceConverter.convertPrice(context, double.parse(megaProvider.megaDealList[index].unitPrice)) : '',
                                    style: robotoBold.copyWith(
                                      color: ColorResources.HINT_TEXT_COLOR,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                                    ),
                                  ),
                                ),
                                Text(
                                  megaProvider.megaDealList[index].rating.length != 0 ? double.parse(megaProvider.megaDealList[index].rating[0].average).toStringAsFixed(1) : '0.0',
                                  style: robotoRegular.copyWith(color: Provider.of<SixThemeProvider>(context).darkTheme ? Colors.white : Colors.orange, fontSize: Dimensions.FONT_SIZE_SMALL),
                                ),
                                Icon(Icons.star, color: Provider.of<SixThemeProvider>(context).darkTheme ? Colors.white : Colors.orange, size: 15),
                              ]),
                            ],
                        ),
                      ),
                    ),
                  ]),

                  // Off
                  double.parse(megaProvider.megaDealList[index].discount) >= 1 ? Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 60,
                      height: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorResources.getPrimary(context),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                      ),
                      child: Text(
                        PriceConverter.percentageCalculation(
                          context,
                          megaProvider.megaDealList[index].unitPrice,
                          megaProvider.megaDealList[index].discount,
                          megaProvider.megaDealList[index].discountType,
                        ),
                        style: robotoRegular.copyWith(color: Theme.of(context).accentColor, fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL),
                      ),
                    ),
                  ) : SizedBox.shrink(),
                ]),
              ),
            );
          },
        ) : MegaDealShimmer(isHomeScreen: isHomeScreen);
      },
    );
  }
}

class MegaDealShimmer extends StatelessWidget {
  final bool isHomeScreen;
  MegaDealShimmer({@required this.isHomeScreen});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: isHomeScreen ? Axis.horizontal : Axis.vertical,
      itemCount: 2,
      itemBuilder: (context, index) {

        return Container(
          margin: EdgeInsets.all(5),
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorResources.WHITE,
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1, blurRadius: 5)]),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            enabled: Provider.of<SixMegaDealProvider>(context).megaDealList.length == 0,
            child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [

              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
                  decoration: BoxDecoration(
                    color: ColorResources.ICON_BG,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                  ),
                ),
              ),

              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(height: 20, color: ColorResources.WHITE),
                        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        Row(children: [
                          Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Container(height: 20, width: 50, color: ColorResources.WHITE),
                            ]),
                          ),
                          Container(height: 10, width: 50, color: ColorResources.WHITE),
                          Icon(Icons.star, color: Colors.orange, size: 15),
                        ]),
                      ]),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
