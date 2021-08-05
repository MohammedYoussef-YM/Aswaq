import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell/widget.dart';

class FoldingCellListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdfd4f4),
      appBar: AppBar(
        title: Text('Folded Cell'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return SimpleFoldingCell.create(
              frontWidget: _buildFrontWidget(index),
              innerWidget: _buildInnerWidget(index),
              cellSize: Size(MediaQuery.of(context).size.width, 125),
              padding: EdgeInsets.all(15),
              animationDuration: Duration(milliseconds: 300),
              borderRadius: 10,
            );
          },
        ),
      ),
    );
  }

  Widget _buildFrontWidget(int index) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          color: Color(0xffdfd4f4),
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded( flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xff6a53a4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Today", style: TextStyle( color: Colors.grey,fontSize: 18)),
                      SizedBox(height: 10,),
                      Text('09:00am', style: TextStyle(fontSize: 18,color: Colors.white)),
                    ],
                  ),
                ),
              ),
              Expanded( flex:2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [

                      Text('6am Tech Day Meeting', style: TextStyle(fontSize: 16,color: Color(0xff660FC2)),),
                      TextButton(
                        onPressed: () {
                          final foldingCellState = context
                              .findAncestorStateOfType<SimpleFoldingCellState>();
                          foldingCellState?.toggleFold();
                        },
                        child: Text(
                          "Close",
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: Size(80, 40),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildInnerWidget(int index) {
    return Builder(
      builder: (context) {
        return Container(
          color: Color(0xFFecf2f9),
          padding: EdgeInsets.only(top: 10),
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      color: Color(0xff6a53a4),
                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text( "Details",style: TextStyle(color: Colors.orange,fontSize: 20,fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Icon(Icons.book,size: 25,color: Colors.orange),
                              SizedBox(width: 10,),
                              Text('Functional and Business Units',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.room_preferences_rounded,size: 25,color: Colors.orange),
                              SizedBox(width: 10,),
                              Text('2nd Flood Conference Room',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.watch_later,size: 25,color: Colors.orange),
                              SizedBox(width: 10,),
                              Text('09:00am-09:45am',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      )
                  )
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    final foldingCellState = context
                        .findAncestorStateOfType<SimpleFoldingCellState>();
                    foldingCellState?.toggleFold();
                  },
                  child:  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.notifications_on_rounded,size: 25,color: Colors.orangeAccent,),
                      SizedBox(width: 10,),
                      Text("Reminder",style: TextStyle(color: Colors.black,fontSize: 18)),
                    ],
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(80, 40),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}