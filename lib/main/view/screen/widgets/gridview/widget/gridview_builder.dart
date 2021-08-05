
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';


class GridViewBuilder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('GridView builder'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1/1.5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
          ),
         itemCount: 12,
         itemBuilder: (context,index)=>  Container( margin: EdgeInsets.all(5),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: Theme.of(context).accentColor,
               boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 1, blurRadius: 5)],
             ),

             child: Stack(
               clipBehavior: Clip.none,
               children: [
                 Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                   // Product Image
                   Container(
                     height: 150,
                     padding: EdgeInsets.all(15),
                     decoration: BoxDecoration(
                       color: Colors.grey[300],
                       borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                     ),
                     child: FadeInImage.assetNetwork(
                       placeholder: MainAppImages.place_holder,
                       image: MainAppImages.widget_four,fit: BoxFit.fill,),
                   ),

                   // Product Details
                   Padding(
                     padding: EdgeInsets.all(10),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [

                         Text('New Product'),
                         SizedBox(height: 5),

                         Row(children: [
                           Text('\$500',
                             style: TextStyle(color: Colors.white),
                           ),
                           Expanded(child: SizedBox.shrink()),
                           Text('3.8'),
                           Icon(Icons.star, color:Colors.orangeAccent,size: 15),
                         ]),

                         SizedBox(height: 5),

                         Text('\$ 200', style: TextStyle(color: Colors.white, decoration: TextDecoration.lineThrough, fontSize: 10,),
                         ),
                       ],
                     ),
                   ),
                 ]),

                 Positioned(
                   top: 0,
                   right: 0,
                   child: Container(
                     height: 20,
                     padding: EdgeInsets.symmetric(horizontal: 5),
                     decoration: BoxDecoration(
                       color: Colors.blue,
                       borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                     ),
                     child: Center(
                       child: Text('10% Off',
                         style: TextStyle(color: Colors.white, fontSize: 5),
                       ),
                     ),
                   ),
                 )
               ],
             )),
        ),
      ),
    );
  }
}

