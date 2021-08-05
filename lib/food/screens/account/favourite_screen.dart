import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/data/mock_data.dart';
import 'package:flutter_ui_kit/food/screens/widget/open_cart_bottom_sheet.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/utility/dimensions.dart';
import 'package:flutter_ui_kit/food/utility/images.dart';
import 'package:flutter_ui_kit/food/utility/strings.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(bottom:50),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left:Dimensions.PADDING_SIZE_SMALL,
                right: Dimensions.PADDING_SIZE_SMALL),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: ColorResources.COLOR_WHITE,
                        borderRadius:
                        BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: ColorResources.COLOR_GREY
                                .withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 15,
                            offset: Offset(0,
                                1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left:Dimensions.PADDING_SIZE_SMALL,right: Dimensions.PADDING_SIZE_SMALL),
                          child: Row(
                            children: [
                              Text(
                                Strings.SORT_BY,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: ColorResources.COLOR_GREY,
                                ),
                              ),
                              Text(
                                Strings.TIME,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: ColorResources.COLOR_PRIMARY,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: ColorResources.COLOR_WHITE,
                            borderRadius:
                            BorderRadius.all(Radius.circular(100)),
                            boxShadow: [
                              BoxShadow(
                                color: ColorResources.COLOR_GREY
                                    .withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 15,
                                offset: Offset(0,
                                    1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(Icons.clear_all,
                            color: ColorResources.COLOR_PRIMARY,
                            size: 20,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:Dimensions.PADDING_SIZE_SMALL),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: ColorResources.COLOR_WHITE,
                              borderRadius:
                              BorderRadius.all(Radius.circular(100)),
                              boxShadow: [
                                BoxShadow(
                                  color: ColorResources.COLOR_GREY
                                      .withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 15,
                                  offset: Offset(0,
                                      1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Center(
                              child: Icon(Icons.import_export,
                                color: ColorResources.COLOR_PRIMARY,
                                size: 20,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(bottom:120,left: Dimensions.PADDING_SIZE_SMALL,
                right: Dimensions.PADDING_SIZE_SMALL),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 5,bottom: 50),
                    itemCount: MockData.productList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          openCartBottomSheet(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom:Dimensions.PADDING_SIZE_SMALL,),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: ColorResources.COLOR_WHITE,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: ColorResources.COLOR_GREY
                                      .withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 15,
                                  offset: Offset(0,
                                      1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                FadeInImage.assetNetwork(
                                  placeholder: Images.place_holder,
                                  image: MockData.productList[index].image,
                                  width: 80,
                                  height: 80,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start
                                    ,
                                    children: [
                                      Text(MockData.productList[index].name,
                                      style: TextStyle(
                                        fontSize: Dimensions.TEXT_SIZE_SMALL,
                                        color: ColorResources.COLOR_BLACK,
                                        fontWeight: FontWeight.bold
                                      ),),
                                      Text(MockData.productList[index].description,
                                        style: TextStyle(
                                            fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                                            color: ColorResources.COLOR_GREY,
                                        ),),
                                      Row(
                                        children: [
                                          Text(Strings.USD,
                                          style: TextStyle(
                                            fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                                            color: ColorResources.COLOR_BLACK,
                                          ),),
                                          Text(' '+MockData.productList[index].price.toString(),
                                            style: TextStyle(
                                              fontSize: Dimensions.TEXT_SIZE_SMALL,
                                              color: ColorResources.COLOR_PRIMARY,
                                              fontWeight: FontWeight.bold
                                            ),)
                                        ],
                                      )

                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right:Dimensions.PADDING_SIZE_SMALL),
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: ColorResources.COLOR_WHITE,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorResources.COLOR_GREY
                                              .withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 15,
                                          offset: Offset(0,
                                              1), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Icon(Icons.favorite,
                                        color: ColorResources.COLOR_PRIMARY,
                                        size: 15,),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
