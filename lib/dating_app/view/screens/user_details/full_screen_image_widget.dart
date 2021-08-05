import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/dating_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/dating_app/utility/dating_image.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class FullScreenImageWidget extends StatelessWidget {
  final String imageUrl;

  FullScreenImageWidget({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: 300,
      color: Colors.transparent,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: PinchZoom(
              image: FadeInImage.assetNetwork( placeholder: DatingImages.place_holder_dating, image:  imageUrl,),
              zoomedBackgroundColor: Colors.black.withOpacity(0.5),
              resetDuration: const Duration(milliseconds: 100),
              maxScale: 2.5,
              zoomEnabled: true,
            ),
          ),
          Positioned(
            right: 0,
              child: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: ColorResources.COLOR_WHITE,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
            },
          ))
        ],
      ),
    );
  }
}
