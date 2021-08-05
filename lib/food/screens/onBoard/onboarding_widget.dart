import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/screens/auth/food_login_screen.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/utility/dimensions.dart';
import 'package:flutter_ui_kit/food/utility/strings.dart';

class OnBoardingWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;
  final int index;
  OnBoardingWidget({@required this.imageUrl, @required this.title, @required this.subtitle, @required this.description, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(child: Image.asset(imageUrl, width: 220, height: 220,)),
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/food/images/onboard_text_background.png'), fit: BoxFit.fill),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(Dimensions.PADDING_SIZE_DEFAULT, 80, Dimensions.PADDING_SIZE_DEFAULT, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: Dimensions.TEXT_SIZE_DEFAULT,
                              color: ColorResources.COLOR_WHITE,
                            ),
                          ),
                          Text(
                            subtitle,
                            style: TextStyle(
                                fontSize: Dimensions.TEXT_SIZE_EXTRA_LARGE,
                                color: ColorResources.COLOR_WHITE,
                                fontFamily: 'GothamRounded'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_DEFAULT),
                            child: Text(
                              description,
                              style: TextStyle(
                                fontSize: Dimensions.TEXT_SIZE_SMALL,
                                color: ColorResources.COLOR_WHITE,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: SafeArea(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT, bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                child: Icon(
                                  Icons.brightness_1,
                                  color: ColorResources.COLOR_WHITE.withOpacity(index == 0 ? 1 : 0.5),
                                  size: 10,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 2.0,bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                child: Icon(
                                  Icons.brightness_1,
                                  color: ColorResources.COLOR_WHITE.withOpacity(index == 1 ? 1 : 0.5),
                                  size: 10,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 2.0,bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(),
                                      child: Icon(
                                        Icons.brightness_1,
                                        color: ColorResources.COLOR_WHITE.withOpacity(index == 2 ? 1 : 0.5),
                                        size: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => FoodLoginScreen()));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: Dimensions.PADDING_SIZE_DEFAULT, bottom: Dimensions.PADDING_SIZE_DEFAULT),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        index == 2 ? Strings.START : Strings.SKIP,
                                        style: TextStyle(
                                            fontSize:
                                            Dimensions.TEXT_SIZE_SMALL,
                                            color: Colors.white),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(top: 3.0),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: ColorResources.COLOR_WHITE,
                                          size: 15,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
