import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/utility/style.dart';
import 'package:flutter_ui_kit/academy/view/screen/account/widget/arrow_button.dart';
import 'package:flutter_ui_kit/all_app_screen.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';

class AcademyAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AcademyColorResources.COLOR_WHITE,
      appBar: AppBar(
        title: Text(AcademyStrings.account, style: robotoBold.copyWith(fontSize: 20)),
        backgroundColor: AcademyColorResources.COLOR_WHITE,
        elevation: 0,
      ),
      body: ListView(padding: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_SMALL), physics: BouncingScrollPhysics(), children: [
        Column(children: [
          Container(
            padding: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_EXTRA_SMALL),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: AcademyColorResources.COLOR_GREY),
            ),
            child: Icon(Icons.person_outline, color: AcademyColorResources.COLOR_GREY, size: 40),
          ),
          SizedBox(height: 10),
          Text(AcademyStrings.maria_kibtia, style: avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_LARGE)),
          Text(AcademyStrings.sample_email, style: avenirHeavy.copyWith(fontSize: AcademyDimensions.FONT_SIZE_LARGE)),
          SizedBox(height: 20),
          Text(AcademyStrings.become_an_instructor,
              style: avenirHeavy.copyWith(
                fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE,
                color: AcademyColorResources.COLOR_PRIMARY,
              )),
        ]),
        SizedBox(height: 30),
        Text(AcademyStrings.video_preferences, style: robotoMedium.copyWith(color: AcademyColorResources.TITLE_COLOR)),
        SizedBox(height: 10),
        ArrowButton(title: AcademyStrings.download_options),
        ArrowButton(title: AcademyStrings.video_playback_options),
        SizedBox(height: 30),
        Text(AcademyStrings.account_settings, style: robotoMedium.copyWith(color: AcademyColorResources.TITLE_COLOR)),
        SizedBox(height: 10),
        ArrowButton(title: AcademyStrings.account_security),
        ArrowButton(title: AcademyStrings.email_notification_preference),
        ArrowButton(title: AcademyStrings.learning_reminders),
        SizedBox(height: 30),
        Text(AcademyStrings.support, style: robotoMedium.copyWith(color: AcademyColorResources.TITLE_COLOR)),
        SizedBox(height: 10),
        ArrowButton(title: AcademyStrings.about_e_Academy),
        ArrowButton(title: AcademyStrings.about_e_Academy_for_business),
        ArrowButton(title: AcademyStrings.frequently_asked_questions),
        ArrowButton(title: AcademyStrings.share_the_e_academy_app),
        SizedBox(height: 30),
        Text(AcademyStrings.diagnostics, style: robotoMedium.copyWith(color: AcademyColorResources.TITLE_COLOR)),
        SizedBox(height: 10),
        ArrowButton(title: AcademyStrings.status),
        SizedBox(height: 30),
        Column(children: [
          InkWell(
            onTap: () {
              // ignore: unnecessary_statements
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => AllAppScreen()), (route) => false) ?? false;
            },
            child: Text(AcademyStrings.sign_out,
                style: robotoBold.copyWith(
                  fontSize: AcademyDimensions.FONT_SIZE_EXTRA_LARGE,
                  color: AcademyColorResources.COLOR_PRIMARY,
                )),
          ),
          SizedBox(height: 20),
          Text(AcademyStrings.e_academy_version, style: robotoMedium.copyWith(color: AcademyColorResources.TITLE_COLOR)),
        ]),
      ]),
    );
  }
}
