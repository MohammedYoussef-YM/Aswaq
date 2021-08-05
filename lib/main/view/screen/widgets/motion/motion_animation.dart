import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/custom_theme.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/motion/details_category.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/motion/details_page.dart';


class TransitionsPage extends StatefulWidget {
  @override
  _TransitionsHomePageState createState() => _TransitionsHomePageState();
}

class ListTileList {
  String name;
  String image;
  int time;
  String dateTime;
  ListTileList({@required this.name,this.image,this.time,this.dateTime});

}
class _TransitionsHomePageState extends State<TransitionsPage> {

  final List<ListTileList> listTileList=<ListTileList>[
    ListTileList(name:'Jennifer Lawrence',image: MainAppImages.motion_one,dateTime: '10:05pm',time: 2),
    ListTileList(name:'Scarlett Johan',image: MainAppImages.motion_two,dateTime: '09:22am',time: 5),
    ListTileList(name:'Natalie Portman',image: MainAppImages.motion_three,dateTime: '05:55am',time: 11),
    ListTileList(name:'Emma Stone',image: MainAppImages.motion_four,dateTime:'12:39pm',time: 23),
    ListTileList(name:'Gal Gadot',image: MainAppImages.motion_five,dateTime: '03:30pm',time: 5),
    ListTileList(name:'Jalexandra Dad',image: MainAppImages.motion_six,dateTime: '05:01pm',time: 35),
    ListTileList(name:'Margot Robbie',image: MainAppImages.motion_four,dateTime: '03:59am',time: 29),
    ListTileList(name:'Scarlett Johan',image: MainAppImages.motion_one,dateTime: '09:22am',time: 5),
    ListTileList(name:'Natalie Portman',image:MainAppImages.motion_five,dateTime: '05:55am',time: 11),
    ListTileList(name:'Jalexandra Dad',image:  MainAppImages.motion_three,dateTime: '05:01pm',time: 35),
    ListTileList(name:'Margot Robbie',image: MainAppImages.motion_two,dateTime: '03:59am',time: 29),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Motion Transitions'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: listTileList.length,
              itemBuilder:(context,index){
                return  Container(
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color:  Colors.grey[300],
                  ),
                  child:  OpenContainer(
                    transitionDuration: Duration(seconds: 2),
                    closedBuilder: (context,closeWidget)=>InkWell(
                      onTap: closeWidget,

                      child: ListTile(
                        title: Text(listTileList[index].name,style: robotoMedium.copyWith(fontSize: 16),),
                        subtitle: Row(
                          children: [
                            Text('${listTileList[index].time}min ago',style: robotoRegular.copyWith(fontSize: 12)),
                            SizedBox(width: 10,),
                            Text('${listTileList[index].dateTime}',style: robotoRegular.copyWith(fontSize: 14)),
                          ],
                        ),
                        leading: Container(
                          width: 50.0,
                          height: 50.0,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: FadeInImage.assetNetwork(
                                  placeholder: MainAppImages.place_holder,
                                  image: listTileList[index].image,fit: BoxFit.cover)
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.arrow_forward_ios_outlined),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                        },),
                      ),
                    ),
                    openBuilder: (context,openWidget)=>DetailsCategoryPage(),),
                );
              }
          ),
      ),



      floatingActionButton: OpenContainer(
        transitionDuration: Duration(seconds: 3),
        closedBuilder: (context,closeWidget){
          return FloatingActionButton(
            backgroundColor: Color(0xff5050D5),
              child: Icon(Icons.add,color: Colors.white,),
              onPressed: closeWidget);
        },
        openBuilder: (context,openWidget){
          return DetailsProfilePage();
          },
      ),
    );
  }
}
