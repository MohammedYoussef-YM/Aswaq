import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/banner_provider.dart';
import 'package:flutter_ui_kit/restaurant/provider/theme_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant/view/base/title_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class BannerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: TitleWidget(title: getTranslated('banner', context)),
        ),

        SizedBox(
          height: 85,
          child: Consumer<RestBannerProvider>(
            builder: (context, banner, child) {
              return banner.bannerList != null ? banner.bannerList.length > 0 ? ListView.builder(
                itemCount: banner.bannerList.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL),
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                          color: Colors.grey[Provider.of<RestThemeProvider>(context).darkTheme ? 700 : 300],
                          spreadRadius: 1, blurRadius: 5),
                      ],
                      color: ColorResources.COLOR_WHITE,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage.assetNetwork(
                        placeholder: Images.placeholder,
                        image:  banner.bannerList[index].image,
                        width: 250, height: 85, fit: BoxFit.cover,),
                    ),
                  );
                },
              ) : Center(child: Text(getTranslated('no_banner_available', context))) : BannerShimmer();
            },
          ),
        ),
      ],
    );
  }
}

class BannerShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          enabled: Provider.of<RestBannerProvider>(context).bannerList == null,
          child: Container(
            width: 250, height: 85,
            margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL),
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey[200], spreadRadius: 1, blurRadius: 5)],
              color: ColorResources.COLOR_WHITE,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }
}

