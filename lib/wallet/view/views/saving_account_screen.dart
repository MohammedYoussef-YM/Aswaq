import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/wallet/provider/goals_provider.dart';
import 'package:flutter_ui_kit/wallet/utility/images.dart';
import 'package:flutter_ui_kit/wallet/utility/strings.dart';
import 'package:flutter_ui_kit/wallet/utility/colorResources.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/custom_app_bar.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/my_goals_card_widget.dart';
import 'package:provider/provider.dart';

class SavingAccountScreen extends StatefulWidget {
  @override
  _SavingAccountScreenState createState() => _SavingAccountScreenState();
}

class _SavingAccountScreenState extends State<SavingAccountScreen> {
  int bannerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/wallet/Illustration/Untitled-1.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                CustomAppBar(title: Strings.MY_SAVING, color: ColorResources.COLOR_WHITE),
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.only(left: 30, right: 30),
                        padding: EdgeInsets.only(left: 15, right: 10),
                        height: 50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(23), color: ColorResources.COLOR_WHITE.withOpacity(.24)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(Strings.BALANCE, style: poppinsRegular.copyWith(color: ColorResources.COLOR_WHITE)),
                            Text(Strings.DOLLER6500, style: poppinsRegular.copyWith(color: ColorResources.COLOR_WHITE)),
                            Icon(Icons.arrow_forward, size: 20, color: ColorResources.COLOR_WHITE)
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          Strings.ACCOUNT_DETAILS25214,
                          style: montserratSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_SILVER),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Strings.INTEREST_RATE,
                                    style: montserratSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_SILVER),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        Strings.PERSENT6,
                                        style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_WHITE),
                                      ),
                                      Text(
                                        Strings.SLASHYEAR,
                                        style: montserratSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_SILVER),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    Strings.YOUR_INTEREST,
                                    style: montserratSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_SILVER),
                                  ),
                                  Text(Strings.DOLLER180, style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_WHITE)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        margin: EdgeInsets.only(left: 30, right: 30),
                        height: 88,
                        child: Row(
                          children: [
                            IconTitleButton(iconUrl: 'assets/wallet/Icon/add money.png', title: Strings.ADD_MONEY),
                            SizedBox(width: 15),
                            IconTitleButton(iconUrl: 'assets/wallet/Icon/withdraw.png', title: Strings.WITHDRAW),
                            SizedBox(width: 15),
                            IconTitleButton(iconUrl: 'assets/wallet/Icon/topup.png', title: Strings.TOP_UP),
                          ],
                        ),
                      ),
                      SizedBox(height: 25),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          Strings.MY_GOALS,
                          style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_CHARCOAL),
                        ),
                      ),
                      SizedBox(height: 15),
                      Stack(children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
                          height: 90,
                          width: double.infinity,
                          child: CarouselSlider.builder(
                            itemCount: Provider.of<GoalsProvider>(context).getGoalsList().length,
                            itemBuilder: (context, index, _) => MyGoalsCardWidget(Provider.of<GoalsProvider>(context).getGoalsList()[index]),
                            options: CarouselOptions(
                              autoPlay: true,
                              aspectRatio: 2,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                              initialPage: 0,
                              viewportFraction: 1.0,
                              onPageChanged: (int index, reason) {
                                setState(() {
                                  bannerIndex = index;
                                });
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 2, left: 0, right: 0,
                          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: _indicator()),
                        ),
                      ]),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(Strings.JAPAN_TRIP, style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_CHARCOAL)),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                FadeInImage.assetNetwork(placeholder: Images.place_holder, image: Images.person_two,width: 30, height: 30,fit: BoxFit.fill,),
                                Positioned(
                                  right: 20,
                                  child: FadeInImage.assetNetwork(placeholder: Images.place_holder, image: Images.person_one,width: 30, height: 30,fit: BoxFit.fill,),
                                ),
                                Positioned(
                                  right: 40,
                                  child: FadeInImage.assetNetwork(placeholder: Images.place_holder, image: Images.person_three,width: 30, height: 30,fit: BoxFit.fill,),

                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          Strings.LOREM_SUB,
                          style: montserratSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_DIM_GRAY),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          Strings.LOREM_FULL,
                          style: montserratSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_DIM_GRAY),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        margin: EdgeInsets.only(left: 30, right: 30),
                        height: 50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: ColorResources.COLOR_WHITE),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: ColorResources.COLOR_PRIMARY_DARK),
                                child: Text(Strings.DOLLER_126, style: poppinsRegular.copyWith(color: ColorResources.COLOR_WHITE)),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 20),
                                alignment: Alignment.center,
                                child: Text(
                                  Strings.DOLLER_49,
                                  style: poppinsRegular.copyWith(color: ColorResources.COLOR_ROYAL_BLUE),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _indicator() {
    List<Widget> indicator = [];
    for(int i=0; i < Provider.of<GoalsProvider>(context).getGoalsList().length; i++) {
      indicator.add(TabPageSelectorIndicator(
        backgroundColor: i == bannerIndex ? Colors.orange : ColorResources.COLOR_WHITE,
        borderColor: i == bannerIndex ? Colors.orange : ColorResources.COLOR_WHITE,
        size: 8,
      ));
    }
    return indicator;
  }
}

class IconTitleButton extends StatelessWidget {
  final String iconUrl;
  final String title;
  IconTitleButton({@required this.iconUrl, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 90,
        height: 90,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorResources.COLOR_WHITE,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconUrl, width: 35, height: 25),
            SizedBox(height: 10),
            Text(title, style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_DIM_GRAY)),
          ],
        ),
      ),
    );
  }
}

