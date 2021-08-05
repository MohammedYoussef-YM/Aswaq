import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/provider/course_provider.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/view/screen/design/design_screen.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CategoryView extends StatelessWidget {
  bool isShowRightArrow;
  double widgetSpaceHeight;

  CategoryView({this.isShowRightArrow = true, this.widgetSpaceHeight = AcademyDimensions.PADDING_SIZE_SMALL});

  @override
  Widget build(BuildContext context) {
    return Consumer<CourseProvider>(
      builder: (context, courseProvider, child) => ListView.builder(
          itemCount: courseProvider.getAllCategory.length,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => DesignScreen(courseTitle: courseProvider.getAllCategory[index].title)));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: widgetSpaceHeight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            courseProvider.getAllCategory[index].icon,
                            width: 18,
                            height: 16,
                            color: AcademyColorResources.ICON_COLOR,
                          ),
                          SizedBox(width: AcademyDimensions.PADDING_SIZE_SMALL),
                          Text(
                            courseProvider.getAllCategory[index].title,
                            style: robotoMedium.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE, color: AcademyColorResources.COLOR_GREY),
                          ),
                        ],
                      ),
                      !isShowRightArrow ? SizedBox.shrink() : Icon(Icons.keyboard_arrow_right, color: AcademyColorResources.COLOR_GREY)
                    ],
                  ),
                ),
              )),
    );
  }
}
