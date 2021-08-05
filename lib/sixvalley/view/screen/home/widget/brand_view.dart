import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/provider/brand_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/product/brand_and_category_product_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class BrandView extends StatelessWidget {
  final bool isHomePage;
  BrandView({@required this.isHomePage});

  @override
  Widget build(BuildContext context) {

    Provider.of<SixBrandProvider>(context, listen: false).initBrandList();
    return Consumer<SixBrandProvider>(
      builder: (context, brandProvider, child) {

        return brandProvider.brandList.length != 0 ? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: (1/1.3),
            mainAxisSpacing: 10,
            crossAxisSpacing: 5,
          ),
          itemCount: brandProvider.brandList.length != 0
              ? isHomePage
              ? brandProvider.brandList.length > 8
              ? 8
              : brandProvider.brandList.length
              : brandProvider.brandList.length
              : 8,
          shrinkWrap: true,
          physics: isHomePage ? NeverScrollableScrollPhysics() : BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {

            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreen(
                  isBrand: true,
                  id: brandProvider.brandList[index].id.toString(),
                  name: brandProvider.brandList[index].name,
                  image: brandProvider.brandList[index].image,
                )));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                      decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.15), blurRadius: 5, spreadRadius: 1)]
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: FadeInImage.assetNetwork(placeholder: Images.placeholder_image, image: brandProvider.brandList[index].image,fit: BoxFit.scaleDown,)
                      ),
                    ),
                  ),
                  Center(child: Text(
                    brandProvider.brandList[index].name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: titilliumSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                  )),
                ],
              ),
            );

          },
        ) : BrandShimmer(isHomePage: isHomePage);

      },
    );
  }
}

class BrandShimmer extends StatelessWidget {
  final bool isHomePage;
  BrandShimmer({@required this.isHomePage});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: (1/1.3),
        mainAxisSpacing: 10,
        crossAxisSpacing: 5,
      ),
      itemCount: isHomePage ? 8 : 30,
      shrinkWrap: true,
      physics: isHomePage ? NeverScrollableScrollPhysics() : null,
      itemBuilder: (BuildContext context, int index) {

        return Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          enabled: Provider.of<SixBrandProvider>(context).brandList.length == 0,
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(child: Container(decoration: BoxDecoration(color: ColorResources.WHITE, shape: BoxShape.circle))),
            Container(height: 10, color: ColorResources.WHITE, margin: EdgeInsets.only(left: 25, right: 25)),
          ]),
        );

      },
    );
  }
}
