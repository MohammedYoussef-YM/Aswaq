import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/custom_theme.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';


class DismissibleList {
  String name;
  String image;
  int time;
  String dateTime;
  DismissibleList({@required this.name,this.image,this.time,this.dateTime});

}

class DetailsProfilePage extends StatelessWidget {

  final List<DismissibleList> dismissibleList=<DismissibleList>[
    DismissibleList(name:'Jennifer Lawrence',image: MainAppImages.motion_one,dateTime: '10:05pm',time: 2),
    DismissibleList(name:'Scarlett Johan',image: MainAppImages.motion_two,dateTime: '09:22am',time: 5),
    DismissibleList(name:'Natalie Portman',image: MainAppImages.motion_three,dateTime: '05:55am',time: 11),
    DismissibleList(name:'Emma Stone',image: MainAppImages.motion_four,dateTime:'12:39pm',time: 23),
    DismissibleList(name:'Gal Gadot',image: MainAppImages.motion_five,dateTime: '03:30pm',time: 5),
    DismissibleList(name:'Jalexandra Dad',image: MainAppImages.motion_six,dateTime: '05:01pm',time: 35),
    DismissibleList(name:'Margot Robbie',image: MainAppImages.motion_four,dateTime: '03:59am',time: 29),
    DismissibleList(name:'Scarlett Johan',image: MainAppImages.motion_one,dateTime: '09:22am',time: 5),
    DismissibleList(name:'Natalie Portman',image:MainAppImages.motion_five,dateTime: '05:55am',time: 11),
    DismissibleList(name:'Jalexandra Dad',image:  MainAppImages.motion_three,dateTime: '05:01pm',time: 35),
    DismissibleList(name:'Margot Robbie',image: MainAppImages.motion_two,dateTime: '03:59am',time: 29),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Color(0xff5050D5),
              pinned: true,
              title: Text('Growing',),
            ),
          ];
        },
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(14),
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 80.0,
                          height: 80.0,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(45.0),
                              child: FadeInImage.assetNetwork(
                                  placeholder: MainAppImages.place_holder,
                                  image: MainAppImages.motion_three,fit: BoxFit.cover)
                          ),
                        ),
                        Column(
                          children: [
                            Text('6am UI Kit',style: poppinsSemiBold.copyWith(color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold,)),
                            Text('The Biggest UI Kit',style: poppinsRegular.copyWith(color: Colors.black,fontSize: 12)),
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 2,
                    indent: 30,
                    endIndent: 30,
                    thickness: 2,
                    color: Colors.grey[400],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 100,
                            margin: EdgeInsets.only(
                              left: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'View Profile',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 30),
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color(0xff61B943),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Text(
                              "Add User",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: dismissibleList.length,
                  itemBuilder: (context,index)=>ListTile(
                    title: Text(dismissibleList[index].name, style: poppinsSemiBold.copyWith(color: Color(0xff0F0F0F),fontSize: 16)),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${dismissibleList[index].time}min ago', style: poppinsRegular.copyWith(color: Color(0xff0F0F0F),fontSize: 12)),
                        Text('${dismissibleList[index].dateTime}',style: poppinsRegular.copyWith(color: Color(0xff0F0F0F),fontSize: 14)),
                      ],
                    ),
                    leading:  Container(
                      width: 50.0,
                      height: 50.0,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: FadeInImage.assetNetwork(
                              placeholder: MainAppImages.place_holder,
                              image: dismissibleList[index].image,fit: BoxFit.cover)
                      ),
                    ),
                    trailing: IconButton(icon: Icon(Icons.call_end,size: 25,color: Color(0xff0F0F0F),),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
