import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';


class StandartGridView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(' Standart GridView'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: GridView(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1/1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
          ),
          children: [
            Container(
                alignment: Alignment.center,
                //padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(width: 1,),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(9),topLeft: Radius.circular(8)),
                        child: FadeInImage.assetNetwork(
                          placeholder: MainAppImages.place_holder,
                          image: MainAppImages.widget_three,fit: BoxFit.cover,height: 120,width: double.infinity,)
                    ),
                    SizedBox(height: 10,),
                    Text('GridView Standart',style: TextStyle(color: Color(0xff5050D5),fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                )),
            Container(
                alignment: Alignment.center,
                //padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(width: 1,),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(9),topLeft: Radius.circular(8)),
                        child: FadeInImage.assetNetwork(
                            placeholder: MainAppImages.place_holder,
                            image: MainAppImages.widget_two,fit: BoxFit.cover,height: 120,width: double.infinity)
                    ),
                    SizedBox(height: 10,),
                    Text('GridView Standart',style: TextStyle(color: Color(0xff5050D5),fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                )),
            Container(
                alignment: Alignment.center,
                //padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(width: 1,),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(9),topLeft: Radius.circular(8)),
                        child: FadeInImage.assetNetwork(
                            placeholder: MainAppImages.place_holder,
                            image: MainAppImages.widget_four,fit: BoxFit.cover,height: 120,width: double.infinity)
                    ),
                    SizedBox(height: 10,),
                    Text('GridView Standart',style: TextStyle(color: Color(0xff5050D5),fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                )),
            Container(
                alignment: Alignment.center,
                //padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(width: 1,),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(9),topLeft: Radius.circular(8)),
                        child: FadeInImage.assetNetwork(
                            placeholder: MainAppImages.place_holder,
                            image: MainAppImages.widget_five,fit: BoxFit.cover,height: 120,width: double.infinity)
                    ),
                    SizedBox(height: 10,),
                    Text('GridView Standart',style: TextStyle(color: Color(0xff5050D5),fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                )),
            Container(
                alignment: Alignment.center,
                //padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(width: 1,),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(9),topLeft: Radius.circular(8)),
                        child: FadeInImage.assetNetwork(
                            placeholder: MainAppImages.place_holder,
                            image: MainAppImages.widget_one,fit: BoxFit.cover,height: 120,width: double.infinity)
                    ),
                    SizedBox(height: 10,),
                    Text('GridView Standart',style: TextStyle(color: Color(0xff5050D5),fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                )),
            Container(
                alignment: Alignment.center,
                //padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(width: 1,),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(9),topLeft: Radius.circular(8)),
                        child: FadeInImage.assetNetwork(
                            placeholder: MainAppImages.place_holder,
                            image: MainAppImages.widget_six,fit: BoxFit.cover,height: 120,width: double.infinity)
                    ),
                    SizedBox(height: 10,),
                    Text('GridView Standart',style: TextStyle(color: Color(0xff5050D5),fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                )),
            Container(
                alignment: Alignment.center,
                //padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(width: 1,),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(9),topLeft: Radius.circular(8)),
                        child: FadeInImage.assetNetwork(
                            placeholder: MainAppImages.place_holder,
                            image: MainAppImages.widget_three,fit: BoxFit.cover,height: 120,width: double.infinity)
                    ),
                    SizedBox(height: 10,),
                    Text('GridView Standart',style: TextStyle(color: Color(0xff5050D5),fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                )),
            Container(
                alignment: Alignment.center,
                //padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(width: 1,),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(9),topLeft: Radius.circular(8)),
                        child: FadeInImage.assetNetwork(
                            placeholder: MainAppImages.place_holder,
                            image: MainAppImages.widget_four,fit: BoxFit.cover,height: 120,width: double.infinity)
                    ),
                    SizedBox(height: 10,),
                    Text('GridView Standart',style: TextStyle(color: Color(0xff5050D5),fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                )),
            Container(
                alignment: Alignment.center,
                //padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(width: 1,),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(9),topLeft: Radius.circular(8)),
                        child: FadeInImage.assetNetwork(
                            placeholder: MainAppImages.place_holder,
                            image: MainAppImages.widget_six,fit: BoxFit.fill,height: 120,width: double.infinity)
                    ),
                    SizedBox(height: 10,),
                    Text('GridView Standart',style: TextStyle(color: Color(0xff5050D5),fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                )),
            Container(
                alignment: Alignment.center,
                //padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(width: 1,),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(9),topLeft: Radius.circular(8)),
                        child: FadeInImage.assetNetwork(
                            placeholder: MainAppImages.place_holder,
                            image: MainAppImages.motion_three,fit: BoxFit.fill,height: 120,width: double.infinity)
                    ),
                    SizedBox(height: 10,),
                    Text('GridView Standart',style: TextStyle(color: Color(0xff5050D5),fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                )),

          ],
        ),
      ),
    );
  }
}
