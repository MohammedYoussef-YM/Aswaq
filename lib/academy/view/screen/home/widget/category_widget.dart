import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/data/model/category_model.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/view/screen/design/design_screen.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;
  final bool isCategoryScreen;
  CategoryWidget({this.categoryModel,this.isCategoryScreen=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      margin: EdgeInsets.only(right: 11),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(21.0), color: AcademyColorResources.BORDER_COLOR),
      child: InkWell(
        onTap: () {
          if(isCategoryScreen){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => DesignScreen(courseTitle: categoryModel.title)));
          }else{
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => DesignScreen(courseTitle: categoryModel.title)));
          }

        },
        child: Row(
          children: [
            Image.asset(
              categoryModel.icon,
              width: 18,
              height: 16,
              color: AcademyColorResources.COLOR_NOBEL,
            ),
            SizedBox(width: AcademyDimensions.PADDING_SIZE_SMALL),
            Text(
              categoryModel.title,
              style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_NOBEL),
            )
          ],
        ),
      ),
    );
  }
}
