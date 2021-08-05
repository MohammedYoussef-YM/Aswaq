import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/utility/images.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:flutter_ui_kit/academy/utility/style.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui_kit/academy/provider/design_provider.dart';
import 'package:flutter_ui_kit/academy/provider/course_provider.dart';
import 'package:flutter_ui_kit/academy/view/screen/home/widget/course_widget.dart';
import 'package:flutter_ui_kit/academy/view/screen/author/widget/social_media_widget.dart';

class AuthorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<AcademyDesignProvider>(context, listen: false).getDesignData();
    Provider.of<CourseProvider>(context, listen: false).initializeAllFeaturedCourse();

    return Scaffold(
      backgroundColor: AcademyColorResources.COLOR_WHITE,
      appBar: AppBar(
        backgroundColor: AcademyColorResources.COLOR_WHITE,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: AcademyColorResources.COLOR_GREY), onPressed: () => Navigator.pop(context)),
        actions: [IconButton(icon: Icon(Icons.share, color: AcademyColorResources.COLOR_GREY), onPressed: () {})],
      ),
      body: ListView(padding: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_SMALL), physics: BouncingScrollPhysics(), children: [
        Consumer<AcademyDesignProvider>(
          builder: (context, design, child) {
            return Column(children: [
              FadeInImage.assetNetwork(placeholder: Images.place_holder, image: design.instructorList[0].image, width: 100, height: 100, fit: BoxFit.fill),
              Text(design.instructorList[0].name, style: avenirHeavy.copyWith(fontSize: 20)),
              Text(design.instructorList[0].details,
                  style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_GREY), textAlign: TextAlign.center),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Column(children: [
                  Text(design.instructorList[0].students.toString(), style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_GREY)),
                  Text('Students', style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_GREY)),
                ]),
                Container(height: 50, width: 2, color: AcademyColorResources.COLOR_GREY),
                Column(children: [
                  Text(design.instructorList[0].courses.toString(), style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_GREY)),
                  Text('Courses', style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_GREY)),
                ]),
                Container(height: 50, width: 2, color: AcademyColorResources.COLOR_GREY),
                Column(children: [
                  Text('4.59/4', style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_GREY)),
                  Text('Rating', style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_GREY)),
                ]),
              ]),
            ]);
          },
        ),
        SizedBox(height: 20),
        Text('Courses by John Sina', style: avenirHeavy),
        SizedBox(height: AcademyDimensions.PADDING_SIZE_SMALL),
        Container(
          height: 315,
          child: Consumer<CourseProvider>(
            builder: (context, course, child) {
              return ListView.builder(
                itemCount: course.getAllFeaturedCourse.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CourseWidget(course: course.getAllFeaturedCourse[index], width: 210);
                },
              );
            },
          ),
        ),
        SizedBox(height: 20),
        Text(AcademyStrings.lorem, style: robotoRegular),
        SizedBox(height: 5),
        Align(
            alignment: Alignment.center,
            child: Text(AcademyStrings.read_more, style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_PRIMARY))),
        SizedBox(height: 20),
        Align(alignment: Alignment.center, child: Text(AcademyStrings.contact, style: avenirHeavy.copyWith(color: AcademyColorResources.COLOR_GREY))),
        SizedBox(height: 10),
        SocialMediaWidget(image: Images.linked_in, title: 'Linkedin', url: 'https://linkedin.com/in/jnsina'),
        SizedBox(height: 10),
        SocialMediaWidget(image: Images.facebook, title: 'Website', url: 'http://www.facebook.com'),
      ]),
    );
  }
}
