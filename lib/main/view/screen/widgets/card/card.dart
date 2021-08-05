import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';

class CardViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Card Widget'),
          backgroundColor: Color(0xff5050D5)
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 10,top: 30,right: 10,bottom: 20),
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

               //normal card
                Card(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Normal Card'),
                ),),

                SizedBox(height: 10,),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('RoundedRectangleBorder Card',
                      textScaleFactor: 1.5,),
                  ),),

                SizedBox(height: 10,),
                Card(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('BeveledRectangleBorder Card',
                    textScaleFactor: 1.5,),
                  ),),


                SizedBox(height: 10,),
                Card(
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('StadiumBorder Radius Card',
                    textScaleFactor: 1.5,),
                  ),),


                SizedBox(height: 10,),
                Text('StadiumBorder Radius image Card',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Card(
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/logo.jpg',height: 100,),
                  ),),


                SizedBox(height: 10,),
                Card(
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Elevation 1 Card',
                      textScaleFactor: 1.5,),
                  ),),


                SizedBox(height: 10,),
                Card(
                  color:Color(0xff5050D5),
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Elevation 20 and Color Card',style: TextStyle(color: Colors.white),
                      textScaleFactor: 1.3,),
                  ),),


                SizedBox(height: 10,),
                Card(
                  shadowColor: Colors.red,
                  color:Color(0xff5050D5),
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Elevation 20, Color and shadow Card',style: TextStyle(color: Colors.white),
                      textScaleFactor: 1.2,),
                  ),),



                SizedBox(height: 10,),
                Text('Custom Card',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Card(
                  borderOnForeground: true,
                  shadowColor: Colors.grey,
                  color:Color(0xff5050D5),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(Icons.access_time_outlined,size: 60,color: Colors.white,),
                        Text('Digital Watch',style: TextStyle(color: Colors.white),
                          textScaleFactor: 1.4,),
                      ],
                    ),
                  ),),

                SizedBox(height: 10,),
                Text('Custom Design Card',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: Text('Restaurant',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        subtitle: Text('Dhaka,Bangladesh'),
                        leading: Icon(
                          Icons.restaurant_menu,
                          color:Color(0xff5050D5),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('0123456789',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        leading: Icon(
                          Icons.contact_phone,
                          color:Color(0xff5050D5),
                        ),
                      ),
                      ListTile(
                        title: Text('demo@example.com'),
                        leading: Icon(
                          Icons.contact_mail,
                          color:Color(0xff5050D5),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10,),
                Text('Custom Design with Image Card',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 8,
                            offset: Offset(0,3)
                        )
                      ]
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                            child: FadeInImage.assetNetwork(
                                placeholder: MainAppImages.place_holder,
                                image: MainAppImages.motion_one,fit: BoxFit.cover)
                          ),

                          Positioned(
                            top:180,
                            left: 20,
                            child: Text(
                              'Top 10 Australian Beach',
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Number 10'),
                            Text('Whitehaven Beach'),
                            Text('Whitsunday island, Whitsunday islands'),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: (){},
                            child: Text('SHARE',style: TextStyle(color: Colors.lightBlueAccent),),
                          ),
                          TextButton(
                            onPressed: (){},
                            child: Text('EXPLORE',style: TextStyle(color: Colors.lightBlueAccent),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
