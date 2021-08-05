import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';


class ListViewBuilder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(' ListView Builder'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: 22,
            itemBuilder: (BuildContext context, int index)=> Container(
              height: 85,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: EdgeInsets.only(bottom:15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5, spreadRadius: 1,
                )],
              ),
              child: Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child:FadeInImage.assetNetwork(
                      placeholder: MainAppImages.place_holder,
                      image: MainAppImages.widget_one,
                      height: 70,
                      width: 85,
                      fit: BoxFit.cover),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text('ListView Builder',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
                   SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(Icons.star,color: Colors.orangeAccent,size: 18,),
                        Icon(Icons.star_half,color: Colors.orangeAccent,size: 18),
                        Icon(Icons.star_rate_outlined,color: Colors.orangeAccent,size: 18),
                        Icon(Icons.star_outline_outlined,color: Colors.orangeAccent,size: 18),
                        Icon(Icons.star_outline_sharp,color: Colors.orangeAccent,size: 18),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(children: [
                      Text('\$300',
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),
                      ),
                      SizedBox(width: 5),
                      Text('\$200', style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 12,
                      )),
                    ]),
                  ]),
                ),
                Column( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Padding(
                        padding: EdgeInsets.only(left: 5, bottom: 5),
                        child: Icon( Icons.favorite,
                          color: Colors.grey,
                        ),
                      ),
                  Icon(Icons.add),
                ]),
              ]),
            ),
        ),
      ),
    );
  }
}