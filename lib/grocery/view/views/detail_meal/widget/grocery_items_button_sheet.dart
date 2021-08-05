import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/images.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_button.dart';

Widget _addNewItemsWidget({String imageUrl, String title, String subTitle, String price}) {
  return Column(
    children: [
      SizedBox(
        height: Dimensions.PADDING_SIZE_LARGE,
      ),
      Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL),
              child: FadeInImage.assetNetwork(
                placeholder: Images.place_holder,
                image: imageUrl,
                width: 64,
                height: 64,
                fit: BoxFit.fill,)),
          SizedBox(
            width: Dimensions.PADDING_SIZE_DEFAULT,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK.withOpacity(.7)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      subTitle,
                      style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY.withOpacity(.7)),
                    ),
                    Text(
                      price,
                      style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK.withOpacity(.8).withOpacity(.7)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

void groceryItemModalSheet(BuildContext context, Function callback) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(16.0),
          topRight: const Radius.circular(16.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.close,
                        color: ColorResources.COLOR_DIM_GRAY,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  Expanded(
                      child: Center(
                          child: Text(Strings.add_new_items, style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK.withOpacity(.7))))),
                  Icon(Icons.close, color: Colors.transparent)
                ],
              ),
              Container(
                height: 1,
                color: ColorResources.COLOR_DIM_GRAY.withOpacity(.1),
                margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL, bottom: Dimensions.PADDING_SIZE_DEFAULT),
              ),
              _addNewItemsWidget(
                  imageUrl: Images.carrot, title: Strings.carrot, subTitle: Strings.price_per_kg, price: Strings.dollar_5),
              _addNewItemsWidget(
                  imageUrl: Images.cauliflower,
                  title: Strings.cauliflower,
                  subTitle: Strings.price_per_kg,
                  price: Strings.dollar_6),
              _addNewItemsWidget(
                  imageUrl: Images.coconut, title: Strings.coconut, subTitle: Strings.price_per_kg, price: Strings.doller_9),
              _addNewItemsWidget(
                  imageUrl: Images.corn, title: Strings.corn, subTitle: Strings.price_per_kg, price: Strings.doller_580),
              _addNewItemsWidget(
                  imageUrl: Images.garlic, title: Strings.garlic, subTitle: Strings.price_per_kg, price: Strings.dollar_5),
              Container(
                height: 1,
                color: ColorResources.COLOR_DIM_GRAY.withOpacity(.1),
                margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_DEFAULT, bottom: Dimensions.PADDING_SIZE_DEFAULT),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.amount_item,
                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK.withOpacity(.8)),
                  ),
                  Text(
                    '2',
                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK.withOpacity(.8).withOpacity(.7)),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.PADDING_SIZE_DEFAULT,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.total_price,
                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK.withOpacity(.8)),
                  ),
                  Text(
                    Strings.doller_580,
                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY.withOpacity(.8), fontSize: 22),
                  ),
                ],
              ),
              Container(
                height: 1,
                color: ColorResources.COLOR_DIM_GRAY.withOpacity(.1),
                margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_DEFAULT, bottom: Dimensions.PADDING_SIZE_DEFAULT),
              ),
              Row(
                children: [
                  Container(
                    height: 34,
                    width: 34,
                    alignment: Alignment.center,
                    //padding:EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0), border: Border.all(color: ColorResources.COLOR_DIM_GRAY.withOpacity(.6))),
                    child: Icon(
                      Icons.remove,
                      color: ColorResources.COLOR_PRIMARY,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.PADDING_SIZE_SMALL,
                  ),
                  Text('2', style: poppinsRegular.copyWith()),
                  SizedBox(
                    width: Dimensions.PADDING_SIZE_SMALL,
                  ),
                  Container(
                    height: 34,
                    width: 34,
                    alignment: Alignment.center,
                    //padding:EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0), border: Border.all(color: ColorResources.COLOR_DIM_GRAY.withOpacity(.6))),
                    child: Icon(
                      Icons.add,
                      color: ColorResources.COLOR_PRIMARY,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.PADDING_SIZE_SMALL,
                  ),
                  Expanded(
                      child: CustomButton(
                        btnTxt: Strings.add_to_cart,
                        onTap: () {
                          Navigator.pop(context);
                          callback();
                        },
                      ))
                ],
              ),
              SizedBox(
                height: Dimensions.PADDING_SIZE_SMALL,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}