import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/utility/images.dart';
import 'package:flutter_ui_kit/academy/view/screen/author/author_screen.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/data/model/instructor_model.dart';

class InstructorWidget extends StatelessWidget {
  final InstructorModel instructorModel;

  InstructorWidget({@required this.instructorModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => AuthorScreen()));
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: AcademyDimensions.PADDING_SIZE_SMALL),
        child: Row(children: [
          ClipOval(child: FadeInImage.assetNetwork(placeholder: Images.place_holder, image: instructorModel.image, width: 70, height: 70, fit: BoxFit.fill)),
          SizedBox(width: 10),
          Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(instructorModel.name,
                style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_GREY, fontSize: AcademyDimensions.FONT_SIZE_LARGE)),
            Text(instructorModel.details,
                style: robotoMedium.copyWith(
                  color: AcademyColorResources.COLOR_GREY,
                  fontSize: AcademyDimensions.FONT_SIZE_SMALL,
                )),
            Text('${instructorModel.students} Students',
                style: robotoMedium.copyWith(
                  color: AcademyColorResources.COLOR_GREY,
                  fontSize: AcademyDimensions.FONT_SIZE_SMALL,
                )),
            Text('${instructorModel.courses} Courses',
                style: robotoMedium.copyWith(
                  color: AcademyColorResources.COLOR_GREY,
                  fontSize: AcademyDimensions.FONT_SIZE_SMALL,
                )),
          ])),
        ]),
      ),
    );
  }
}
