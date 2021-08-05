import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';

class DismissWidget extends StatefulWidget {
  @override
  _DismissibleWidgetState createState() => _DismissibleWidgetState();
}

class DismissibleList {
  String name;
  String image;
  int time;
  String dateTime;
  DismissibleList({@required this.name,this.image,this.time,this.dateTime});

}

class _DismissibleWidgetState extends State<DismissWidget> {

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  final List<DismissibleList> dismissibleList=<DismissibleList>[
    DismissibleList(name:'Jennifer Lawrence',image: MainAppImages.widget_one,dateTime: '10:05pm',time: 2),
    DismissibleList(name:'Scarlett Johan',image: MainAppImages.widget_two,dateTime: '09:22am',time: 5),
    DismissibleList(name:'Natalie Portman',image: MainAppImages.widget_three,dateTime: '05:55am',time: 11),
    DismissibleList(name:'Emma Stone',image: MainAppImages.widget_four,dateTime:'12:39pm',time: 23),
    DismissibleList(name:'Gal Gadot',image: MainAppImages.widget_five,dateTime: '03:30pm',time: 5),
    DismissibleList(name:'Jalexandra Dad',image: MainAppImages.widget_six,dateTime: '05:01pm',time: 35),
    DismissibleList(name:'Margot Robbie',image: MainAppImages.widget_one,dateTime: '03:59am',time: 29),
    DismissibleList(name:'Scarlett Johan',image: MainAppImages.widget_three,dateTime: '09:22am',time: 5),
    DismissibleList(name:'Natalie Portman',image:MainAppImages.widget_five,dateTime: '05:55am',time: 11),
    DismissibleList(name:'Jalexandra Dad',image:  MainAppImages.widget_two,dateTime: '05:01pm',time: 35),
    DismissibleList(name:'Margot Robbie',image: MainAppImages.widget_four,dateTime: '03:59am',time: 29),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Dismissible Widget'),
        backgroundColor: Color(0xff5050D5),
      ),
      key: _globalKey,
      body: ListView.builder(
        itemCount: dismissibleList.length,
        itemBuilder: (context,index){
          return Dismissible(
            key: ValueKey('${dismissibleList[index].name}'),
            background: Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[300],
                  boxShadow: [ BoxShadow(color: Colors.grey,spreadRadius: 0.5,blurRadius: 0.1),]
              ),
              child: Icon(Icons.delete_outlined,size: 40,color: Colors.red,) ,),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                dismissibleList.removeAt(index);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully Delete'),
                  backgroundColor: Colors.red,
                  duration: Duration(milliseconds: 1000),));
              });},
            confirmDismiss: (direction) {
              return showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text('6am UI Kit'),
                    content: Text('Are you sure to delete this product?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {Navigator.of(context).pop(false);},
                          child: Text('No'),
                      ),
                      TextButton(
                        onPressed: () {Navigator.of(context).pop(true);},
                        child: Text('Yes'),
                      ),
                    ],
                  );},
              );},
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xff5050D5),
                  boxShadow: [BoxShadow(color: Colors.grey,spreadRadius: 0.5,blurRadius: 0.1)]
              ),
              child: ListTile(
                title: Text(dismissibleList[index].name, style: TextStyle(color: Color(0xffFCFCFC),fontSize: 18)),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${dismissibleList[index].time}min ago', style: TextStyle(color: Color(0xffFCFCFC),fontSize: 12)),
                    Text('${dismissibleList[index].dateTime}',style: TextStyle(color: Color(0xffFCFCFC),fontSize: 14)),

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
                trailing: IconButton(icon: Icon(Icons.call_end_outlined,size: 30,color: Colors.white,),
                  onPressed: () {
                  Navigator.of(context).pop(true);
                  },),
              ),
            ),
          );},
      ),
    );
  }
}
