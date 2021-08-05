import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';
import 'package:shimmer/shimmer.dart';

class TestShimmerList extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//Model class for list of Data
class ListTileList {
  String name;
  String image;
  int time;
  String dateTime;
  ListTileList({@required this.name,this.image,this.time,this.dateTime});
}


class _MyHomePageState extends State<TestShimmerList> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    Timer timer=Timer(Duration(seconds: 3),(){
      setState(() {
        isLoading=false;
      });
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Shimmer'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: isLoading ? ShimmerList() : DataList(timer),
    );
  }
}



class DataList extends StatelessWidget {
  final Timer timer;
  DataList(this.timer);

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
    timer.cancel();
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context,index){
        return Container(
          color: Colors.white,
          child: ListTile(
            title: Text(listTileList[index].name),
            subtitle: Row(
              children: [
                Text('${listTileList[index].time}min ago'),
                SizedBox(width: 10,),
                Text('${listTileList[index].dateTime}'),
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
              },
            ),
          ),
        );
      },
    );
  }
}

class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
          itemCount: 12,
          itemBuilder: (BuildContext context,int index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey,
                period: Duration(seconds: 3),
                child: Container(
                  margin: EdgeInsets.all(12),
                  child:Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.image,color: Colors.grey,),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              height: 8.0,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.0),
                            ),
                            Container(
                              width: double.infinity,
                              height: 8.0,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.0),
                            ),
                            Container(
                              width: 40.0,
                              height: 8.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

