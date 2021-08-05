import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/strings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../../../main_provider.dart';
class NavigationOne extends StatelessWidget {

  final List<Widget> _screen=[HomeNav(),FavouriteNav(),InboxNav(),MenuNav()];

  @override
  Widget build(BuildContext context) {
    final Size size= MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('NavigationBar'),
          backgroundColor: Color(0xff5050D5),
        ),
        body: Stack(
          children: [
            _screen[Provider.of<MainProvider>(context).appIndex],
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: 80,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(size.width,80),
                      painter: BNBCustomPainter(),
                    ),
                    Center(
                      heightFactor: 0.6,
                      child: FloatingActionButton(
                        backgroundColor: Color(0xff5050D5),
                        elevation: 1,
                        child: Icon(Icons.add,color: Colors.white,),
                        onPressed: (){
                          Fluttertoast.showToast(msg: "Click Floating Button");
                        },
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //for Home
                          InkWell(
                            onTap: (){
                              Provider.of<MainProvider>(context,listen: false).setIndex(0);
                            },
                            child: Icon(Icons.home_work_outlined,size: Provider.of<MainProvider>(context).appIndex==0 ?40: 30,
                              color: Provider.of<MainProvider>(context).appIndex==0 ? Colors.white:Colors.grey[400],),
                          ),

                          //for Favourite
                          InkWell(
                            onTap: (){
                              Provider.of<MainProvider>(context,listen: false).setIndex(1);
                            },
                            child: Icon(Icons.favorite_border_outlined,size: Provider.of<MainProvider>(context).appIndex==1 ?40: 30,color: Provider.of<MainProvider>(context).appIndex==1 ? Colors.white :Colors.grey[400],),
                          ),
                          Container(width: size.width*0.20,),
                          //for Chat
                          InkWell(
                            onTap: (){
                              Provider.of<MainProvider>(context,listen: false).setIndex(2);
                            },
                            child: Icon(Icons.chat_bubble_outline,size: Provider.of<MainProvider>(context).appIndex==2 ?40: 30,color: Provider.of<MainProvider>(context).appIndex==2 ? Colors.white:Colors.grey[400],),
                          ),

                          //for Account
                          InkWell(
                            onTap: (){
                              Provider.of<MainProvider>(context,listen: false).setIndex(3);
                            },
                            child: Icon(Icons.menu_outlined,size: Provider.of<MainProvider>(context).appIndex==3 ?40: 30,color: Provider.of<MainProvider>(context).appIndex==3 ? Colors.white:Colors.grey[400]),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}


class BNBCustomPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint=Paint()..color=Color(0xff5050D5)..style=PaintingStyle.fill;
    Path path=Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width*0.40, 0, size.width*0.40, 20);
    path.arcToPoint(Offset(size.width*0.60,20),
        radius: Radius.circular(10.0),clockwise: false);
    path.quadraticBezierTo(size.width*0.60, 0, size.width*0.65, 0);
    path.quadraticBezierTo(size.width*0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black,5,true);
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}


class HomeNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home_outlined,size: 50,color: Colors.green,),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}
class FavouriteNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border_outlined,size: 50,color: Colors.pinkAccent,),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}

class InboxNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.messenger_outline_outlined,size: 50,color: Colors.indigo,),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}

class MenuNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu_outlined,size: 50,color: Colors.deepOrange,),
            Text(Strings.NAVIGATION),
          ],
        ),
      ),
    );
  }
}