import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/provider/course_provider.dart';
import 'package:flutter_ui_kit/academy/provider/design_provider.dart';
import 'package:flutter_ui_kit/academy/provider/wish_list_provider.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/utility/images.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/utility/style.dart';
import 'package:flutter_ui_kit/academy/view/basewidget/card_widget.dart';
import 'package:flutter_ui_kit/academy/view/screen/course_details/course_detail_screen.dart';
import 'package:flutter_ui_kit/academy/view/screen/design/widget/instructor_widget.dart';
import 'package:flutter_ui_kit/academy/view/screen/home/widget/category_widget.dart';
import 'package:flutter_ui_kit/academy/view/screen/home/widget/course_widget.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:provider/provider.dart';

class DesignScreen extends StatelessWidget {
  final String courseTitle;

  DesignScreen({this.courseTitle});

  @override
  Widget build(BuildContext context) {
    Provider.of<AcademyWishListProvider>(context, listen: false).getWishLists();
    Provider.of<AcademyDesignProvider>(context, listen: false).getDesignData();
    Provider.of<CourseProvider>(context, listen: false).initializeAllFeaturedCourse();

    return Scaffold(
      backgroundColor: AcademyColorResources.COLOR_WHITE,
      appBar: AppBar(
        backgroundColor: AcademyColorResources.COLOR_WHITE,
        title: Text(courseTitle ?? '', style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_GREY, fontSize: 15)),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AcademyColorResources.COLOR_GREY),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.filter_list, color: AcademyColorResources.COLOR_GREY)), CardWidget()],
      ),
      body: ListView(padding: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_SMALL), physics: BouncingScrollPhysics(), children: [
        Text(AcademyStrings.featured_courses, style: avenirHeavy),
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
        Text(AcademyStrings.popular_topic, style: avenirHeavy),
        SizedBox(height: AcademyDimensions.PADDING_SIZE_SMALL),
        Container(
          height: 35,
          child: Consumer<AcademyDesignProvider>(
            builder: (context, design, child) {
              return ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: design.popularTopicList.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (_) => DesignScreen(courseTitle: design.popularTopicList[index])));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    margin: EdgeInsets.only(right: 11),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AcademyColorResources.BORDER_COLOR),
                    child: Text(
                      design.popularTopicList[index],
                      style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_NOBEL),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
        Text(AcademyStrings.subcategories, style: avenirHeavy),
        SizedBox(height: AcademyDimensions.PADDING_SIZE_SMALL),
        Container(
          height: 35,
          child: Consumer<CourseProvider>(
            builder: (context, courseProvider, child) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: courseProvider.getAllCategory.length,
                  itemBuilder: (context, index) => CategoryWidget(categoryModel: courseProvider.getAllCategory[index], isCategoryScreen: true));
            },
          ),
        ),
        SizedBox(height: 20),
        Text(AcademyStrings.top_instructors, style: avenirHeavy),
        SizedBox(height: AcademyDimensions.PADDING_SIZE_SMALL),
        Consumer<AcademyDesignProvider>(
          builder: (context, design, child) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: design.instructorList.length,
              itemBuilder: (context, index) {
                return InstructorWidget(instructorModel: design.instructorList[index]);
              },
            );
          },
        ),
        SizedBox(height: 20),
        Text(AcademyStrings.all_course, style: avenirHeavy),
        Consumer<CourseProvider>(
          builder: (context, courseProvider, child) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: courseProvider.getAllFeaturedCourse.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => CourseDetailScreen(course: courseProvider.getAllFeaturedCourse[index])));
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: AcademyDimensions.PADDING_SIZE_SMALL),
                    padding: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_SMALL),
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage.assetNetwork(placeholder: Images.place_holder, image: courseProvider.getAllFeaturedCourse[index].imageUrl, width: 80, height: 80, fit: BoxFit.fill)),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(courseProvider.getAllFeaturedCourse[index].title,
                              maxLines: 2, overflow: TextOverflow.ellipsis, style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_GREY)),
                          Row(children: [
                            Icon(Icons.star, color: AcademyColorResources.COLOR_ORANGE, size: 17),
                            Icon(Icons.star, color: AcademyColorResources.COLOR_ORANGE, size: 17),
                            Icon(Icons.star, color: AcademyColorResources.COLOR_ORANGE, size: 17),
                            Icon(Icons.star, color: AcademyColorResources.COLOR_ORANGE, size: 17),
                            Icon(Icons.star, color: AcademyColorResources.BORDER_COLOR, size: 17),
                            Expanded(child: SizedBox()),
                            Text('${courseProvider.getAllFeaturedCourse[index].rattingAndDownload}',
                                style: robotoMedium.copyWith(
                                  fontSize: AcademyDimensions.FONT_SIZE_SMALL,
                                  color: AcademyColorResources.TITLE_COLOR,
                                )),
                          ]),
                          Text(courseProvider.getAllFeaturedCourse[index].name,
                              style: robotoMedium.copyWith(
                                fontSize: AcademyDimensions.FONT_SIZE_SMALL,
                                color: AcademyColorResources.TITLE_COLOR,
                              )),
                          Row(children: [
                            Text('${courseProvider.getAllFeaturedCourse[index].currentPrice}', style: avenirHeavy),
                            SizedBox(width: 10),
                            Text('${courseProvider.getAllFeaturedCourse[index].lastPrice}',
                                style: robotoMedium.copyWith(
                                  fontSize: AcademyDimensions.FONT_SIZE_SMALL,
                                  color: AcademyColorResources.TITLE_COLOR,
                                  decoration: TextDecoration.lineThrough,
                                )),
                          ]),
                        ]),
                      ),
                    ]),
                  ),
                );
              },
            );
          },
        ),
      ]),
    );
  }
}
