import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/data/models/faq_model.dart';
import 'package:flutter_ui_kit/household_app/data/models/review_model.dart';
import 'package:flutter_ui_kit/household_app/data/models/service_model.dart';
import 'package:flutter_ui_kit/household_app/provider/service_provider.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/images.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';
import 'package:flutter_ui_kit/household_app/view/screens/cart/cart_list_screen.dart';
import 'package:flutter_ui_kit/household_app/view/screens/services/widget/star_rating.dart';
import 'package:flutter_ui_kit/household_app/view/widget/custom_button.dart';
import 'package:provider/provider.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final ServiceModel service;
  final selectedServiceIndex;
  final selectedSubServiceIndex;

  ServiceDetailsScreen({this.service, this.selectedServiceIndex, this.selectedSubServiceIndex});

  @override
  Widget build(BuildContext context) {
    Provider.of<ServiceProvider>(context, listen: false).changeAddToCart(status: false);
    Provider.of<ServiceProvider>(context, listen: false).initializeAllFeatured();
    Provider.of<ServiceProvider>(context, listen: false).initializeAllFaq();
    Provider.of<ServiceProvider>(context, listen: false).initializeAllReviews();

    return Scaffold(
      backgroundColor: HouseHoldColorResources.COLOR_WHITE,
      appBar: AppBar(
        backgroundColor: HouseHoldColorResources.COLOR_PRIMARY,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: HouseHoldColorResources.COLOR_WHITE), onPressed: () => Navigator.pop(context)),
        title: Text(service.title),
      ),
      body: Consumer<ServiceProvider>(
        builder: (context, serviceProvider, child) => Column(
          children: [
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                 FadeInImage.assetNetwork(
                   placeholder: Images.place_holder,
                   image: service.imageUrl,
                   height: 223,
                   fit: BoxFit.fill,),
                  Container(
                    padding: EdgeInsets.all(HouseHoldDimensions.PADDING_SIZE_DEFAULT),
                    color: HouseHoldColorResources.COLOR_WHITE,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              service.title,
                              style: manropeRegular.copyWith(
                                  fontSize: HouseHoldDimensions.FONT_SIZE_LARGE, color: HouseHoldColorResources.COLOR_BLACK, fontWeight: FontWeight.bold),
                            ),
                            Text("\$${service.price}", style: manropeBold.copyWith(fontSize: 23, color: HouseHoldColorResources.COLOR_PRIMARY)),
                          ],
                        ),
                        SizedBox(height: HouseHoldDimensions.PADDING_SIZE_EXTRA_SMALL),
                        StarRating(rating: service.ratting, color: HouseHoldColorResources.COLOR_CRANBERRY),
                        SizedBox(height: HouseHoldDimensions.PADDING_SIZE_EXTRA_SMALL),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              service.ratting.toString(),
                              style: manropeLight,
                            ),
                            InkWell(
                              onTap: () {
                                serviceProvider.changeAddToCart(status: true);
                              },
                              child: serviceProvider.isAddToCart
                                  ? Container(
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(HouseHoldDimensions.PADDING_SIZE_SMALL),
                                          color: HouseHoldColorResources.COLOR_PRIMARY),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              serviceProvider.updatePrice(
                                                  isAdd: false, serviceIndex: selectedServiceIndex, subServiceIndex: selectedSubServiceIndex);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 7),
                                              child: Icon(Icons.remove, color: HouseHoldColorResources.COLOR_WHITE),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                            decoration: BoxDecoration(color: HouseHoldColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(2.0)),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '${service.quantity}',
                                                  style: manropeMedium.copyWith(
                                                      color: HouseHoldColorResources.COLOR_BLACK, fontSize: HouseHoldDimensions.FONT_SIZE_LARGE),
                                                ),
                                                Text(
                                                  ' unit',
                                                  style: manropeMedium.copyWith(color: HouseHoldColorResources.COLOR_NOBEL),
                                                ),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              serviceProvider.updatePrice(
                                                  isAdd: true, serviceIndex: selectedServiceIndex, subServiceIndex: selectedSubServiceIndex);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 7),
                                              child: Icon(Icons.add, color: HouseHoldColorResources.COLOR_WHITE),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      padding: EdgeInsets.all(13.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(HouseHoldDimensions.PADDING_SIZE_SMALL),
                                          color: HouseHoldColorResources.COLOR_PRIMARY),
                                      child: Row(
                                        children: [
                                          Icon(Icons.add, color: HouseHoldColorResources.COLOR_WHITE),
                                          Text(
                                            Strings.add_to_cart,
                                            style: manropeMedium.copyWith(
                                                color: HouseHoldColorResources.COLOR_WHITE, fontSize: HouseHoldDimensions.FONT_SIZE_LARGE),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: HouseHoldColorResources.COLOR_NOBEL.withOpacity(.3),
                    margin: EdgeInsets.only(bottom: HouseHoldDimensions.PADDING_SIZE_LARGE),
                  ),
                  Container(
                    color: HouseHoldColorResources.COLOR_WHITE,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              serviceProvider.changeTab(isFeature: true);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(9.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(HouseHoldDimensions.PADDING_SIZE_EXTRA_SMALL),
                                      bottomRight: Radius.circular(HouseHoldDimensions.PADDING_SIZE_EXTRA_SMALL)),
                                  color: serviceProvider.isFeature ? HouseHoldColorResources.COLOR_PRIMARY : Colors.transparent),
                              child: Text(
                                Strings.feature,
                                style: manropeLight.copyWith(
                                    color: serviceProvider.isFeature ? HouseHoldColorResources.COLOR_WHITE : HouseHoldColorResources.COLOR_NOBEL),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              serviceProvider.changeTab(isFaq: true);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(9.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(HouseHoldDimensions.PADDING_SIZE_EXTRA_SMALL),
                                  color: serviceProvider.isFaq ? HouseHoldColorResources.COLOR_PRIMARY : Colors.transparent),
                              child: Text(
                                Strings.faq,
                                style: manropeLight.copyWith(
                                    color: serviceProvider.isFaq ? HouseHoldColorResources.COLOR_WHITE : HouseHoldColorResources.COLOR_NOBEL),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              serviceProvider.changeTab(isReview: true);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(9.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(HouseHoldDimensions.PADDING_SIZE_EXTRA_SMALL),
                                      bottomLeft: Radius.circular(HouseHoldDimensions.PADDING_SIZE_EXTRA_SMALL)),
                                  color: serviceProvider.isReview ? HouseHoldColorResources.COLOR_PRIMARY : Colors.transparent),
                              child: Text(
                                Strings.review,
                                style: manropeLight.copyWith(
                                    color: serviceProvider.isReview ? HouseHoldColorResources.COLOR_WHITE : HouseHoldColorResources.COLOR_NOBEL),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(height: 1, color: HouseHoldColorResources.COLOR_NOBEL.withOpacity(.3)),
                  Container(
                    padding: EdgeInsets.all(HouseHoldDimensions.PADDING_SIZE_DEFAULT),
                    color: HouseHoldColorResources.COLOR_WHITE,
                    child: serviceProvider.isFeature
                        ? _featureWidget(context, features: serviceProvider.features)
                        : serviceProvider.isFaq
                            ? _faqView(context, faqs: serviceProvider.faqs,serviceProvider: serviceProvider)
                            : _reviewView(context,reviews: serviceProvider.reviews),
                  ),
                ],
              ),
            ),

            serviceProvider.isAddToCart ? Padding(
              padding: EdgeInsets.symmetric(horizontal: HouseHoldDimensions.PADDING_SIZE_LARGE, vertical: HouseHoldDimensions.PADDING_SIZE_SMALL),
              child: CustomButton(btnTxt: Strings.order_now, onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => CartListScreen()));
              }),
            ) : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _featureWidget(BuildContext context, {List<String> features}) {
    return ListView.builder(
      itemCount: features.length,
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.only(bottom: HouseHoldDimensions.PADDING_SIZE_LARGE),
        child: Row(
          children: [
            CircleAvatar(
              radius: 11,
              backgroundColor: HouseHoldColorResources.COLOR_CRANBERRY,
              child: Icon(
                Icons.done,
                color: HouseHoldColorResources.COLOR_WHITE,
                size: 18,
              ),
            ),
            SizedBox(width: HouseHoldDimensions.PADDING_SIZE_DEFAULT),
            Text(
              features[index],
              style: manropeLight.copyWith(color: HouseHoldColorResources.COLOR_CHARCOAL_HINT),
            )
          ],
        ),
      ),
    );
  }

  Widget _faqView(BuildContext context, {List<FaqModel> faqs,ServiceProvider serviceProvider}) {
    return ListView.builder(
        itemCount: faqs.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(10),
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      serviceProvider.toggleFaq(index);
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: HouseHoldColorResources.COLOR_CRANBERRY),
                      child: Icon(
                        faqs[index].isExpanded ? Icons.remove : Icons.add,
                        color: HouseHoldColorResources.COLOR_WHITE,
                        size: 15,
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          faqs[index].question,
                          style: manropeRegular.copyWith(color: HouseHoldColorResources.COLOR_CHARCOAL_HINT),
                        ),
                        faqs[index].isExpanded
                            ?SizedBox(height: 10):SizedBox.shrink(),
                        faqs[index].isExpanded
                            ? Text(
                                faqs[index].answer,
                                style: manropeLight.copyWith(color: HouseHoldColorResources.COLOR_CHARCOAL_HINT),
                              )
                            : SizedBox.shrink(),
                        SizedBox(height: faqs[index].isExpanded
                            ?30:20)
                      ],
                    ),
                  )
                ],
              ),
            ));
  }

  Widget _reviewView(BuildContext context, {List<ReviewModel> reviews}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(Strings.total_people_review,style: manropeLight),
            Text('1,259',style: manropeLight.copyWith(color: HouseHoldColorResources.COLOR_CRANBERRY)),
          ],
        ),
        SizedBox(height: HouseHoldDimensions.PADDING_SIZE_EXTRA_LARGE),
        ListView.builder(
            itemCount: reviews.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index)=>Container(
              padding: EdgeInsets.all(HouseHoldDimensions.PADDING_SIZE_DEFAULT),
              margin: EdgeInsets.only(bottom: HouseHoldDimensions.PADDING_SIZE_DEFAULT),
              decoration: BoxDecoration(
                color: HouseHoldColorResources.COLOR_SOLITUDE,
                borderRadius: BorderRadius.circular(HouseHoldDimensions.PADDING_SIZE_SMALL)
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          FadeInImage.assetNetwork(placeholder: Images.place_holder, image: reviews[index].imageUrl,width: 32,height: 32,fit: BoxFit.fill,),
                          SizedBox(width: HouseHoldDimensions.PADDING_SIZE_SMALL,),
                          Text(reviews[index].name,style: manropeBold.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE),)
                        ],
                      ),
                      StarRating(rating: reviews[index].ratting,color: HouseHoldColorResources.COLOR_CRANBERRY,)
                    ],
                  ),
                  SizedBox(height: HouseHoldDimensions.PADDING_SIZE_EXTRA_LARGE),
                  Text(reviews[index].feedback,style: manropeLight.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE),),
                  SizedBox(height: HouseHoldDimensions.PADDING_SIZE_EXTRA_SMALL),
                ],
              ),
            ))
      ],
    );
  }
}
