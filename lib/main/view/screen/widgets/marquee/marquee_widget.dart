import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';
import 'package:marquee_widget/marquee_widget.dart';

class MarqueeTextWidget extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MarqueeTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marquee Widget'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1/1,
        children: [

          //for first grid
          GridTile(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1,),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [

                  Expanded(
                      child: FadeInImage.assetNetwork(
                        placeholder: MainAppImages.place_holder,
                        image: MainAppImages.motion_three,
                        fit: BoxFit.fitHeight,
                      ),
                  ),

                  Marquee(
                      child: Text(
                        'Flutter is a free and open source Google mobile UI . ',
                        style: TextStyle(fontSize: 16),
                      ),
                  ),
                ],
              ),
            ),
          ),

          //for two grid
          GridTile(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1,),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [

                  Expanded(
                      child:  FadeInImage.assetNetwork(
                        placeholder: MainAppImages.place_holder,
                        image: MainAppImages.motion_two,
                        fit: BoxFit.fitHeight,
                      ),
                  ),
                  Marquee(
                      child: Text(
                        'Flutter is a free and open source Google mobile UI. ',
                        style: TextStyle(fontSize: 16),
                      ),
                  ),
                ],
              ),
            ),
          ),


          //for three grid
          GridTile(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1,),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Expanded(
                      child: Marquee(
                          child: Container(
                              width: 500,
                              child:  FadeInImage.assetNetwork(
                                placeholder: MainAppImages.place_holder,
                                image: MainAppImages.motion_three,
                                fit: BoxFit.fitHeight,
                              ),
                          ),
                      ),
                  ),

                  Marquee(
                      child: Text(
                        'Flutter is a free and open source Google mobile UI', style: TextStyle(fontSize: 16),
                      ),
                  ),
                ],
              ),
            ),
          ),

          //for four GridView
          GridTile(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1,),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Expanded(
                      child: Marquee(
                          textDirection: TextDirection.rtl,
                          directionMarguee: DirectionMarguee.oneDirection,
                          child: Container(
                              width: 500,
                              child:  FadeInImage.assetNetwork(
                                placeholder: MainAppImages.place_holder,
                                image: MainAppImages.motion_three,
                                fit: BoxFit.fitHeight,
                              ),
                          ),
                      ),
                  ),

                  Marquee(
                      textDirection: TextDirection.rtl,
                      directionMarguee: DirectionMarguee.oneDirection,
                      child: Text(
                        'Flutter is a free and open source Google mobile UI',
                        style: TextStyle(fontSize: 16),
                      ),
                  ),
                ],
              ),
            ),
          ),

          //for five grid
          GridTile(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1,),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Marquee(
                      direction: Axis.vertical,
                      textDirection: TextDirection.rtl,
                      directionMarguee: DirectionMarguee.TwoDirection,
                      child: Container(
                        height: 500,
                        child:  FadeInImage.assetNetwork(
                          placeholder: MainAppImages.place_holder,
                          image: MainAppImages.motion_one,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),


          //for Six grid
          GridTile(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1,),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Marquee(
                      direction: Axis.vertical,
                      textDirection: TextDirection.rtl,
                      directionMarguee: DirectionMarguee.TwoDirection,
                      child: Container(
                        alignment: Alignment.center,
                        height: 400,
                        child: Text(
                          'Flutter is a free and open source Google mobile UI,Flutter is a free and open source Google mobile UI',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}