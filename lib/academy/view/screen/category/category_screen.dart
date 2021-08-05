import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/view/screen/search/widget/category_view.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AcademyColorResources.COLOR_WHITE,
      appBar: AppBar(
        title: Text(
          AcademyStrings.categories,
          style: robotoBold.copyWith(color: AcademyColorResources.COLOR_BLACK, fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE),
        ),
        backgroundColor: AcademyColorResources.COLOR_WHITE,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: AcademyColorResources.COLOR_GREY,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(top: AcademyDimensions.PADDING_SIZE_LARGE, right: AcademyDimensions.PADDING_SIZE_SMALL),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: AcademyColorResources.COLOR_GREY,
                ),
                Positioned(top: -12, left: 8, child: Text('3', style: robotoMedium))
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AcademyDimensions.PADDING_SIZE_SMALL),
        child: CategoryView(isShowRightArrow: false,widgetSpaceHeight: 23,),
      ),
    );
  }
}
