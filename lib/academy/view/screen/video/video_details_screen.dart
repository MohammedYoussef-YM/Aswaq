import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:flutter_ui_kit/academy/view/screen/video/widget/section_widget.dart';
import 'package:flutter_ui_kit/academy/view/screen/video/widget/video_widget.dart';

class VideoDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           /* VideosPlayer(
              networkVideos: [
                new NetworkVideo(
                    id: "2",
                    name: "Elephant Dream",
                    videoUrl: "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
                    thumbnailUrl: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
                    videoControl: new NetworkVideoControl(
                      fullScreenByDefault: true,
                    )),
              ],
              playlistStyle: Style.Style2,
            ),*/

            Expanded(
              child: ListView(padding: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_SMALL), physics: BouncingScrollPhysics(), children: [


                SizedBox(height: 10),
                Text('The Complete Strapi Course', style: robotoMedium),
                Text('Alex V', style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_GREY, fontSize: AcademyDimensions.FONT_SIZE_SMALL)),
                SizedBox(height: 20),
                Text('Lectures', style: robotoMedium.copyWith(fontSize: AcademyDimensions.FONT_SIZE_SMALL)),
                Divider(color: AcademyColorResources.PRIMARY_LIGHT),
                SizedBox(height: 10),
                SectionWidget(title: 'Section 1- Introduction'),
                VideoWidget(counter: '1', title: 'Introduction', description: 'Video - 05:12mins'),
                SizedBox(height: 20),
                SectionWidget(title: 'Section 2- Free Resources for this Course'),
                VideoWidget(counter: '2', title: 'Slide for the Course', description: 'Article'),
                VideoWidget(counter: '3', title: 'Installing Node,js and NPM', description: 'Video - 05:12mins -Resources(1)'),
                VideoWidget(counter: '4', title: 'Freebies', description: 'Article'),
                SizedBox(height: 20),
                SectionWidget(title: 'Section 3- Free Resources for this Course'),
                VideoWidget(counter: '5', title: 'Slide for the Course', description: 'Article'),
                VideoWidget(counter: '6', title: 'Installing Node,js and NPM', description: 'Video - 05:12mins -Resources(1)'),
                VideoWidget(counter: '7', title: 'Freebies', description: 'Article'),
                SizedBox(height: 20),
                SectionWidget(title: 'Section 4- Free Resources for this Course'),
                VideoWidget(counter: '8', title: 'Slide for the Course', description: 'Article'),
                VideoWidget(counter: '9', title: 'Installing Node,js and NPM', description: 'Video - 05:12mins -Resources(1)'),
                VideoWidget(counter: '10', title: 'Freebies', description: 'Article'),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
