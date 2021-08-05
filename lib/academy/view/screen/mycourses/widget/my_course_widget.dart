import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/data/model/course.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/images.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/view/screen/video/video_details_screen.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:flutter_ui_kit/academy/utility/style.dart';

class MyCourseWidget extends StatelessWidget {
  final Course course;
  final int index;
  MyCourseWidget({@required this.course, @required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => VideoDetailsScreen()));
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: AcademyDimensions.PADDING_SIZE_LARGE),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FadeInImage.assetNetwork(placeholder: Images.place_holder, image: course.imageUrl, width: 70, height: 70, fit: BoxFit.fill),
          SizedBox(width: 10),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

            Text(course.title, style: avenirHeavy, maxLines: 2, overflow: TextOverflow.ellipsis),

            Text(course.name, style: avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_SMALL, color: AcademyColorResources.COLOR_GREY)),
            SizedBox(height: 5),

            index == 0 ? Text(AcademyStrings.start_course, style: robotoMedium.copyWith(
              fontSize: AcademyDimensions.FONT_SIZE_SMALL,
              color: AcademyColorResources.COLOR_PRIMARY,
            )) : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              LinearProgressIndicator(value: index/10, backgroundColor: AcademyColorResources.BORDER_COLOR),
              Text('${index*10}% complete', style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_GREY, fontSize: AcademyDimensions.FONT_SIZE_SMALL)),
            ]),

          ])),
        ]),
      ),
    );
  }
}
