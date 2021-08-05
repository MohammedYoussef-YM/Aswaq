import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/view/basewidget/card_widget.dart';
import 'package:flutter_ui_kit/academy/view/screen/search/search_screen.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';

class SearchWidget extends StatelessWidget {
  final String hintText;

  SearchWidget({this.hintText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen())),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Stack(
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 19, vertical: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.0), border: Border.all(color: AcademyColorResources.COLOR_GREY.withOpacity(.5))),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 20,
                          color: AcademyColorResources.COLOR_GREY,
                        ),
                        SizedBox(width: 20),
                        Text(
                          AcademyStrings.search_all_courses,
                          style: robotoMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 45),
              ],
            ),
            Positioned(right: 0, top: -10, child: CardWidget()),
          ],
        ),
      ),
    );
  }
}
