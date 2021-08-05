import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/custom_theme.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';
import 'package:flutter_ui_kit/main/utils/strings.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LiquidSwipeWidget extends StatefulWidget {
  @override
  _LiquidSwipeWidgetState createState() => _LiquidSwipeWidgetState();
}

class _LiquidSwipeWidgetState extends State<LiquidSwipeWidget> {

  final pages=[
    Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Expanded(
              flex:3,
              child: Container(
                padding: EdgeInsets.all(95),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: Container(
                  width: 80.0,
                  height: 80.0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset(MainAppImages.liquid_swipe_earth,fit: BoxFit.cover)
                  ),
                ),
          )),
          Expanded(
              flex:3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Color(0xff0d69ff).withOpacity(0.4),
                      Color(0xff0D6198).withOpacity(0.9),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Planet',style:  poppinsBold.copyWith(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                    Text('Earth',style:  poppinsSemiBold.copyWith(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                    SizedBox(height: 10,),
                    Text(Strings.CLIPRREACT,style: poppinsMedium.copyWith(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.white),),
                  ],),))
        ],
      ),
    ),
    Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Expanded(
              flex:3,
              child: Container(
                padding: EdgeInsets.all(95),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white
                ),
                child:  Container(
                  width: 80.0,
                  height: 80.0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child:Image.asset(MainAppImages.liquid_swipe_jupiter,fit: BoxFit.cover)
                  ),
                ),
              )),
          Expanded(
              flex:3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Color(0xffAF6F1F).withOpacity(0.4),
                      Color(0xffAF6F1F).withOpacity(0.9),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Planet',style: poppinsBold.copyWith(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                    Text('Jupiter',style: poppinsSemiBold.copyWith(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                    SizedBox(height: 10,),
                    Text(Strings.CLIPRREACT,style: poppinsMedium.copyWith(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.white),),
                  ],),))
        ],
      ),
    ),
    Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Expanded(
              flex:3,
              child: Container(
                padding: EdgeInsets.all(80),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white
                ),
                child:  Container(
                  width: 80.0,
                  height: 80.0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset(MainAppImages.liquid_swipe_mars,fit: BoxFit.cover)
                  ),),
              )),
          Expanded(
              flex:3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Color(0xffB43107).withOpacity(0.4),
                      Color(0xffB43107).withOpacity(0.9),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Planet',style:  poppinsBold.copyWith(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                    Text('Mars',style:  poppinsSemiBold.copyWith(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                    SizedBox(height: 10,),
                    Text(Strings.CLIPRREACT,style: poppinsMedium.copyWith(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.white),),
                  ],),))
        ],
      ),
    ),
    Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Expanded(
              flex:3,
              child: Container(
                padding: EdgeInsets.all(80),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white
                ),
                child:  Container(
                  width: 80.0,
                  height: 80.0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset(MainAppImages.liquid_swipe_neptune,fit: BoxFit.cover)
                  ),
                ),
              )),
          Expanded(
              flex:3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Color(0xff1D73C8).withOpacity(0.4),
                      Color(0xff1D73C8).withOpacity(0.9),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Planet',style:  poppinsBold.copyWith(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                    Text('Neptune',style:  poppinsSemiBold.copyWith(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                    SizedBox(height: 10,),
                    Text(Strings.CLIPRREACT,style: poppinsMedium.copyWith(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.white),),
                  ],),))
        ],
      ),
    ),
    Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Expanded(
              flex:3,
              child: Container(
                padding: EdgeInsets.all(80),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white
                ),
                child:  Container(
                  width: 80.0,
                  height: 80.0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child:Image.asset( MainAppImages.liquid_swipe_venus,fit: BoxFit.cover)
                  ),
                ),
              )),
          Expanded(
              flex:3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Color(0xffEE980A).withOpacity(0.4),
                      Color(0xffEE980A).withOpacity(0.9),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Planet',style:  poppinsBold.copyWith(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                    Text('Venus',style:  poppinsSemiBold.copyWith(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                    SizedBox(height: 10,),
                    Text(Strings.CLIPRREACT,style: poppinsMedium.copyWith(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.white),),
                  ],),))
        ],
      ),
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Liquid Swipe'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: Container(
          child: LiquidSwipe(pages: pages),
        ),
      ),
    );
  }
}
