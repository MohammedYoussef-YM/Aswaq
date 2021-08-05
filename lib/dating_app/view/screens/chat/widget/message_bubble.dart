import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/dating_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/dating_app/utility/dating_image.dart';
import 'package:flutter_ui_kit/dating_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String time;
  final String imageUrl;

  MessageBubble({@required this.text, @required this.isMe, @required this.imageUrl, this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isMe
              ? SizedBox.shrink()
              : Container(
            width: 50.0,
            height: 50.0,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: FadeInImage.assetNetwork(
                    placeholder: DatingImages.place_holder_dating,
                    image: imageUrl,fit: BoxFit.cover,)
            ),
          ),

          /* CircleAvatar(
                  backgroundImage: ExactAssetImage(imageUrl),
                ),*/
          Expanded(
            child: Column(
              crossAxisAlignment: !isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                Container(
                    margin: isMe ? EdgeInsets.only(top: 5, bottom: 5, left: 80, right: 10) : EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 80),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: isMe ? Radius.circular(15) : Radius.circular(0),
                        bottomRight: isMe ? Radius.circular(0) : Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: isMe ? Color(0x96757E90) : ColorResources.COLOR_PRIMARY,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Text(text, style: robotoRegular.copyWith(color: ColorResources.COLOR_WHITE, fontSize: Dimensions.FONT_SIZE_LARGE)),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL, right: Dimensions.PADDING_SIZE_SMALL),
                  child: Text(
                    time,
                    style: robotoLight.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL),
                  ),
                ),
              ],
            ),
          ),
          !isMe
              ? SizedBox.shrink()
              : Container(
            width: 50.0,
            height: 50.0,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: FadeInImage.assetNetwork(
                  placeholder: DatingImages.place_holder_dating,
                  image: imageUrl,fit: BoxFit.cover,)
            ),
          ),
        ],
      ),
    );
  }
}
