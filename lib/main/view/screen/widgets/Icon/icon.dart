
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class IconWidget extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<IconWidget> with SingleTickerProviderStateMixin {

  AnimationController _animationController;

  bool isActive=false;
  @override
  void initState(){
    _animationController=AnimationController(
        vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Icon Widget'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: Center(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [

              //Only Icon
              Text('Only Icon',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person_add_alt_1_outlined,size: 30,color: Color(0xff5050D5),),
                  Icon(Icons.favorite_border,size: 40,color: Color(0xff0C7D73),),
                  Icon(Icons.settings,size: 50,color:  Color(0xffCBB722),),
                ],
              ),

              //for IconButton
              SizedBox(height: 50,),
              Text('Icon Button',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton( onPressed: (){
                    Fluttertoast.showToast(msg: "Click Person Button");
                  },
                    icon: Icon(Icons.person_add_alt_1_outlined,size: 30,color: Color(0xff5050D5),),),
                  IconButton( onPressed: (){
                    Fluttertoast.showToast(msg: "Click Favourite Button");
                  },
                    icon: Icon(Icons.favorite_border,size: 40,color: Color(0xff0C7D73),),),
                  IconButton( onPressed: (){
                    Fluttertoast.showToast(msg: "Click Settings Button");
                  },
                    icon: Icon(Icons.settings,size: 50,color:  Color(0xffCBB722),),),
                  

                ],
              ),


              //for animated
              SizedBox(height: 50,),
              Text('Animated Icon Button',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              IconButton(
                  icon: AnimatedIcon(
                      size: 60,
                      color:  Color(0xff0C7D73),
                      icon: AnimatedIcons.menu_arrow,
                      progress: _animationController),
                  onPressed: (){
                    setState(() {
                      isActive=!isActive;
                      isActive ? _animationController.forward():_animationController.reverse();
                    });
                  }),
              SizedBox(height: 20,),
              IconButton(
                  icon: AnimatedIcon(
                      size: 60,
                      color: Color(0xffCBB722),
                      icon: AnimatedIcons.play_pause,
                      progress: _animationController),
                  onPressed: (){
                    setState(() {
                      isActive=!isActive;
                      isActive ? _animationController.forward():_animationController.reverse();
                    });
                  })

            ],
          ),
        ),
      ),
    );

  }
}

