import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/provider/course_provider.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/view/screen/dashboard/dashboard_screen.dart';
import 'package:flutter_ui_kit/academy/view/screen/mycourses/widget/my_course_widget.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:provider/provider.dart';

class MyCoursesScreen extends StatelessWidget {
  final bool isFromCardPerched;

  MyCoursesScreen({this.isFromCardPerched = false});

  @override
  Widget build(BuildContext context) {
    Provider.of<CourseProvider>(context, listen: false).initializeAllFeaturedCourse();

    return Scaffold(
      backgroundColor: AcademyColorResources.COLOR_WHITE,
      appBar: AppBar(
        leading: isFromCardPerched
            ? IconButton(
                icon: Icon(Icons.arrow_back, color: AcademyColorResources.COLOR_GREY),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => AcademyDashboardScreen()));
                })
            : SizedBox.shrink(),
        leadingWidth: isFromCardPerched ? 30.0 : 0,
        title: Text(AcademyStrings.my_courses, style: robotoBold.copyWith(fontSize: 20)),
        elevation: 0,
        backgroundColor: AcademyColorResources.COLOR_WHITE,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: AcademyColorResources.COLOR_GREY),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list, color: AcademyColorResources.COLOR_GREY),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: Provider.of<CourseProvider>(context).getAllFeaturedCourse.length,
        padding: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_SMALL),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return MyCourseWidget(course: Provider.of<CourseProvider>(context).getAllFeaturedCourse[index], index: index);
        },
      ),
    );
  }
}
