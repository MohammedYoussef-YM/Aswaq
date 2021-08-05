import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/data/model/chat_model.dart';
import 'package:flutter_ui_kit/doctor/data/repository/chat_repo.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/view/views/audio_calling_screen.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/message_bubble.dart';
import 'package:flutter_ui_kit/doctor/view/widgets/small_icon_button.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<ChatModel> chatList = ChatRepo().getChatList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: ColorResources.COLOR_PRIMARY,
          child: Column(children: [
            Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorResources.COLOR_WHITE,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)
                  ),
                ),
                child: Column(children: [
                  Row(children: [
                    SmallIconButton(iconData: Icons.arrow_back_ios, myFunction: (){Navigator.pop(context);},),
                    SizedBox(width: 10,),
                    Expanded(child: Text('Nipon Roy', style: TextStyle(
                        color: ColorResources.COLOR_GREY,
                        fontSize: Dimensions.FONT_SIZE_LARGE,
                      fontWeight: FontWeight.bold
                    ))),
                    SmallIconButton(iconData: Icons.call, myFunction: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AudioCallingScreen()))),
                  ]),
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                        itemCount: chatList.length,
                        itemBuilder: (context, index){
                        List<ChatModel> reversed = chatList.reversed.toList();
                          return MessageBubble(isMe: reversed[index].isMe, text: reversed[index].message);
                        },
                    ),
                  ),
                ]),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(child: Container(margin: EdgeInsets.all(20),
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Enter something',
                      hintStyle: TextStyle(color: Color(0x56FFFFFF)),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0x24FFFFFF),
                      prefixIcon: Icon(Icons.attach_file, color: Color(0x56FFFFFF)),
                      suffixIcon: SmallIconButton(iconData: Icons.send, myFunction: (){
                        if(_controller.text.isNotEmpty){
                          chatList.add(ChatModel(_controller.text, true));
                          _controller.text = '';
                          setState(() {});
                        }
                      },),
                    ),
                  ),
              )),
            ),
          ]),
        ),
      ),
    );
  }
}



