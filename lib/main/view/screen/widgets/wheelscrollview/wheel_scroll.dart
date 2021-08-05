import 'package:flutter/material.dart';

class WheelScrollView extends StatefulWidget {
  @override
  _ListWheelScrollViewsState createState() => _ListWheelScrollViewsState();
}

class _ListWheelScrollViewsState extends State<WheelScrollView> {
  int selectedItemIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      ListTile(
        leading: Icon(Icons.location_on_outlined,size: 50,),
        title: Text("Location"),
        subtitle: Text('Description here..'),
      ),
      ListTile(
        leading: Icon(Icons.table_chart_rounded,size: 50,),
        title: Text("Tab Bar"),
        subtitle: Text('Description here..'),
      ),
      ListTile(
        leading: Icon(Icons.mobile_friendly_rounded,size: 50,),
        title: Text("Mobile"),
        subtitle: Text('Description here..'),
      ),
      ListTile(
        leading: Icon(Icons.computer,size: 50,),
        title: Text("Computer"),
        subtitle: Text('Description here..'),
      ),
      ListTile(
        leading: Icon(Icons.mouse,size: 50,),
        title: Text("Mouse"),
        subtitle: Text('Description here..'),
      ),
      ListTile(
        leading: Icon(Icons.location_on_outlined,size: 50,),
        title: Text("Location"),
        subtitle: Text('Description here..'),
      ),
      ListTile(
        leading: Icon(Icons.monitor,size: 50,),
        title: Text("Location"),
        subtitle: Text('Description here..'),
      ),
      ListTile(
        leading: Icon(Icons.table_chart_rounded,size: 50,),
        title: Text("Tab Bar"),
        subtitle: Text('Description here..'),
      ),
      ListTile(
        leading: Icon(Icons.mobile_friendly_rounded,size: 50,),
        title: Text("Mobile"),
        subtitle: Text('Description here..'),
      ),
      ListTile(
        leading: Icon(Icons.computer,size: 50,),
        title: Text("Computer"),
        subtitle: Text('Description here..'),
      ),
      ListTile(
        leading: Icon(Icons.mouse,size: 50,),
        title: Text("Mouse"),
        subtitle: Text('Description here..'),
      ),
      ListTile(
        leading: Icon(Icons.location_on_outlined,size: 50,),
        title: Text("Location"),
        subtitle: Text('Description here..'),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Wheel Scroll View"),
        backgroundColor: Color(0xff5050D5),
      ),
      body: Center(
        child: ListWheelScrollView(
          itemExtent: 70.0, //used to set the size of each item in main axis
          children: items,
          magnification: 1.0,
          useMagnifier:  true,
          physics: FixedExtentScrollPhysics(),
          diameterRatio: 2.2,
          squeeze: 0.8,
          onSelectedItemChanged: (index){
            setState(() {
              selectedItemIndex = index;
            });
          },
        ),
      ),
    );
  }
}
