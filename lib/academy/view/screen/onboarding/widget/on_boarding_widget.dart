import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';

class OnBoardingWidget extends StatelessWidget {
  final String image;
  final String title;
  OnBoardingWidget({@required this.image, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
        child: Stack(children: [
          Positioned(
            left: -50, top: 0, bottom: 0, right: -50,
            child: Container(
              width: MediaQuery.of(context).size.width + 100,
              height: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_LARGE),
              padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AcademyColorResources.PRIMARY_LIGHT,
              ),
              child: Image.asset(image,fit: BoxFit.fill),
            ),
          ),
        ]),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Text(
          title,
          style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_WHITE, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    ]);
  }
}
