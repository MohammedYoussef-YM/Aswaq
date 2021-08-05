import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/data/models/category_model.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/views/category/category_screen.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;

  CategoryWidget({this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => GroceryCategoryScreen(
                  categoryName: categoryModel.title,
                )));
      },
      child: Container(
        //color: ColorResources.COLOR_BLACK,
        height: 80,
        width: 80,
        margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL),
        child: Stack(
          children: [
            Container(
              width: 80,
              height: 80,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: categoryModel.color.withOpacity(.7),
                borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
              ),
              child: Image.asset(
                categoryModel.imageUrl,
                fit: BoxFit.fill,
                width: 55,
                height: 55,
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  height: 20,
                  width: 80,
                  decoration: BoxDecoration(
                      color: ColorResources.COLOR_BLACK.withOpacity(.3), borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL)),
                  child: Center(
                      child: Text(
                    categoryModel.title,
                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_WHITE, fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL),
                  )),
                ))
          ],
        ),
      ),
    );
  }
}
