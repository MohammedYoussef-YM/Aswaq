import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/wallet/data/models/get_started_model.dart';
import 'package:flutter_ui_kit/wallet/utility/colorResources.dart';
import 'package:flutter_ui_kit/wallet/utility/dimensions.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';

class GetStatedCardWidget extends StatelessWidget {
  final GetStartedModel getStarted;
  final GetStartedModel getSecondData;
  final CarouselController carouselController;

  GetStatedCardWidget(this.getStarted, this.getSecondData, this.carouselController);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ColorResources.COLOR_WHITE,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(getStarted.imageUrl, height: Dimensions.CARD_IMAGE_HEIGHT, fit: BoxFit.fill),
              SizedBox(height: 35),
              Text(getStarted.title, style: poppinsRegular.copyWith(color: ColorResources.COLOR_CHARCOAL, fontSize: 18)),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(getSecondData.secondSlideText, textAlign: TextAlign.center, style: montserratSemiBold.copyWith(fontSize: 12)),
        ),
      ],
    );
  }
}
