import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_kit/food/data/mock_data.dart';
import 'package:flutter_ui_kit/food/screens/widget/open_cart_bottom_sheet.dart';
import 'package:flutter_ui_kit/food/screens/category/category_screen.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/utility/dimensions.dart';
import 'package:flutter_ui_kit/food/utility/images.dart';
import 'package:flutter_ui_kit/food/utility/strings.dart';
import 'package:flutter_ui_kit/food/utility/style.dart';

final List<String> _whatsNewsImageList = [
  Images.home_whats,
  Images.home_whats,
  Images.home_whats,
];

final List<Widget> _whatsNewsImageSliders = _whatsNewsImageList
    .map(
      (item) => Container(child: Builder(
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  FadeInImage.assetNetwork(placeholder: Images.place_holder, image: item, fit: BoxFit.cover, width: 1000.0),
                ],
              ),
            ),
          );
        },
      )),
    )
    .toList();

class FoodHomeScreen extends StatefulWidget {
  @override
  _FoodHomeScreenState createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen> {
  TextEditingController searchController = TextEditingController();

  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_LIGHT_WHITE,
      body: Container(
        padding: EdgeInsets.only(top: 39),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // what are you
              Row(
                children: [
                  SizedBox(
                    width: Dimensions.PADDING_SIZE_DEFAULT,
                  ),
                  Text(
                    Strings.WHAT_ARE_YOU,
                    style: TextStyle(fontSize: Dimensions.TEXT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 22,
              ),
              //for search
              Padding(
                padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT),
                child: SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    style: CustomStyle.textStyle,
                    controller: searchController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return Strings.FIELD_REQUIRED;
                      } else {
                        return null;
                      }
                    },
                    cursorColor: ColorResources.COLOR_PRIMARY,
                    decoration: InputDecoration(
                        hintText: Strings.SEARCH_KEYWORD,
                        hintStyle: CustomStyle.textStyle,
                        focusedBorder: CustomStyle.focusBorderStyle,
                        enabledBorder: CustomStyle.enableBorderStyle,
                        focusedErrorBorder: CustomStyle.enableBorderStyle,
                        errorBorder: CustomStyle.enableBorderStyle,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        prefixIcon: Icon(
                          Icons.search,
                          color: ColorResources.COLOR_PRIMARY,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              // for Category
              _categoryWidget(context),
              // for superMeal
              _superMealWidget(context),
              _whatNewsWidget(context),
              // for bestSellers
              _bestSellersWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  _categoryWidget(BuildContext context) {
    return Container(
      height: 110,
      child: ListView.builder(
          itemCount: 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT, top: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryScreen(title: Strings.BREAKFAST))),
                    child: Container(
                      width: 80,
                      height: 120,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 62,
                                width: 75,
                                decoration: BoxDecoration(
                                  color: ColorResources.COLOR_WHITE,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/food/svg/home_breakfast.svg',
                                      color: ColorResources.COLOR_PRIMARY,
                                      width: 34.38,
                                      height: 30,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 5,top: 5),
                            child: Text(
                              Strings.BREAKFAST,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryScreen(title: Strings.CHIKENJOY))),
                    child: Container(
                      width: 80,
                      height: 120,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 62,
                                width: 75,
                                decoration: BoxDecoration(
                                  color: ColorResources.COLOR_WHITE,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/food/svg/home_chicken.svg',
                                      color: ColorResources.COLOR_PRIMARY,
                                      width: 34.38,
                                      height: 30,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 5,top: 5),
                            child: Text(
                              Strings.CHIKENJOY,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryScreen(title: Strings.BEVERAGES))),
                    child: Container(
                      width: 80,
                      height: 120,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 62,
                                width: 75,
                                decoration: BoxDecoration(
                                  color: ColorResources.COLOR_WHITE,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/food/svg/home_food_and_restaurant.svg',
                                      color: ColorResources.COLOR_PRIMARY,
                                      width: 34.38,
                                      height: 30,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 5,top: 5),
                            child: Text(
                              Strings.BEVERAGES,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryScreen(title: Strings.SUPERMEALS))),
                    child: Container(
                      width: 80,
                      height: 120,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 62,
                                width: 75,
                                decoration: BoxDecoration(
                                  color: ColorResources.COLOR_WHITE,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/food/svg/home_meal.svg',
                                      color: ColorResources.COLOR_PRIMARY,
                                      width: 34.38,
                                      height: 30,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 5,top: 5),
                            child: Text(
                              Strings.SUPERMEALS,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryScreen(title: Strings.BREAKFAST))),
                    child: Container(
                      width: 80,
                      height: 120,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 62,
                                width: 75,
                                decoration: BoxDecoration(
                                  color: ColorResources.COLOR_WHITE,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/food/svg/home_breakfast.svg',
                                      color: ColorResources.COLOR_PRIMARY,
                                      width: 34.38,
                                      height: 30,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 5,top: 5),
                            child: Text(
                              Strings.BREAKFAST,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            );
          }),
    );
  }

  _superMealWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: Dimensions.PADDING_SIZE_DEFAULT,
          ),
          child: Text(
            Strings.SUPERMEALS,
            style: TextStyle(fontSize: Dimensions.TEXT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 240,
          child: ListView.builder(
              itemCount: 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    height: 240,
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                    child: Row(
                      children: [
                        Container(
                          height: 230,
                          width: 160,
                          decoration: BoxDecoration(
                            color: ColorResources.COLOR_WHITE,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                  child: Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: [
                                   FadeInImage.assetNetwork(
                                       placeholder: Images.place_holder,
                                       image: Images.home_chicken,
                                       height: 80,
                                       width: MediaQuery.of(context).size.width,
                                     fit: BoxFit.fill,),
                                    Row(
                                      children: [
                                        Text(
                                          Strings.CHIKENJOY_C1,
                                          style: TextStyle(fontSize: Dimensions.TEXT_SIZE_SMALL, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      Strings.DEMO_DESCRIPTION,
                                      style: TextStyle(
                                        fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          Strings.USD,
                                          style: TextStyle(
                                            fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '45',
                                          style: TextStyle(
                                              fontSize: Dimensions.TEXT_SIZE_EXTRA_LARGE,
                                              color: ColorResources.COLOR_PRIMARY,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 230,
                          width: 160,
                          decoration: BoxDecoration(
                            color: ColorResources.COLOR_WHITE,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                  child: Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                    child: Column(
                                      children: [
                                        FadeInImage.assetNetwork(
                                          placeholder: Images.place_holder,
                                          image: Images.home_regular,
                                          height: 80,
                                          width: MediaQuery.of(context).size.width, fit: BoxFit.fill,),

                                    Row(
                                      children: [
                                        Text(
                                          Strings.REGUALAR_MEAL_M1,
                                          style: TextStyle(fontSize: Dimensions.TEXT_SIZE_SMALL, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      Strings.DEMO_DESCRIPTION,
                                      style: TextStyle(
                                        fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          Strings.USD,
                                          style: TextStyle(
                                            fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '29',
                                          style: TextStyle(
                                              fontSize: Dimensions.TEXT_SIZE_EXTRA_LARGE,
                                              color: ColorResources.COLOR_PRIMARY,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 230,
                          width: 160,
                          decoration: BoxDecoration(
                            color: ColorResources.COLOR_WHITE,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                  child: Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: [
                                    FadeInImage.assetNetwork(
                                      placeholder: Images.place_holder,
                                      image: Images.home_juice,
                                      height: 80,
                                      width: MediaQuery.of(context).size.width, fit: BoxFit.fill,),

                                    Row(
                                      children: [
                                        Text(
                                          Strings.REGUALAR_MEAL_M1,
                                          style: TextStyle(fontSize: Dimensions.TEXT_SIZE_SMALL, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      Strings.DEMO_DESCRIPTION,
                                      style: TextStyle(
                                        fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          Strings.USD,
                                          style: TextStyle(
                                            fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '12',
                                          style: TextStyle(
                                              fontSize: Dimensions.TEXT_SIZE_EXTRA_LARGE,
                                              color: ColorResources.COLOR_PRIMARY,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    openCartBottomSheet(context);
                  },
                );
              }),
        )
      ],
    );
  }

  _whatNewsWidget(BuildContext context) {
    return (Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT),
              child: Text(
                Strings.WHATS_NEWS,
                style: TextStyle(fontSize: Dimensions.TEXT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            height: 130,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: _whatsNewsImageSliders,
              //carouselController: buttonCarouselController,
            ))
      ],
    ));
  }

  _bestSellersWidget(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT),
              child: Text(
                Strings.BEST_POPULAR_ITEM,
                style: TextStyle(fontSize: Dimensions.TEXT_SIZE_EXTRA_LARGE, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: MockData.productList.length,
              padding: EdgeInsets.only(top: 5,bottom: 20),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    openCartBottomSheet(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: Dimensions.PADDING_SIZE_DEFAULT,
                      right: Dimensions.PADDING_SIZE_DEFAULT,
                      top: 10,
                    ),
                    child: Container(
                      height: 100,
                      padding: const EdgeInsets.only(
                          left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT, top: 10.0),
                      decoration: BoxDecoration(
                        color: ColorResources.COLOR_WHITE,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(flex: 2, child: FadeInImage.assetNetwork(placeholder: Images.place_holder, image: MockData.productList[index].image,fit: BoxFit.fill,)),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      MockData.productList[index].name,
                                      style: TextStyle(fontSize: Dimensions.TEXT_SIZE_DEFAULT, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    MockData.productList[index].description,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }


}
