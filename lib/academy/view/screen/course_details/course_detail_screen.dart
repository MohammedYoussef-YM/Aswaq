import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/data/model/course.dart';
import 'package:flutter_ui_kit/academy/provider/course_provider.dart';
import 'package:flutter_ui_kit/academy/provider/wish_list_provider.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/utility/images.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/utility/style.dart';
import 'package:flutter_ui_kit/academy/view/basewidget/card_widget.dart';
import 'package:flutter_ui_kit/academy/view/basewidget/rating_bar.dart';
import 'package:flutter_ui_kit/academy/view/screen/author/author_screen.dart';
import 'package:flutter_ui_kit/academy/view/screen/payment/payment_screen.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CourseDetailScreen extends StatelessWidget {
  final Course course;

  CourseDetailScreen({this.course});
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int addedIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AcademyColorResources.COLOR_WHITE,
      appBar: AppBar(
        backgroundColor: AcademyColorResources.COLOR_TURQUOISE,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AcademyColorResources.COLOR_WHITE),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Icon(Icons.share, color: AcademyColorResources.COLOR_WHITE),
          SizedBox(
            width: AcademyDimensions.PADDING_SIZE_DEFAULT,
          ),
          CardWidget(isWhiteIcon: true),
        ],
      ),
      body: Consumer<AcademyWishListProvider>(
        builder: (context, order, child) => ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(3), bottomLeft: Radius.circular(3)),
                  color: AcademyColorResources.COLOR_TURQUOISE),
              child: Column(
                children: [
                  // for preview image

                   /* VideosPlayer(
                    networkVideos: [
                      new NetworkVideo(
                          id: course.id.toString(),
                          name: course.title,
                          videoUrl: course.previewVideoUrl,
                          thumbnailUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
                          videoControl: new NetworkVideoControl(
                            fullScreenByDefault: true,
                     )),
                    ],
                    playlistStyle: Style.Style2,
                  ),*/

                  Padding(
                    padding: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_SMALL),
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Text(
                          course.title,
                          style: avenirHeavy.copyWith(fontSize: 22, height: 1.3),
                        ),
                        Text(
                          course.subTitle,
                          style: avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE, height: 1.3),
                        ),

                        SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 4, horizontal: AcademyDimensions.FONT_SIZE_SMALL),
                              decoration: BoxDecoration(color: AcademyColorResources.COLOR_ORANGE),
                              child: Text(
                                course.condition,
                                style: robotoMedium.copyWith(fontSize: 17, color: AcademyColorResources.COLOR_BLACK),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 4, horizontal: AcademyDimensions.FONT_SIZE_SMALL),
                              decoration: BoxDecoration(
                                  color: AcademyColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_LARGE)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    color: AcademyColorResources.COLOR_BLACK,
                                    size: 18,
                                  ),
                                  Text(
                                    AcademyStrings.total_hours_18_5,
                                    style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_BLACK),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 4, horizontal: AcademyDimensions.FONT_SIZE_SMALL),
                              decoration: BoxDecoration(
                                  color: AcademyColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_LARGE)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: AcademyColorResources.COLOR_BLACK,
                                    size: 16,
                                  ),
                                  Text(
                                    AcademyStrings.rating_4_5,
                                    style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_BLACK),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: AcademyDimensions.PADDING_SIZE_SMALL),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 4, horizontal: AcademyDimensions.FONT_SIZE_SMALL),
                              decoration: BoxDecoration(
                                  color: AcademyColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_LARGE)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: AcademyColorResources.COLOR_BLACK,
                                    size: 18,
                                  ),
                                  Text(
                                    AcademyStrings.enrolled_1164876,
                                    style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_BLACK),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: AcademyDimensions.PADDING_SIZE_SMALL),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: AcademyDimensions.FONT_SIZE_SMALL),
                                decoration: BoxDecoration(
                                    color: AcademyColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_LARGE)),
                                child: Text(
                                  'Created by ${course.name}',
                                  textAlign: TextAlign.center,
                                  style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_BLACK, fontSize: AcademyDimensions.FONT_SIZE_SMALL),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: AcademyDimensions.PADDING_SIZE_SMALL),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: AcademyDimensions.FONT_SIZE_SMALL),
                                decoration: BoxDecoration(
                                    color: AcademyColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_LARGE)),
                                child: Text(
                                  AcademyStrings.english_german_france,
                                  textAlign: TextAlign.center,
                                  style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_BLACK),
                                ),
                              ),
                            ),
                            SizedBox(width: AcademyDimensions.PADDING_SIZE_SMALL),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 5, horizontal: AcademyDimensions.FONT_SIZE_SMALL),
                                decoration: BoxDecoration(
                                    color: AcademyColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_LARGE)),
                                child: Text(
                                  AcademyStrings.updated_8_20,
                                  textAlign: TextAlign.center,
                                  style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_BLACK),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // for title

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_SMALL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // for price section

                  Row(
                    children: [
                      Text(course.currentPrice, style: avenirHeavy.copyWith(color: AcademyColorResources.COLOR_BLACK, fontSize: 24.0)),
                      SizedBox(width: AcademyDimensions.PADDING_SIZE_DEFAULT),
                      Text(course.lastPrice,
                          style: robotoMedium.copyWith(
                            color: AcademyColorResources.COLOR_GREY,
                            fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE,
                            decoration: TextDecoration.lineThrough,
                          )),
                    ],
                  ),

                  Text(AcademyStrings.day_left_at_this_1_,
                      style: robotoMedium.copyWith(
                        color: AcademyColorResources.COLOR_RED,
                        fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE,
                      )),
                  SizedBox(height: AcademyDimensions.PADDING_SIZE_EXTRA_LARGE),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => PaymentScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_SMALL), color: AcademyColorResources.COLOR_ORANGE),
                      child: Text(AcademyStrings.buy_now,
                          style: robotoBold.copyWith(
                            color: AcademyColorResources.COLOR_WHITE,
                            fontSize: 22,
                          )),
                    ),
                  ),
                  SizedBox(height: AcademyDimensions.PADDING_SIZE_SMALL),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('WishList Added Successful')));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_SMALL),
                                color: AcademyColorResources.COLOR_WHITE,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: Offset(0, 1), // changes position of shadow
                                  ),
                                ],
                                border: Border.all(color: AcademyColorResources.BORDER_COLOR)),
                            child: Text(AcademyStrings.add_to_wishlist, style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_PRIMARY)),
                          ),
                        ),
                      ),
                      SizedBox(width: AcademyDimensions.PADDING_SIZE_SMALL),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            // Course
                            order.AddedCard(Course(
                                id: addedIndex++,
                                imageUrl: Images.course_1,
                                title: AcademyStrings.the_complete_2020_web_development_bootcamp,
                                name: AcademyStrings.dr_angela_yu,
                                rattingAndDownload: AcademyStrings.four_6_40124,
                                lastPrice: AcademyStrings.number_11000,
                                currentPrice: AcademyStrings.bdt_1000,
                                condition: AcademyStrings.bestseller));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully Added')));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_SMALL),
                                color: AcademyColorResources.COLOR_WHITE,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: Offset(0, 1), // changes position of shadow
                                  ),
                                ],
                                border: Border.all(color: AcademyColorResources.BORDER_COLOR)),
                            child: Text(AcademyStrings.add_to_cart, style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_PRIMARY)),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // for course includes
                  SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_SMALL),
                        color: AcademyColorResources.COLOR_WHITE,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        border: Border.all(color: AcademyColorResources.BORDER_COLOR)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AcademyStrings.the_course_includes,
                          style: avenirHeavy.copyWith(fontSize: 22, color: AcademyColorResources.COLOR_BLACK),
                        ),
                        SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                        _courseIncludes(title: AcademyStrings.full_lifetime_access),
                        _courseIncludes(title: AcademyStrings.article_03),
                        _courseIncludes(title: AcademyStrings.access_on_mobile_tv),
                        _courseIncludes(title: AcademyStrings.certicate_of_completion),
                        _courseIncludes(title: AcademyStrings.total_hours_on_20),
                        _courseIncludes(title: AcademyStrings.support_files),
                      ],
                    ),
                  ),

                  // for What Will Learn
                  SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_SMALL),
                        color: AcademyColorResources.COLOR_WHITE,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        border: Border.all(color: AcademyColorResources.BORDER_COLOR)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AcademyStrings.what_will_i_learn,
                          style: avenirHeavy.copyWith(fontSize: 22, color: AcademyColorResources.COLOR_BLACK),
                        ),
                        SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                        _learnWidget(title: AcademyStrings.it_is_a_long__using),
                        _learnWidget(title: AcademyStrings.contrary_to_popular__old),
                        _learnWidget(title: AcademyStrings.there_are_many__of),
                        SizedBox(height: 13.0),
                        Text(
                          AcademyStrings.show_more,
                          style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_RED),
                        ),
                        SizedBox(height: 13.0),
                      ],
                    ),
                  ),

                  // for Description
                  SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_SMALL),
                        color: AcademyColorResources.COLOR_WHITE,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        border: Border.all(color: AcademyColorResources.BORDER_COLOR)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AcademyStrings.description,
                          style: avenirHeavy.copyWith(fontSize: 22, color: AcademyColorResources.COLOR_BLACK),
                        ),
                        SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                        Text(AcademyStrings.contrary_to_popular__words, style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_BLACK)),
                        SizedBox(height: 13.0),
                        Text(
                          AcademyStrings.show_more,
                          style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_RED),
                        ),
                        SizedBox(height: 13.0),
                      ],
                    ),
                  ),

                  // for Requirment
                  SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_SMALL),
                        color: AcademyColorResources.COLOR_WHITE,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        border: Border.all(color: AcademyColorResources.BORDER_COLOR)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AcademyStrings.reqirement,
                          style: avenirHeavy.copyWith(fontSize: 22, color: AcademyColorResources.COLOR_BLACK),
                        ),
                        SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                        _learnWidget(title: AcademyStrings.it_is_a_long__using),
                        _learnWidget(title: AcademyStrings.lorem__industry),
                        SizedBox(height: 13.0),
                        Text(
                          AcademyStrings.show_more,
                          style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_RED),
                        ),
                        SizedBox(height: 13.0),
                      ],
                    ),
                  ),

                  // for Students also Viewed
                  SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_SMALL),
                        color: AcademyColorResources.COLOR_WHITE,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        border: Border.all(color: AcademyColorResources.BORDER_COLOR)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AcademyStrings.students_are_viewing,
                          style: avenirHeavy.copyWith(fontSize: 22, color: AcademyColorResources.COLOR_BLACK),
                        ),
                        SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                        Consumer<CourseProvider>(
                            builder: (context, courseProvider, child) => ListView.builder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (context, index) => _courseWidget(context: context, course: courseProvider.getAllFeaturedCourse[index])))
                      ],
                    ),
                  ),

                  // for Curriculum
                  SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_SMALL),
                        color: AcademyColorResources.COLOR_WHITE,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        border: Border.all(color: AcademyColorResources.BORDER_COLOR)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AcademyStrings.curriculum,
                          style: avenirHeavy.copyWith(fontSize: 22, color: AcademyColorResources.COLOR_BLACK),
                        ),
                        SizedBox(height: AcademyDimensions.PADDING_SIZE_SMALL),
                        Text(
                          AcademyStrings.lectured_124_total,
                          style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_GREY.withOpacity(.8)),
                        ),
                        SizedBox(height: AcademyDimensions.PADDING_SIZE_SMALL),
                      ],
                    ),
                  ),

                  // for Course OverView
                  SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_SMALL),
                        color: AcademyColorResources.COLOR_WHITE,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        border: Border.all(color: AcademyColorResources.BORDER_COLOR)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AcademyStrings.course_overview,
                          style: avenirHeavy.copyWith(fontSize: 22, color: AcademyColorResources.COLOR_BLACK),
                        ),
                        SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                        _courseOverViewWidget(number: 1, title: AcademyStrings.why_python, subtitle: AcademyStrings.video_08, isShowCC: false),
                        _courseOverViewWidget(
                            number: 2, title: AcademyStrings.course_introduction, subtitle: AcademyStrings.video_08, isShowPreview: true),
                        _courseOverViewWidget(number: 3, title: AcademyStrings.course_faqs, subtitle: AcademyStrings.article_03),
                        _courseOverViewWidget(number: 4, title: AcademyStrings.why_python, subtitle: AcademyStrings.video_08),
                        SizedBox(height: AcademyDimensions.PADDING_SIZE_SMALL),
                      ],
                    ),
                  ),

                  // for Method And Function
                  SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                  _categoryWidget(context: context, title: AcademyStrings.method_and_function),
                  // for Python Steatment
                  SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                  _categoryWidget(context: context, title: AcademyStrings.python_statement),
                  // for Python Setup
                  SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                  _categoryWidget(context: context, title: AcademyStrings.python_setup),
                  // for More Sections
                  SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 17, horizontal: 12),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_SMALL),
                        color: AcademyColorResources.COLOR_WHITE,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        border: Border.all(color: AcademyColorResources.BORDER_COLOR)),
                    child: Text(
                      AcademyStrings.more_selections_18_,
                      style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_RED),
                    ),
                  ),

                  // for Created by John Sina
                  SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_SMALL),
                        color: AcademyColorResources.COLOR_WHITE,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        border: Border.all(color: AcademyColorResources.BORDER_COLOR)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AcademyStrings.created_by_john_sina,
                          style: avenirHeavy.copyWith(fontSize: 22, color: AcademyColorResources.COLOR_BLACK),
                        ),
                        SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeInImage.assetNetwork(
                              placeholder: Images.place_holder,
                              image: Images.john_sina,height: 60,fit: BoxFit.fill,),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      size: 20,
                                      color: AcademyColorResources.ICON_COLOR,
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      AcademyStrings.number_11000,
                                      style: robotoMedium.copyWith(
                                          fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE, color: AcademyColorResources.COLOR_GREY),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      AcademyStrings.students,
                                      style: robotoMedium.copyWith(
                                          fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE, color: AcademyColorResources.ICON_COLOR),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.calendar_view_day,
                                      size: 20,
                                      color: AcademyColorResources.ICON_COLOR,
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      AcademyStrings.digit28,
                                      style: robotoMedium.copyWith(
                                          fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE, color: AcademyColorResources.COLOR_GREY),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      AcademyStrings.courses,
                                      style: robotoMedium.copyWith(
                                          fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE, color: AcademyColorResources.ICON_COLOR),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star_border,
                                      size: 20,
                                      color: AcademyColorResources.ICON_COLOR,
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      AcademyStrings.rating_4_5,
                                      style: robotoMedium.copyWith(
                                          fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE, color: AcademyColorResources.COLOR_GREY),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      AcademyStrings.average_rating,
                                      style: robotoMedium.copyWith(
                                          fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE, color: AcademyColorResources.ICON_COLOR),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => AuthorScreen()));
                                  },
                                  child: Text(
                                    AcademyStrings.view_profile,
                                    style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_RED),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  // for Student FeedBack
                  SizedBox(height: AcademyDimensions.PADDING_SIZE_LARGE),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_SMALL),
                        color: AcademyColorResources.COLOR_WHITE,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        border: Border.all(color: AcademyColorResources.BORDER_COLOR)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AcademyStrings.student_feedback,
                          style: avenirHeavy.copyWith(fontSize: 22, color: AcademyColorResources.COLOR_BLACK),
                        ),
                        Row(
                          children: [
                            Text(
                              AcademyStrings.rating_4_5,
                              style: robotoMedium.copyWith(fontSize: 35, color: AcademyColorResources.COLOR_GREY),
                            ),
                            SizedBox(width: 4),
                            Text(
                              AcademyStrings.average_rating,
                              style:
                              robotoMedium.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE, color: AcademyColorResources.ICON_COLOR),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        _ratingWidget(value: 0.56, showRating: 5),
                        _ratingWidget(value: 0.35, showRating: 4),
                        _ratingWidget(value: 0.11, showRating: 3),
                        _ratingWidget(value: 0.05, showRating: 2),
                        _ratingWidget(value: 0.01, showRating: 1),
                        SizedBox(height: 25),
                        _feedbackWidget(
                            showRating: 2,
                            title: AcademyStrings.it_is_well_done,
                            authorName: AcademyStrings.mehmet_sergio,
                            createByTime: AcademyStrings.months_ago_2_),
                        _feedbackWidget(
                            showRating: 5,
                            title: AcademyStrings.this_course_is,
                            authorName: AcademyStrings.radanielson_t,
                            createByTime: AcademyStrings.months_ago_3_),
                        _feedbackWidget(
                            showRating: 3,
                            title: AcademyStrings.python_is_one_of,
                            authorName: AcademyStrings.mehmet_sergio,
                            createByTime: AcademyStrings.months_ago_2_),
                        Center(
                          child: Text(
                            AcademyStrings.see_more_reviews,
                            style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_RED, fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _courseIncludes({String title}) {
    return Container(
      margin: EdgeInsets.only(bottom: AcademyDimensions.PADDING_SIZE_SMALL),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(backgroundColor: AcademyColorResources.COLOR_BLACK, radius: 5),
          SizedBox(width: AcademyDimensions.PADDING_SIZE_SMALL),
          Expanded(child: Text(title, style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_BLACK, height: 1)))
        ],
      ),
    );
  }

  Widget _learnWidget({String title}) {
    return Container(
      margin: EdgeInsets.only(bottom: AcademyDimensions.PADDING_SIZE_SMALL),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.done, color: AcademyColorResources.COLOR_TURQUOISE),
          Expanded(child: Text(title, style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_BLACK)))
        ],
      ),
    );
  }

  Widget _courseWidget({BuildContext context, Course course}) {
    return Container(
      margin: EdgeInsets.only(bottom: AcademyDimensions.PADDING_SIZE_DEFAULT),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => CourseDetailScreen(course: course)));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: FadeInImage.assetNetwork(
                    placeholder: Images.place_holder,
                    image: course.imageUrl,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                )),
            SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(course.title,
                      style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_GREY, fontSize: AcademyDimensions.FONT_SIZE_LARGE)),
                  SizedBox(height: 7),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: AcademyDimensions.FONT_SIZE_SMALL),
                    decoration: BoxDecoration(color: AcademyColorResources.COLOR_TURQUOISE),
                    child: Text(
                      course.condition,
                      style: robotoMedium.copyWith(fontSize: 9, color: AcademyColorResources.COLOR_BLACK),
                    ),
                  ),
                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBar(
                        ratingNumber: 3,
                      ),
                      Text(course.rattingAndDownload, style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_NOBEL))
                    ],
                  ),
                  SizedBox(height: 7),
                  Text(course.name, style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_GREY)),
                  SizedBox(height: 7),
                  Row(
                    children: [
                      Text(course.currentPrice,
                          style: avenirHeavy.copyWith(
                            fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE,
                          )),
                      SizedBox(width: AcademyDimensions.PADDING_SIZE_EXTRA_SMALL),
                      Text(course.lastPrice,
                          style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_NOBEL, decoration: TextDecoration.lineThrough)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _courseOverViewWidget({int number, String title, String subtitle, bool isShowCC = true, bool isShowPreview = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: AcademyDimensions.PADDING_SIZE_DEFAULT),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(number.toString(), style: avenirHeavy.copyWith(fontSize: 22, color: AcademyColorResources.COLOR_BLACK)),
              SizedBox(width: 22),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: robotoMedium.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE, color: AcademyColorResources.COLOR_GREY),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        subtitle,
                        style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_GREY),
                      ),
                      SizedBox(width: 7),
                      isShowCC
                          ? Container(
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_EXTRA_SMALL),
                              color: AcademyColorResources.COLOR_GREY),
                          child: Text(
                            'cc',
                            style: robotoMedium.copyWith(
                                fontSize: AcademyDimensions.FONT_SIZE_EXTRA_SMALL, color: AcademyColorResources.COLOR_WHITE),
                          ))
                          : SizedBox.shrink(),
                    ],
                  )
                ],
              ),
            ],
          ),
          isShowPreview ? Text('preview', style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_PRIMARY)) : SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _categoryWidget({BuildContext context, String title}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 12),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AcademyDimensions.PADDING_SIZE_SMALL),
          color: AcademyColorResources.COLOR_WHITE,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
          border: Border.all(color: AcademyColorResources.BORDER_COLOR)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: avenirHeavy.copyWith(fontSize: 22, color: AcademyColorResources.COLOR_BLACK),
          ),
          Icon(
            Icons.add,
            color: AcademyColorResources.COLOR_RED,
            size: 30,
          )
        ],
      ),
    );
  }

  Widget _ratingWidget({double value, int showRating}) {
    return Container(
      margin: EdgeInsets.only(bottom: 11),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: LinearProgressIndicator(
                  backgroundColor: AcademyColorResources.BORDER_COLOR,
                  valueColor: AlwaysStoppedAnimation(AcademyColorResources.COLOR_SILVA),
                  value: value,
                  minHeight: 15)),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                SizedBox(width: 5),
                RatingBar(ratingNumber: showRating),
                SizedBox(width: 5),
                Text(
                  '${(value * 100).round()}%',
                  style: robotoMedium.copyWith(color: AcademyColorResources.ICON_COLOR),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _feedbackWidget({int showRating, String title, String authorName, String createByTime}) {
    return Container(
      margin: EdgeInsets.only(bottom: 29),
      child: Column(
        children: [
          RatingBar(ratingNumber: showRating),
          SizedBox(height: AcademyDimensions.PADDING_SIZE_SMALL),
          Text(title, style: robotoMedium.copyWith(fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE, color: AcademyColorResources.COLOR_GREY)),
          SizedBox(height: AcademyDimensions.PADDING_SIZE_SMALL),
          Row(
            children: [
              Text(authorName, style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_NOBEL)),
              SizedBox(width: AcademyDimensions.PADDING_SIZE_SMALL),
              Text(createByTime, style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_NOBEL)),
            ],
          ),
        ],
      ),
    );
  }
}
