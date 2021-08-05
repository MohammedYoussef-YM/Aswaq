import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/data/mock_data.dart';
import 'package:flutter_ui_kit/food/model/product.dart';
import 'package:flutter_ui_kit/food/provider/home_provider.dart';
import 'package:flutter_ui_kit/food/screens/bottomsheet/change_cash_method_bottomsheet.dart';
import 'package:flutter_ui_kit/food/screens/select_destination_map_screen.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/utility/dimensions.dart';
import 'package:flutter_ui_kit/food/utility/images.dart';
import 'package:flutter_ui_kit/food/utility/strings.dart';
import 'package:flutter_ui_kit/food/utility/style.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextEditingController promoCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                  child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
                  child: Text(
                    Strings.ITEM_CART,
                    style: TextStyle(
                        fontSize: Dimensions.TEXT_SIZE_EXTRA_LARGE,
                        color: ColorResources.COLOR_BLACK),
                  ),
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(
                    left: Dimensions.PADDING_SIZE_DEFAULT,
                    top: Dimensions.PADDING_SIZE_SMALL),
                child: Text(
                  Strings.YOUR_ORDER,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: Dimensions.TEXT_SIZE_LARGE,
                      color: ColorResources.COLOR_BLACK),
                ),
              ),
              cartList(context),
              promoCode(context),
              calculation(context),
              configurePayment(context),
              paymentMethod(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget promoCode(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
            left: Dimensions.PADDING_SIZE_SMALL,
            right: Dimensions.PADDING_SIZE_SMALL),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 42,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  color: ColorResources.COLOR_WHITE,
                  child: TextFormField(
                    style: CustomStyle.textStyle,
                    controller: promoCodeController,
                    keyboardType: TextInputType.text,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return Strings.FIELD_REQUIRED;
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: Strings.PROMO_CODE,
                        labelStyle: CustomStyle.textStyle,
                        focusedBorder: CustomStyle.focusBorderStyle,
                        enabledBorder: CustomStyle.enableBorderStyle,
                        focusedErrorBorder: CustomStyle.enableBorderStyle,
                        errorBorder: CustomStyle.enableBorderStyle,
                        ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
              child: Container(
                height: 42,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: ColorResources.COLOR_PRIMARY),
                child: Center(
                  child: Text(
                    Strings.APPLY,
                    style: TextStyle(
                        fontSize: Dimensions.TEXT_SIZE_SMALL,
                        color: ColorResources.COLOR_WHITE),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget calculation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.PADDING_SIZE_SMALL,
          right: Dimensions.PADDING_SIZE_SMALL,
          top: Dimensions.PADDING_SIZE_SMALL),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: ColorResources.COLOR_GREY.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 15,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: Dimensions.PADDING_SIZE_SMALL),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.SUBTOTAL,
                      style: TextStyle(
                        fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                        fontWeight: FontWeight.bold,
                        color: ColorResources.COLOR_BLACK,
                      ),
                    ),
                    Text(
                      Strings.USD45,
                      style: TextStyle(
                        fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                        fontWeight: FontWeight.bold,
                        color: ColorResources.COLOR_BLACK,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: Dimensions.PADDING_SIZE_SMALL),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.SHIPPING,
                      style: TextStyle(
                        fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                        fontWeight: FontWeight.bold,
                        color: ColorResources.COLOR_BLACK,
                      ),
                    ),
                    Text(
                      Strings.USD60,
                      style: TextStyle(
                        fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                        fontWeight: FontWeight.bold,
                        color: ColorResources.COLOR_BLACK,
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: ColorResources.COLOR_GREY.withOpacity(0.2),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: Dimensions.PADDING_SIZE_SMALL),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.TOTAL,
                      style: TextStyle(
                        fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                        fontWeight: FontWeight.bold,
                        color: ColorResources.COLOR_BLACK,
                      ),
                    ),
                    Text(
                      Strings.USD105,
                      style: TextStyle(
                        fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                        fontWeight: FontWeight.bold,
                        color: ColorResources.COLOR_PRIMARY,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget configurePayment(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.PADDING_SIZE_SMALL,
          right: Dimensions.PADDING_SIZE_SMALL,
          top: Dimensions.PADDING_SIZE_SMALL),
      child: Container(
        decoration: BoxDecoration(
          color: ColorResources.COLOR_WHITE,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: ColorResources.COLOR_GREY.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 15,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: Dimensions.PADDING_SIZE_SMALL),
                child: Image.asset(
                  'assets/food/images/cart_payment.png',
                  width: 30,
                  height: 25,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.CASH,
                      style: TextStyle(
                          fontSize: Dimensions.TEXT_SIZE_DEFAULT,
                          color: ColorResources.COLOR_BLACK),
                    ),
                    Text(
                      Strings.LOREM_IPSUM_,
                      style: TextStyle(
                          fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                          color: ColorResources.COLOR_GREY),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: Dimensions.PADDING_SIZE_SMALL),
                child: GestureDetector(
                  onTap: () {
                    changeCashMethodMethod(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorResources.COLOR_WHITE,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(
                          color: ColorResources.COLOR_GREY, width: 1),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 2, 8, 3),
                        child: Text(
                          Strings.CHANGE,
                          style: TextStyle(
                              color: ColorResources.COLOR_PRIMARY,
                              fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentMethod(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.PADDING_SIZE_SMALL,
        right: Dimensions.PADDING_SIZE_SMALL,
        top: Dimensions.PADDING_SIZE_SMALL,
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.PAYMENT_METHOD,
              style: TextStyle(
                  fontSize: Dimensions.TEXT_SIZE_LARGE,
                  color: ColorResources.COLOR_BLACK),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => SelectDestinationScreen()));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 50),
                  height: 52,
                  decoration: BoxDecoration(
                      color: ColorResources.COLOR_PRIMARY,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      Strings.PROCEED,
                      style: TextStyle(
                          fontSize: Dimensions.TEXT_SIZE_DEFAULT,
                          color: ColorResources.COLOR_WHITE),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget cartList(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: MockData.orderList.length,
        itemBuilder: (context, index) {
          Product product=MockData.orderList[index].product;
          return Padding(
            padding: const EdgeInsets.only(
                bottom: Dimensions.PADDING_SIZE_SMALL,
                left: Dimensions.PADDING_SIZE_SMALL,
                right: Dimensions.PADDING_SIZE_SMALL),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: ColorResources.COLOR_WHITE,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: ColorResources.COLOR_GREY.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child:FadeInImage.assetNetwork(
                      placeholder: Images.place_holder,
                      image: product.image,
                      width: 80,
                      height: 80,),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                              fontSize: Dimensions.TEXT_SIZE_SMALL,
                              color: ColorResources.COLOR_BLACK,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          product.description,
                          style: TextStyle(
                            fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                            color: ColorResources.COLOR_GREY,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              Strings.USD,
                              style: TextStyle(
                                fontSize: Dimensions.TEXT_SIZE_EXTRA_SMALL,
                                color: ColorResources.COLOR_BLACK,
                              ),
                            ),
                            Text(
                              ' ' + product.price.toString(),
                              style: TextStyle(
                                  fontSize: Dimensions.TEXT_SIZE_SMALL,
                                  color: ColorResources.COLOR_PRIMARY,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: ColorResources.COLOR_WHITE,
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            border: Border.all(width: 2, color: ColorResources.COLOR_GREY.withOpacity(0.3))),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0),
                          ),
                          onPressed: () {
                            setState(() {
                              if(MockData.orderList[index].quantity>0){
                                MockData.orderList[index].quantity--;
                              }
                            });
                          },
                          child: Center(
                            child: Icon(
                              Icons.remove,
                              color: ColorResources.COLOR_GREY,
                            ),
                          ),
                        ),
                      ),
                      Consumer<HomeProvider>(
                        builder: (context, homeProvider, child) => Padding(
                            padding: const EdgeInsets.only(
                                right: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: Container(
                                child: Text(
                                    MockData.orderList[index].quantity.toString(),
                                  style: TextStyle(
                                      fontSize: Dimensions.TEXT_SIZE_DEFAULT, fontWeight: FontWeight.bold),
                                ))),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: ColorResources.COLOR_WHITE,
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            border: Border.all(width: 2, color: ColorResources.COLOR_GREY.withOpacity(0.3))),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0),
                          ),
                          onPressed: () {
                            setState(() {
                              MockData.orderList[index].quantity++;
                            });
                          },
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: ColorResources.COLOR_GREY,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10,),
                ],
              ),
            ),
          );
        });
  }
}
