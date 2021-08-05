
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HorizontalScrollGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('GridView Horizontal'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: Center(
        child: SafeArea(
          child: SizedBox(
            height: 200.0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 12,
              itemBuilder: (BuildContext context, int index) =>
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xff5050D5),
                        border: Border.all(width: 1,),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.emoji_events,size: 80,color: Colors.yellowAccent,),
                        Text('Champions!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),)
                      ],
                    )
                    ),
                  ),
            ),
          ),
      ),
    );
  }
}
