
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/order_details_model.dart';
import 'package:flutter_ui_kit/restaurant/data/model/response/product_model.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/product_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_app_bar.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_button.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_text_field.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class RateReviewScreen extends StatelessWidget {
  final Product product;
  final OrderDetailsModel orderDetailsModel;

  RateReviewScreen({this.product, this.orderDetailsModel});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(product.toJson());

    return Scaffold(
      appBar: CustomAppBar(title: getTranslated('rate_review', context)),
      body: Consumer<RestProductProvider>(
          builder: (context, productProvider, child) => Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
                          child: Container(
                            padding: EdgeInsets.only(left: 7, right: 10, top: 15),
                            margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
                            decoration: BoxDecoration(
                                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 2, offset: Offset(0, 1))],
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL)),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: FadeInImage.assetNetwork(
                                        placeholder: Images.placeholder,
                                        image:  product.image,
                                          height: 70,
                                          width: 85,
                                          fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                                    Expanded(
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                          Text(product.name, style: rubikMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
                                          SizedBox(height: 12),
                                          Text('\$ ${product.price}', style: rubikBold),
                                        ])),
                                    Row(
                                      children: [
                                        Text('${getTranslated('quantity', context)}: ',
                                            style: rubikMedium.copyWith(color: ColorResources.getGreyBunkerColor(context)), overflow: TextOverflow.ellipsis),
                                        Text(orderDetailsModel.quantity,
                                            style: rubikMedium.copyWith(color: ColorResources.getPrimaryColor(context), fontSize: Dimensions.FONT_SIZE_SMALL),
                                            overflow: TextOverflow.ellipsis),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 22),
                                Container(height: 1, color: ColorResources.COLOR_GAINSBORO),
                                SizedBox(height: 22),
                                Text('${getTranslated('rate_the_food', context)}: ',
                                    style: rubikMedium.copyWith(color: ColorResources.getGreyBunkerColor(context)), overflow: TextOverflow.ellipsis),
                                SizedBox(height: 24),
                                Container(
                                  height: 30,
                                  child: ListView.builder(
                                    itemCount: 5,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        child: Icon(
                                          Provider.of<RestProductProvider>(context).rating < (index + 1) ? Icons.star_border : Icons.star,
                                          size: 20,
                                          color: Provider.of<RestProductProvider>(context).rating < (index + 1)
                                              ? ColorResources.getGreyColor(context)
                                              : ColorResources.getPrimaryColor(context),
                                        ),
                                        onTap: () => Provider.of<RestProductProvider>(context, listen: false).setRating(index + 1),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 40),
                                Text('${getTranslated('share_your_opinion', context)}: ',
                                    style: rubikMedium.copyWith(color: ColorResources.getGreyBunkerColor(context)), overflow: TextOverflow.ellipsis),
                                SizedBox(height: 17),
                                CustomTextField(
                                  maxLines: 3,
                                  controller: _controller,
                                  hintText: getTranslated('write_your_review_here', context),
                                  fillColor: ColorResources.getSearchBg(context),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
                    child: Column(
                      children: [
                        CustomButton(
                                btnTxt: getTranslated('submit', context),
                                onTap: () {
                                  Navigator.pop(context);
                                  FocusScopeNode currentFocus = FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  _controller.clear();
                                },
                              ),
                        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => RestDashboardScreen()));
                            },
                            child: Text(
                              getTranslated('skip', context),
                              style: Theme.of(context).textTheme.headline2.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                            )),
                        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      ],
                    ),
                  )
                ],
              )),
    );
  }
}
