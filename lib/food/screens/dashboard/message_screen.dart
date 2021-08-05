import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/food/data/message_data.dart';
import 'package:flutter_ui_kit/food/model/message_model.dart';
import 'package:flutter_ui_kit/food/utility/colorResources.dart';
import 'package:flutter_ui_kit/food/utility/dimensions.dart';
import 'package:flutter_ui_kit/food/utility/strings.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Stack(
              children: [
                SafeArea(
                    child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: Dimensions.PADDING_SIZE_EXTRA_SMALL, bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: Text(
                      Strings.MESSAGES,
                      style: TextStyle(fontSize: Dimensions.TEXT_SIZE_EXTRA_LARGE, color: ColorResources.COLOR_BLACK),
                    ),
                  ),
                )),
                Positioned(
                  right: 0,
                  child: SafeArea(
                      child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                          top: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                          bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: ColorResources.COLOR_WHITE,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          boxShadow: [
                            BoxShadow(
                              color: ColorResources.COLOR_GREY.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.import_export,
                            color: ColorResources.COLOR_PRIMARY,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  )),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: _messageBody(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _messageBody(BuildContext context) {
    return ListView.builder(
      itemCount: MessageData.getAllMessage.length,
      padding: EdgeInsets.all(0),
      itemBuilder: (context, index) {
        MessageModel messageModel = MessageData.getAllMessage[index];
        return Column(
          children: [
            ListTile(
              leading: CircleAvatar(child: Icon(Icons.person), radius: 30),
              title: Text(
                messageModel.title,
                style: TextStyle(color: ColorResources.COLOR_BLACK,
                    //fontFamily: khulaBold,
                    fontSize: Dimensions.TEXT_SIZE_DEFAULT),
              ),
              subtitle: Text(messageModel.description,
                  style: TextStyle(color: ColorResources.COLOR_GREY, fontSize: Dimensions.TEXT_SIZE_SMALL)),
              trailing: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(messageModel.time,
                    style: TextStyle(color: ColorResources.COLOR_GREY, fontSize: Dimensions.PADDING_SIZE_SMALL)),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                Container(
                  height: 15,
                  width: 15,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorResources.COLOR_PRIMARY,
                  ),
                  child: Text('3', style: TextStyle(color: ColorResources.COLOR_WHITE, fontSize: 8)),
                ),
              ]),
              onTap: () {},
            ),
            Divider(
              thickness: 0.2,
              color: ColorResources.COLOR_GREY,
            ),
          ],
        );
      },
    );
  }
}
