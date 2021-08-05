import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class PopUpMenuBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _globalKey,
      appBar: AppBar(title: Text('PopupMenuButton'),
        backgroundColor: Color(0xff5050D5),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        physics: BouncingScrollPhysics(),
        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [

                  //for First PopUpMenu
                  Positioned(
                    top: 5,
                    right: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        boxShadow: [BoxShadow(color: Colors.grey[300], spreadRadius: .5, blurRadius: 5)],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child:  Text('PopupMenuButton 1'),
                    ),
                  ),
                  Positioned(
                      right: 24,
                      top: 10,
                      child:  PopupMenuButton(itemBuilder: (c) {
                        return <PopupMenuItem<int>>[
                          PopupMenuItem<int>(
                              child: const Text('Home'), value: 0),
                          PopupMenuItem<int>(
                              child: const Text('Message'), value: 1),
                          PopupMenuItem<int>(
                              child: const Text('Settings'), value: 2),
                        ];
                      }, onSelected: (value) {
                        if(value == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Click Home',style: TextStyle(color: Colors.white)),
                              backgroundColor: Colors.blue, behavior: SnackBarBehavior.floating, margin: EdgeInsets.all(12)));
                        }else if(value == 1) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Click Message',style: TextStyle(color: Colors.white)),
                              backgroundColor: Colors.blue, behavior: SnackBarBehavior.floating, margin: EdgeInsets.all(12)));
                        }else if(value == 2) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Click Settings',style: TextStyle(color: Colors.white),),
                              backgroundColor: Colors.blue, behavior: SnackBarBehavior.floating, margin: EdgeInsets.all(12)));
                        }
                      })),

                  //for Second PopUpMenu
                  Positioned(
                    top: 60,
                    right: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        boxShadow: [BoxShadow(color: Colors.grey[300], spreadRadius: .5, blurRadius: 5)],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child:  Text('PopupMenuButton 2'),
                    ),
                  ),
                  Positioned(
                      right: 24,
                      top: 64,
                      child:  PopupMenuButton(itemBuilder: (c) {
                        return <PopupMenuItem<int>>[
                          PopupMenuItem<int>(
                              child: const Text('Home'), value: 0),
                          PopupMenuItem<int>(
                              child: const Text('Search'), value: 1),
                          PopupMenuItem<int>(
                              child: const Text('Chat'), value: 2),
                          PopupMenuItem<int>(
                              child: const Text('Notification'), value: 3),
                          PopupMenuItem<int>(
                              child: const Text('Account'), value: 4),
                        ];
                      }, onSelected: (value) {
                        if(value == 0) {
                          Flushbar(
                            backgroundColor: Color(0xff5050D5),
                            title: 'Click Home',
                            message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                            icon: Icon(
                              Icons.home_outlined,
                              size: 28.0,
                              color: Colors.white,
                            ),
                            duration: Duration(seconds: 3),
                            leftBarIndicatorColor: Colors.blue[300],
                            margin: EdgeInsets.all(8),
                            borderRadius: BorderRadius.circular(8),
                            dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                            forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
                          ).show(context);
                        }else if(value == 1) {
                          Flushbar(
                            backgroundColor: Color(0xff5050D5),
                            title: 'Click Search',
                            message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                            icon: Icon(
                              Icons.search_outlined,
                              size: 28.0,
                              color: Colors.white,
                            ),
                            duration: Duration(seconds: 3),
                            leftBarIndicatorColor: Colors.blue[300],
                            margin: EdgeInsets.all(8),
                            borderRadius: BorderRadius.circular(8),
                            dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                            forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
                          ).show(context);
                        }else if(value == 2) {
                          Flushbar(
                            backgroundColor: Color(0xff5050D5),
                            title: 'Click Chat',
                            message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                            icon: Icon(
                              Icons.chat_bubble_outline,
                              size: 28.0,
                              color: Colors.white,
                            ),
                            duration: Duration(seconds: 3),
                            leftBarIndicatorColor: Colors.blue[300],
                            margin: EdgeInsets.all(8),
                            borderRadius: BorderRadius.circular(8),
                            dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                            forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
                          ).show(context);
                        }else if(value == 3) {
                          Flushbar(
                            backgroundColor: Color(0xff5050D5),
                            title: 'Click Notification',
                            message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                            icon: Icon(
                              Icons.notifications_none_outlined,
                              size: 28.0,
                              color: Colors.white,
                            ),
                            duration: Duration(seconds: 3),
                            leftBarIndicatorColor: Colors.blue[300],
                            margin: EdgeInsets.all(8),
                            borderRadius: BorderRadius.circular(8),
                            dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                            forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
                          ).show(context);
                        }else if(value == 4) {
                          Flushbar(
                            backgroundColor: Color(0xff5050D5),
                            title: 'Click Account',
                            message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                            icon: Icon(
                              Icons.account_balance_wallet_outlined,
                              size: 28.0,
                              color: Colors.white,
                            ),
                            duration: Duration(seconds: 3),
                            leftBarIndicatorColor: Colors.blue[300],
                            margin: EdgeInsets.all(8),
                            borderRadius: BorderRadius.circular(8),
                            dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                            forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
                          ).show(context);
                        }
                      })),

                  //for Third PopUpMenu
                  Positioned(
                    top: 115,
                    right: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        boxShadow: [BoxShadow(color: Colors.grey[300], spreadRadius: .5, blurRadius: 5)],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child:  Text('PopupMenuButton 3'),
                    ),
                  ),
                  Positioned(
                      right: 24,
                      top: 120,
                      child:  PopupMenuButton(itemBuilder: (c) {
                        return <PopupMenuItem<int>>[

                          PopupMenuItem<int>(
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.upload_outlined),
                                  Text('Upload'),
                                ],
                              ), value: 0),
                          PopupMenuItem<int>(
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.download_outlined),
                                  Text('Download'),
                                ],
                              ), value: 1),
                          PopupMenuItem<int>(
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.bookmark_border_outlined),
                                  Text('Bookmark'),
                                ],
                              ), value: 2),
                          PopupMenuItem<int>(
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.share_outlined),
                                  Text('Share'),
                                ],
                              ), value: 3),
                        ];
                      },
                          onSelected: (value) {
                        if(value == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Click Upload'),
                              backgroundColor: Color(0xff5050D5),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                              behavior: SnackBarBehavior.floating, margin: EdgeInsets.all(12)));

                        }else if(value == 1) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Click Download'),
                              backgroundColor: Color(0xff5050D5),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                              behavior: SnackBarBehavior.floating, margin: EdgeInsets.all(12)));

                        }else if(value == 2) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Click Bookmark'),
                              backgroundColor: Color(0xff5050D5),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                              behavior: SnackBarBehavior.floating, margin: EdgeInsets.all(12)));

                        }else if(value == 3) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Click Share'),
                              backgroundColor: Color(0xff5050D5),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                              behavior: SnackBarBehavior.floating, margin: EdgeInsets.all(12)));

                        }else if(value == 4) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Rounded Snackbar'),
                              backgroundColor: Color(0xff5050D5),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                              behavior: SnackBarBehavior.floating, margin: EdgeInsets.all(12)));

                        }
                      })),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}