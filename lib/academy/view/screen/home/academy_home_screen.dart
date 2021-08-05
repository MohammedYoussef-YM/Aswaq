import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/provider/course_provider.dart';
import 'package:flutter_ui_kit/academy/provider/wish_list_provider.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/utility/style.dart';
import 'package:flutter_ui_kit/academy/view/screen/category/category_screen.dart';
import 'package:flutter_ui_kit/academy/view/screen/home/widget/category_widget.dart';
import 'package:flutter_ui_kit/academy/view/screen/home/widget/course_widget.dart';
import 'package:flutter_ui_kit/academy/view/screen/home/widget/search_widget.dart';
import 'package:provider/provider.dart';

class AcademyHomeScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Provider.of<CourseProvider>(context, listen: false).initializeAllFeaturedCourse();
    Provider.of<CourseProvider>(context, listen: false).initializeAllCategory();
    Provider.of<AcademyWishListProvider>(context, listen: false).getWishLists();
    Provider.of<AcademyWishListProvider>(context, listen: false).getCardLists();

    return Scaffold(
      backgroundColor: AcademyColorResources.COLOR_WHITE,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          slivers: [
            // App Bar
            SliverAppBar(
              floating: true,
              elevation: 0,
              centerTitle: false,
              toolbarHeight: 10,
              automaticallyImplyLeading: false,
              backgroundColor: AcademyColorResources.COLOR_WHITE,
            ),

            // Search Button
            SliverPersistentHeader(
                pinned: true,
                delegate: SliverDelegate(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: AcademyDimensions.PADDING_SIZE_SMALL, vertical: 2),
                  color: AcademyColorResources.COLOR_WHITE,
                  alignment: Alignment.center,
                  child: SearchWidget(
                      //hintText: Strings.type_what_you_want,
                      ),
                ))),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(AcademyDimensions.PADDING_SIZE_DEFAULT),
                child: Consumer<CourseProvider>(
                  builder: (context, courseProvider, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AcademyStrings.featured,
                        style: avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE),
                      ),
                      SizedBox(height: AcademyDimensions.PADDING_SIZE_SMALL),
                      Container(
                        height: 325,
                        child: ListView.builder(
                            itemCount: courseProvider.getAllFeaturedCourse.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              print(courseProvider.getAllFeaturedCourse.length);
                              return CourseWidget(course: courseProvider.getAllFeaturedCourse[index], width: 207);
                            }),
                      ),

                      // for category section

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AcademyStrings.categories,
                            style: avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoryScreen()));
                            },
                            child: Text(
                              AcademyStrings.view_all,
                              style:
                                  avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE, color: AcademyColorResources.COLOR_NOBEL),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                      Container(
                        height: 35,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: courseProvider.getAllCategory.length,
                            itemBuilder: (context, index) => CategoryWidget(categoryModel: courseProvider.getAllCategory[index])),
                      ),
                      SizedBox(height: AcademyDimensions.PADDING_SIZE_DEFAULT),
                      Container(
                        height: 35,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemCount: courseProvider.getSecondCategory.length,
                            itemBuilder: (context, index) => CategoryWidget(categoryModel: courseProvider.getSecondCategory[index])),
                      ),

                      // for top courses in business
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Text(
                            AcademyStrings.top_courses_in,
                            style: avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE),
                          ),
                          Text(
                            AcademyStrings.business,
                            style:
                                avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE, color: AcademyColorResources.COLOR_PRIMARY),
                          ),
                        ],
                      ),
                      SizedBox(height: AcademyDimensions.PADDING_SIZE_DEFAULT),
                      Container(
                        height: 345,
                        child: ListView.builder(
                            itemCount: courseProvider.getAllFeaturedCourse.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              print(courseProvider.getAllFeaturedCourse.length);
                              return CourseWidget(
                                course: courseProvider.getAllFeaturedCourse[index],
                                width: 165,
                                isShowLastPrice: false,
                              );
                            }),
                      ),

                      // for top courses in Design
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Text(
                            AcademyStrings.top_courses_in,
                            style: avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE),
                          ),
                          Text(
                            AcademyStrings.design,
                            style:
                                avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE, color: AcademyColorResources.COLOR_PRIMARY),
                          ),
                        ],
                      ),
                      SizedBox(height: AcademyDimensions.PADDING_SIZE_DEFAULT),
                      Container(
                        height: 345,
                        child: ListView.builder(
                            itemCount: courseProvider.getAllFeaturedCourse.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              print(courseProvider.getAllFeaturedCourse.length);
                              return CourseWidget(
                                course: courseProvider.getAllFeaturedCourse[index],
                                width: 165,
                                isShowLastPrice: false,
                              );
                            }),
                      ),

                      // for top courses in Development
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Text(
                            AcademyStrings.top_courses_in,
                            style: avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE),
                          ),
                          Text(
                            AcademyStrings.development,
                            style:
                                avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE, color: AcademyColorResources.COLOR_PRIMARY),
                          ),
                        ],
                      ),
                      SizedBox(height: AcademyDimensions.PADDING_SIZE_DEFAULT),
                      Container(
                        height: 325,
                        child: ListView.builder(
                            itemCount: courseProvider.getAllFeaturedCourse.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              print(courseProvider.getAllFeaturedCourse.length);
                              return CourseWidget(
                                course: courseProvider.getAllFeaturedCourse[index],
                                width: 207,
                                isShowLastPrice: true,
                              );
                            }),
                      ),

                      // for top courses in IT & Software
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Text(
                            AcademyStrings.top_courses_in,
                            style: avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE),
                          ),
                          Text(
                            AcademyStrings.it_software,
                            style:
                                avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE, color: AcademyColorResources.COLOR_PRIMARY),
                          ),
                        ],
                      ),
                      SizedBox(height: AcademyDimensions.PADDING_SIZE_DEFAULT),
                      Container(
                        height: 345,
                        child: ListView.builder(
                            itemCount: courseProvider.getAllFeaturedCourse.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              print(courseProvider.getAllFeaturedCourse.length);
                              return CourseWidget(
                                course: courseProvider.getAllFeaturedCourse[index],
                                width: 165,
                                isShowLastPrice: false,
                              );
                            }),
                      ),

                      // for top courses in Personal Development
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Text(
                            AcademyStrings.top_courses_in,
                            style: avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE),
                          ),
                          Text(
                            AcademyStrings.personal_development,
                            style:
                                avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE, color: AcademyColorResources.COLOR_PRIMARY),
                          ),
                        ],
                      ),
                      SizedBox(height: AcademyDimensions.PADDING_SIZE_DEFAULT),
                      Container(
                        height: 345,
                        child: ListView.builder(
                            itemCount: courseProvider.getAllFeaturedCourse.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              print(courseProvider.getAllFeaturedCourse.length);
                              return CourseWidget(
                                course: courseProvider.getAllFeaturedCourse[index],
                                width: 165,
                                isShowLastPrice: false,
                              );
                            }),
                      ),

                      // for top courses in Student are Viewing
                      SizedBox(height: 30),
                      Text(
                        AcademyStrings.students_are_viewing,
                        style: avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE),
                      ),
                      SizedBox(height: AcademyDimensions.PADDING_SIZE_DEFAULT),
                      Container(
                        height: 325,
                        child: ListView.builder(
                            itemCount: courseProvider.getAllFeaturedCourse.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              print(courseProvider.getAllFeaturedCourse.length);
                              return CourseWidget(
                                course: courseProvider.getAllFeaturedCourse[index],
                                width: 207,
                                isShowLastPrice: true,
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  SliverDelegate({@required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 55;

  @override
  double get minExtent => 55;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 50 || oldDelegate.minExtent != 50 || child != oldDelegate.child;
  }
}
