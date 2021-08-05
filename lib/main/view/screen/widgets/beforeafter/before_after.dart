
import 'package:before_after/before_after.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';

class BeforeAfterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Before After'),
          backgroundColor: Color(0xff5050D5),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        physics: ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            BeforeAfter(
              beforeImage: FadeInImage.assetNetwork(
                placeholder: MainAppImages.place_holder,
                image: MainAppImages.widget_six,
                fit: BoxFit.scaleDown),

              afterImage:  FadeInImage.assetNetwork(
                placeholder: MainAppImages.place_holder,
                image: MainAppImages.widget_four,
                fit: BoxFit.scaleDown,
              ),
            ),

            SizedBox(height: 10,),
            BeforeAfter(
              beforeImage:  FadeInImage.assetNetwork(
                placeholder: MainAppImages.place_holder,
                image: MainAppImages.widget_four,
                fit: BoxFit.scaleDown,
              ),
              afterImage:  FadeInImage.assetNetwork(
                placeholder: MainAppImages.place_holder,
                image: MainAppImages.widget_six,
                fit: BoxFit.scaleDown,
              ),
              isVertical: true,
            ),
          ],
        ),
      ),
    );
  }
}