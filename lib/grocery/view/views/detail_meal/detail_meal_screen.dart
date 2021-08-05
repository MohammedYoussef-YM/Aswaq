import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/images.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/views/detail_meal/widget/grocery_items_button_sheet.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y, [this.color]);

  final String x;
  final double y;
  final Color color;
}

class DetailMealScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Protein', 46, ColorResources.COLOR_DARK_ORCHID),
      ChartData('Fat', 34, ColorResources.COLOR_PRIMARY),
      ChartData('Protein', 20, ColorResources.COLOR_NEON_CARROT),
    ];

    return Scaffold(
      backgroundColor: ColorResources.COLOR_CART_BACKGROUND,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 275,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      FadeInImage.assetNetwork(
                        placeholder: Images.place_holder,
                        image: Images.banana,
                        height: 275,
                        width: double.infinity,
                        fit: BoxFit.fill,),
                      Positioned(
                          top: 10,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: ColorResources.COLOR_WHITE,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )),
                      Positioned(
                        bottom: -130,
                        right: Dimensions.PADDING_SIZE_DEFAULT,
                        left: Dimensions.PADDING_SIZE_DEFAULT,
                        child: Container(
                          //height: 160,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                          decoration: BoxDecoration(
                            color: ColorResources.COLOR_WHITE,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: Offset(0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                              Text(
                                Strings.banana,
                                style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK, fontSize: 22),
                              ),
                              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                              Text(
                                Strings.dinnr_of_the_day,
                                style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY.withOpacity(.6)),
                              ),
                              SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset('assets/grocery/icon/clock.png'),
                                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                                      Text(
                                        Strings.ten_mins,
                                        style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY),
                                      ),
                                    ],
                                  ),
                                  Container(height: 29, width: 1, color: ColorResources.COLOR_CART_BACKGROUND),
                                  Column(
                                    children: [
                                      Image.asset('assets/grocery/icon/database.png'),
                                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                                      Text(
                                        Strings.six_ingr,
                                        style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY),
                                      ),
                                    ],
                                  ),
                                  Container(height: 29, width: 1, color: ColorResources.COLOR_CART_BACKGROUND),
                                  Column(
                                    children: [
                                      Image.asset('assets/grocery/icon/hamar.png'),
                                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                                      Text(
                                        Strings.t60_g,
                                        style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY),
                                      ),
                                    ],
                                  ),
                                  Container(height: 29, width: 1, color: ColorResources.COLOR_CART_BACKGROUND),
                                  Column(
                                    children: [
                                      Image.asset('assets/grocery/icon/deal.png'),
                                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                                      Text(
                                        Strings.t68_kc,
                                        style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 140),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  margin: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  decoration: BoxDecoration(
                    color: ColorResources.COLOR_WHITE,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      Text(
                        Strings.nutrition_information,
                        style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK, fontSize: 22),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Text(
                        Strings.per_serving,
                        style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY.withOpacity(.6)),
                      ),
                      Center(
                        child: Stack(
                          children: [
                            Container(
                                width: 167,
                                height: 167,
                                child: SfCircularChart(
                                  series: <CircularSeries>[
                                    DoughnutSeries<ChartData, String>(
                                      dataSource: chartData,
                                      xValueMapper: (ChartData data, _) => data.x,
                                      yValueMapper: (ChartData data, _) => data.y,
                                      // Radius of doughnut's inner circle
                                      innerRadius: '85%',
                                      pointColorMapper: (ChartData data, _) => data.color,
                                    )
                                  ],
                                )),
                            Container(
                              width: 167,
                              height: 167,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '46%',
                                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_DARK_ORCHID),
                                  ),
                                  Text(
                                    '34%',
                                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY),
                                  ),
                                  Text(
                                    '20%',
                                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_NEON_CARROT),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: ColorResources.COLOR_DARK_ORCHID,
                                    radius: 10,
                                  ),
                                  SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                                  Text(
                                    Strings.protein,
                                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK.withOpacity(.7)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: Dimensions.PADDING_SIZE_LARGE),
                                  Text(
                                    Strings.t27_g,
                                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY.withOpacity(.6)),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: ColorResources.COLOR_NEON_CARROT,
                                    radius: 10,
                                  ),
                                  SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                                  Text(
                                    Strings.fat,
                                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK.withOpacity(.7)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                                  Text(
                                    Strings.t19_g,
                                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY.withOpacity(.6)),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: ColorResources.COLOR_PRIMARY,
                                    radius: 10,
                                  ),
                                  SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                                  Text(
                                    Strings.protein,
                                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK.withOpacity(.7)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: Dimensions.PADDING_SIZE_LARGE),
                                  Text(
                                    Strings.t6_g,
                                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY.withOpacity(.6)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  margin: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  decoration: BoxDecoration(
                    color: ColorResources.COLOR_WHITE,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      Text(
                        Strings.nutrition_quality,
                        style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK, fontSize: 22),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: SizedBox.shrink()),
                          Expanded(child: SizedBox.shrink()),
                          Expanded(child: SizedBox.shrink()),
                          SizedBox(
                            width: 30,
                          ),
                          Image.asset(
                            'assets/grocery/icon/nutrition_quality.png',
                            width: 40,
                            height: 40,
                            fit: BoxFit.fill,
                          ),
                          Expanded(child: SizedBox.shrink()),
                        ],
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: ColorResources.COLOR_PRIMARY,
                                radius: 5,
                              ),
                              Expanded(
                                  child: Container(
                                height: 3,
                                color: ColorResources.COLOR_PRIMARY,
                              ))
                            ],
                          )),
                          Expanded(
                              child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: ColorResources.COLOR_PRIMARY,
                                radius: 5,
                              ),
                              Expanded(
                                  child: Container(
                                height: 3,
                                color: ColorResources.COLOR_PRIMARY,
                              ))
                            ],
                          )),
                          Expanded(
                              child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: ColorResources.COLOR_PRIMARY,
                                radius: 5,
                              ),
                              Expanded(
                                  child: Container(
                                height: 3,
                                color: ColorResources.COLOR_PRIMARY,
                              ))
                            ],
                          )),
                          Expanded(
                              child: Row(
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: ColorResources.COLOR_PRIMARY)),
                              ),
                              Expanded(
                                  child: Container(
                                height: 3,
                                color: ColorResources.COLOR_GRAY.withOpacity(.4),
                              ))
                            ],
                          )),
                          CircleAvatar(
                            backgroundColor: ColorResources.COLOR_GRAY.withOpacity(.4),
                            radius: 5,
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'A',
                            style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                          ),
                          Text(
                            'B',
                            style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                          ),
                          Text(
                            'C',
                            style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_PRIMARY),
                          ),
                          Text(
                            'D',
                            style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                          ),
                          Text(
                            'E',
                            style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      Text(
                        Strings.healthy_if_taken_in,
                        style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  margin: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  decoration: BoxDecoration(
                    color: ColorResources.COLOR_WHITE,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.ingredients,
                            style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK, fontSize: 22),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 15,
                            color: ColorResources.COLOR_DIM_GRAY,
                          )
                        ],
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      _ingredients(title: Strings.singapore_noodles, quantity: Strings.t27_g),
                      _ingredients(title: Strings.zucchini, quantity: Strings.t27_g),
                      _ingredients(title: Strings.fish, quantity: Strings.t27_g),
                      _ingredients(title: Strings.singapore_noodles, quantity: Strings.t27_g),
                      _ingredients(title: Strings.zucchini, quantity: Strings.t27_g),
                      _ingredients(title: Strings.fish, quantity: Strings.t27_g),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  margin: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                  decoration: BoxDecoration(
                    color: ColorResources.COLOR_WHITE,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.how_to_make,
                            style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK, fontSize: 22),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 15,
                            color: ColorResources.COLOR_DIM_GRAY,
                          )
                        ],
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      _ingredients(
                        title: Strings.boil_the,
                      ),
                      _ingredients(
                        title: Strings.pour_boiling_water,
                      ),
                      _ingredients(
                        title: Strings.stand_2_minutes,
                      ),
                      _ingredients(
                        title: Strings.drain_sauce_like,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: 80,
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
              decoration: BoxDecoration(
                  color: ColorResources.COLOR_WHITE, borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.PADDING_SIZE_LARGE))),
              child: Builder(
                builder: (context) => CustomButton(
                  btnTxt: Strings.add_to_basket,
                  onTap: () {
                    groceryItemModalSheet(context, () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to cart'), backgroundColor: Colors.green));
                    });
                  },
                ),
              ))
        ],
      ),
    );
  }

  Widget _ingredients({String title, String quantity}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: ColorResources.COLOR_DIM_GRAY.withOpacity(.4),
                    radius: 3,
                  ),
                  SizedBox(
                    width: Dimensions.PADDING_SIZE_SMALL,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK.withOpacity(.8)),
                    ),
                  )
                ],
              ),
            ),
            Text(
              quantity ?? '',
              style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY.withOpacity(.8)),
            )
          ],
        ),
        Container(
          height: 1,
          color: ColorResources.COLOR_DIM_GRAY.withOpacity(.2),
          margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_DEFAULT, bottom: Dimensions.PADDING_SIZE_DEFAULT),
        ),
      ],
    );
  }
}
