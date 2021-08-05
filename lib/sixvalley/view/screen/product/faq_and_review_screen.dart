import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/response/review_model.dart';
import 'package:flutter_ui_kit/sixvalley/helper/network_info.dart';
import 'package:flutter_ui_kit/sixvalley/localization/language_constrants.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/custom_app_bar.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/product/widget/review_widget.dart';

class ReviewScreen extends StatelessWidget {
  final List<ReviewModel> reviewList;
  ReviewScreen({this.reviewList});

  @override
  Widget build(BuildContext context) {
    NetworkInfo.checkConnectivity(context);

    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

        CustomAppBar(title: getTranslated('reviews', context)),

        Padding(
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          child: Text(getTranslated('reviews', context)+'(${reviewList.length})', style: robotoBold),
        ),

        Expanded(child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          itemCount: reviewList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
              color: Theme.of(context).accentColor,
              child: ReviewWidget(reviewModel: reviewList[index]),
            );
          },
        )),

      ]),
    );
  }
}
