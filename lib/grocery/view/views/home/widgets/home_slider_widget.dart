import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/images.dart';

class HomeSliderWidget extends StatelessWidget {
  final String imageUrl;

  HomeSliderWidget({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: FadeInImage.assetNetwork(
        placeholder: Images.place_holder,
        image: imageUrl,
        height: 200,
        width: double.infinity,
        fit: BoxFit.fill,),
    );
  }
}
