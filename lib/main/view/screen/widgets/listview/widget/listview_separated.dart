import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';


class ListViewSeparated extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(' ListView Separated'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: 30,
          itemBuilder: (BuildContext context, int index)=> Container(
            height: 85,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: EdgeInsets.only(bottom:15),
            decoration: BoxDecoration(
              color: Color(0xff5050D5),
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
                    image: MainAppImages.widget_three,
                    height: 70,
                    width: 85,
                    fit: BoxFit.cover),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('ListView Serarated',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
                  SizedBox(height: 10),
                  Text('\$300',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),
                  ),
                  SizedBox(width: 5),
                  Text('\$200', style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 12,
                  )),
                ]),
              ),
              Column( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5, bottom: 5),
                      child: Icon( Icons.add_shopping_cart_outlined,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    Row(
                      children: [
                        Text('3.6',style: TextStyle(color: Colors.white),),
                        Icon(Icons.star_half,color: Colors.orangeAccent,),
                      ],
                    ),
                  ]),
            ]),
          ),
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      ),
    );
  }
}
