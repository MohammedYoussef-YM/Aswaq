import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';


class HeroDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Hero Widget'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 10,top: 30,right: 10,bottom: 20),
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Text('Hero Widget',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(height: 10,),
              Text('Hero Widget used to create animation when you move to another page'),
              SizedBox(height: 10,),
              Text('Example',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 50,),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Hero(
                    tag: 'Add',
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: FadeInImage.assetNetwork(
                            placeholder: MainAppImages.place_holder,
                            image: MainAppImages.widget_three,fit: BoxFit.cover)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
