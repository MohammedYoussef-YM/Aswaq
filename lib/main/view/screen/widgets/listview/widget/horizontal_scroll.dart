
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HorizontalScrollListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('GridView builder'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: Center(
        child: SafeArea(
          child: SizedBox(
            height: 60.0,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 12,
              itemBuilder: (BuildContext context, int index) =>
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                      decoration: BoxDecoration(
                        color: Color(0xff5050D5),
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.favorite_outlined,size: 30,color: Color(0xffEA3219),),
                          Text('Favourite!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),)
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
