import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/localization/language_constrants.dart';
import 'package:flutter_ui_kit/restaurant/provider/chat_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/dimensions.dart';
import 'package:flutter_ui_kit/restaurant/utill/images.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:flutter_ui_kit/restaurant/view/base/custom_app_bar.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/chat/widget/message_bubble.dart';
import 'package:flutter_ui_kit/restaurant/view/screens/chat/widget/message_bubble_shimmer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  final ImagePicker picker = ImagePicker();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<RestChatProvider>(context, listen: false).getChatList();

    return Scaffold(
      appBar: CustomAppBar(title: getTranslated('message', context)),
      body: Consumer<RestChatProvider>(
        builder: (context, chat, child) {
          return Column(children: [

            Expanded(
              child: chat.chatList != null ? chat.chatList.length > 0 ? ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                itemCount: chat.chatList.length,
                shrinkWrap: true,
                reverse: true,
                itemBuilder: (context, index) {
                  return MessageBubble(chat: chat.chatList[index]);
                },
              ) : SizedBox() : ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                itemCount: 20,
                shrinkWrap: true,
                reverse: true,
                itemBuilder: (context, index) {
                  return MessageBubbleShimmer(isMe: index % 2 == 0);
                },
              ),
            ),

            // Bottom TextField
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Provider.of<RestChatProvider>(context).imageFile != null ? Padding(
                  padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.file(Provider.of<RestChatProvider>(context).imageFile, height: 70, width: 70, fit: BoxFit.cover),
                      Positioned(
                        top: -2, right: -2,
                        child: InkWell(
                          onTap: () => Provider.of<RestChatProvider>(context, listen: false).removeImage(_controller.text),
                          child: Icon(Icons.cancel, color: ColorResources.COLOR_WHITE),
                        ),
                      ),
                    ],
                  ),
                ) : SizedBox.shrink(),

                Container(
                  height: 100,
                  color: Theme.of(context).accentColor,
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL, vertical: 30),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
                    child: Row(children: [
                      InkWell(
                        onTap: () async {
                          final PickedFile pickedFile = await picker.getImage(source: ImageSource.gallery);
                          if (pickedFile != null) {
                            Provider.of<RestChatProvider>(context, listen: false).setImage(File(pickedFile.path));
                          } else {
                            print('No image selected.');
                          }
                        },
                        child: Image.asset(Images.image, width: 25, height: 25, color: ColorResources.getGreyBunkerColor(context)),
                      ),
                      SizedBox(
                        height: 25,
                        child: VerticalDivider(width: 40, thickness: 1, color: ColorResources.getGreyBunkerColor(context)),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          textCapitalization: TextCapitalization.sentences,
                          style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          expands: true,
                          decoration: InputDecoration(
                            hintText: getTranslated('type_message_here', context),
                            hintStyle: rubikRegular.copyWith(color: ColorResources.getGreyBunkerColor(context), fontSize: Dimensions.FONT_SIZE_LARGE),
                          ),
                          onChanged: (String newText) {
                            if(newText.isNotEmpty && !Provider.of<RestChatProvider>(context, listen: false).isSendButtonActive) {
                              Provider.of<RestChatProvider>(context, listen: false).toggleSendButtonActivity();
                            }else if(newText.isEmpty && Provider.of<RestChatProvider>(context, listen: false).isSendButtonActive) {
                              Provider.of<RestChatProvider>(context, listen: false).toggleSendButtonActivity();
                            }
                          },
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          if(Provider.of<RestChatProvider>(context, listen: false).isSendButtonActive){
                            Provider.of<RestChatProvider>(context, listen: false).sendMessage(_controller.text);
                            _controller.text = '';
                          }
                        },
                        child: Image.asset(
                          Images.send,
                          width: 25, height: 25,
                          color: Provider.of<RestChatProvider>(context).isSendButtonActive ? Theme.of(context).primaryColor : ColorResources.getGreyBunkerColor(context),
                        ),
                      ),
                    ]),
                  ),
                ),

              ],
            ),


          ]);
        },
      ),
    );
  }
}
