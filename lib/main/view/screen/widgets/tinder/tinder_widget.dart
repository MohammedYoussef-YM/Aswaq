
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:flutter_ui_kit/main/utils/custom_theme.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';
import 'package:flutter_ui_kit/main/utils/strings.dart';
class TinderCardWidget extends StatefulWidget {
  @override
  _TinderCardWidgetState createState() => _TinderCardWidgetState();
}


class TinderList {
  String name;
  int num;
  String image;
  String description;
  int year;
  TinderList({@required this.name,this.num,this.image,this.description,this.year});

}

class _TinderCardWidgetState extends State<TinderCardWidget> {

  final List<TinderList> tinderLists=<TinderList>[
    TinderList(name:'Jalexandra',num: 92,image: MainAppImages.motion_one,description: Strings.DIALOG,year: 23),
    TinderList(name:'Gal Gadot',num: 99,image: MainAppImages.motion_two,description: Strings.DIALOG,year: 25),
    TinderList(name:'Margot Robbie',num: 85,image: MainAppImages.motion_three,description: Strings.DIALOG,year: 22),
    TinderList(name:'Jennifer Lawrence',num: 90,image: MainAppImages.motion_four,description: Strings.DIALOG,year: 22),
    TinderList(name:'Scarlett Johan',num: 66,image: MainAppImages.motion_five,description: Strings.DIALOG,year: 19),
    TinderList(name:'Natalie Portman',num: 89,image: MainAppImages.motion_six,description: Strings.DIALOG,year: 21),
    TinderList(name:'Emma Stone',num: 69,image: MainAppImages.motion_three,description: Strings.DIALOG,year: 23),
    ];

  @override
  Widget build(BuildContext context) {
    CardController cardController;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Tinder Widget'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: Stack(
        children: [
          Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/restaurant/image/binoculars.png'),
              SizedBox(height: 10,),
              Text('No Data Found',style: robotoRegular.copyWith(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
            ],
          )),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height/1,
              child: TinderSwapCard(
                swipeUp: true,
                swipeDown: true,
                orientation: AmassOrientation.BOTTOM,
                totalNum: 6,
                stackNum: 2,
                swipeEdge: 4.0,
                maxWidth: MediaQuery.of(context).size.width*0.9,
                maxHeight: MediaQuery.of(context).size.height*0.8,
                minWidth: MediaQuery.of(context).size.width*0.8,
                minHeight: MediaQuery.of(context).size.height*0.75,
                cardBuilder: (BuildContext context, int index)=> _cardTinder(context,index,cardController),
                cardController: cardController=CardController(),
                swipeUpdateCallback: (DragUpdateDetails details,Alignment align){
                  if(align.x < 0){
                    //Card swipe left
                  }else if(align.x > 0){
                    //Card swipe right
                  }
                },
                swipeCompleteCallback: (CardSwipeOrientation orientation,int index){
                },
              ),
            ),
          ),
        ]
        ),
      ),
    );
  }

  Widget _cardTinder( BuildContext context,int index,CardController cardController){
    return  Container(
      decoration: BoxDecoration(color: Colors.white),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius:BorderRadius.circular(12),
                child: FadeInImage.assetNetwork(
                  placeholder: MainAppImages.place_holder,
                  image: tinderLists[index].image,
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity,)
              ),
              Positioned(
                  bottom: -10,
                  right: MediaQuery.of(context).size.height/8,
                  child: Container(
                    width: 128,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/dating_app/icon/heart.png',
                          color: Colors.white,
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '${tinderLists[index].num}%',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ))
            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${tinderLists[index].name}',style: TextStyle(fontSize: 25.0),),
              SizedBox(width: 10,),
              Text('${tinderLists[index].year}year',style: TextStyle(fontSize: 16.0),),
            ],
          ),
          SizedBox(height: 12,),
          Text('${tinderLists[index].description}',style: TextStyle(fontSize: 13),textAlign: TextAlign.center,),
          SizedBox(height: 12),
          Row(
            children: [
              InkWell(
                onTap: () => cardController.triggerUp(),
                child: Image.asset(
                  'assets/dating_app/icon/star.png',
                  width: 50,
                  height: 50,
                ),
              ),
              InkWell(
                onTap: () => cardController.triggerLeft(),
                child: Image.asset(
                  'assets/dating_app/icon/cancel.png',
                  width: 90,
                  height: 100,
                ),
              ),
              InkWell(
                onTap: () => cardController.triggerRight(),
                child: Image.asset(
                  'assets/dating_app/icon/favourite.png',
                  width: 90,
                  height: 100,
                ),
              ),
              InkWell(
                onTap: () => cardController.triggerUp(),
                child: Image.asset(
                  'assets/dating_app/icon/bost.png',
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


