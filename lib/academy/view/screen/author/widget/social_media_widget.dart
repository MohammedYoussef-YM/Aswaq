import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:flutter_ui_kit/academy/utility/style.dart';

class SocialMediaWidget extends StatelessWidget {
  final String image;
  final String title;
  final String url;
  SocialMediaWidget({@required this.image, @required this.title, @required this.url});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset(image, width: 20, height: 20),
      SizedBox(width: 10),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: avenirHeavy.copyWith(color: AcademyColorResources.COLOR_GREY)),
        Text(url, style: robotoMedium.copyWith(color: AcademyColorResources.ICON_COLOR)),
      ]),
    ]);
  }
}
