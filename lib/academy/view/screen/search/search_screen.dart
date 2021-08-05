import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/provider/course_provider.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/utility/style.dart';
import 'package:flutter_ui_kit/academy/view/basewidget/card_widget.dart';
import 'package:flutter_ui_kit/academy/view/basewidget/custom_text_field.dart';
import 'package:flutter_ui_kit/academy/view/screen/design/design_screen.dart';
import 'package:flutter_ui_kit/academy/view/screen/search/widget/category_view.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  double _crossAxisSpacing = 5, _mainAxisSpacing = 10, _aspectRatio = 3.5;
  int _crossAxisCount = 3;

  @override
  Widget build(BuildContext context) {
    Provider.of<CourseProvider>(context, listen: false).initializeAllTopSearches();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          borderColor: AcademyColorResources.COLOR_GREY.withOpacity(.5),
                          prefixIcon: Icons.search,
                          hintText: AcademyStrings.search_all_courses,
                          isGreyColor: true,
                          textInputAction: TextInputAction.search,
                        ),
                      ),
                      SizedBox(width: 45),

                    ],
                  ),
                  Positioned(right: 0, top: -10, child: CardWidget()),
                ],
              ),
            ),
            Expanded(
              child: Consumer<CourseProvider>(
                builder: (context, courseProvider, child) => ListView(
                  padding: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_SMALL),
                  physics: BouncingScrollPhysics(),
                  children: [
                    // for top Search Section

                    Text(
                      AcademyStrings.top_searces,
                      style: avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE),
                    ),
                    SizedBox(height: AcademyDimensions.PADDING_SIZE_DEFAULT),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: courseProvider.allTopSearches.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: _crossAxisCount,
                          crossAxisSpacing: _crossAxisSpacing,
                          mainAxisSpacing: _mainAxisSpacing,
                          childAspectRatio: _aspectRatio,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) => DesignScreen(courseTitle: courseProvider.allTopSearches[index])));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                              margin: EdgeInsets.only(right: 11),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(21.0), color: AcademyColorResources.BORDER_COLOR),
                              child: Text(
                                courseProvider.allTopSearches[index],
                                style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_NOBEL),
                              ),
                            ),
                          );
                        }),

                    // for browse categories
                    SizedBox(height: 30),
                    Text(
                      AcademyStrings.broese_categories,
                      style: avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE),
                    ),
                    SizedBox(height: AcademyDimensions.PADDING_SIZE_SMALL),
                    CategoryView()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
