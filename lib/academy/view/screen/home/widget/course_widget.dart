import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/data/model/course.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/utility/images.dart';
import 'package:flutter_ui_kit/academy/utility/style.dart';
import 'package:flutter_ui_kit/academy/view/basewidget/rating_bar.dart';
import 'package:flutter_ui_kit/academy/view/screen/course_details/course_detail_screen.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';

class CourseWidget extends StatelessWidget {
  final Course course;
  final double width;
  final bool isShowLastPrice;
  CourseWidget({this.course,this.width,this.isShowLastPrice=true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CourseDetailScreen(course: course)));
      },
      child: Container(
        width: width,
        margin: EdgeInsets.only(right: AcademyDimensions.PADDING_SIZE_DEFAULT),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: FadeInImage.assetNetwork(placeholder: Images.place_holder, image: course.imageUrl, width: 207, height: 140, fit: BoxFit.fill)),
            SizedBox(height: AcademyDimensions.PADDING_SIZE_EXTRA_SMALL),
            Text(
              course.title, style: robotoMedium.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE, color: AcademyColorResources.COLOR_GREY),),
            SizedBox(height: AcademyDimensions.PADDING_SIZE_EXTRA_SMALL),
            Text(course.name, style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_NOBEL)),
            SizedBox(height: AcademyDimensions.PADDING_SIZE_EXTRA_SMALL),
            Row(
              children: [
                RatingBar(),
                SizedBox(width: AcademyDimensions.PADDING_SIZE_EXTRA_SMALL),
                Text(course.rattingAndDownload, style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_NOBEL, fontSize: 12))
              ],
            ),
            Row(
              children: [
                Text(course.currentPrice, style: avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE,)),
                SizedBox(width: AcademyDimensions.PADDING_SIZE_EXTRA_SMALL),
                Text(isShowLastPrice?course.lastPrice:'', style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_NOBEL,
                    decoration: TextDecoration.lineThrough)),
              ],
            ),
            SizedBox(height: AcademyDimensions.PADDING_SIZE_EXTRA_SMALL),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 17, vertical: 3),
              decoration: BoxDecoration(
                  color: AcademyColorResources.COLOR_TURQUOISE,
                  borderRadius: BorderRadius.circular(7.0)
              ),
              child: Text(course.condition, style: avenirMedium,),
            )
          ],
        ),
      ),
    );
  }
}
