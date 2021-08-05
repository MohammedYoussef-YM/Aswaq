import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';


class ClipRReactWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          title: Text('ClipRReact'),
          backgroundColor: Color(0xff5050D5)
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ClipRReact Apply On Image'),
              SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    height: 200,
                    width: 200,
                  child: FadeInImage.assetNetwork(
                      placeholder: MainAppImages.place_holder,
                      image: MainAppImages.widget_four,fit: BoxFit.cover)
                ),
              ),

              SizedBox(height: 10,),
              Text('ClipRReact Apply On Container'),
              SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    height: 200,
                    width: 200,
                    color: Color(0xff5050D5),
                  child: FadeInImage.assetNetwork(
                      placeholder: MainAppImages.place_holder,
                      image: MainAppImages.widget_five,fit: BoxFit.cover),
                ),
              ),


              SizedBox(height: 10,),
              Text('ClipRReact Apply On topLeft of Container'),
              SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                child: Container(
                  height: 200,
                  width: 200,
                  color: Color(0xff5050D5),
                  child: FadeInImage.assetNetwork(
                      placeholder: MainAppImages.place_holder,
                      image: MainAppImages.widget_six,fit: BoxFit.cover),
                ),
              ),

              SizedBox(height: 10,),
              Text('ClipRReact Apply On topRight of Container'),
              SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
                child: Container(
                  height: 200,
                  width: 200,
                  color: Color(0xff5050D5),
                  child: FadeInImage.assetNetwork(
                      placeholder: MainAppImages.place_holder,
                      image: MainAppImages.widget_five,fit: BoxFit.cover),
                ),
              ),

              SizedBox(height: 10,),
              Text('ClipRReact Apply On bottomLeft of Container'),
              SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
                child: Container(
                  height: 200,
                  width: 200,
                  color: Color(0xff5050D5),
                  child: FadeInImage.assetNetwork(
                      placeholder: MainAppImages.place_holder,
                      image: MainAppImages.widget_four,fit: BoxFit.cover),
                ),
              ),

              SizedBox(height: 10,),
              Text('ClipRReact Apply On bottomRight of Container'),
              SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
                child: Container(
                  height: 200,
                  width: 200,
                  color: Color(0xff5050D5),
                  child: FadeInImage.assetNetwork(
                      placeholder: MainAppImages.place_holder,
                      image: MainAppImages.motion_one,fit: BoxFit.cover),
                ),
              ),

              SizedBox(height: 10,),
              Text('ClipRReact Apply On topLeft and topRight of Container'),
              SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20) ),
                child: Container(
                  height: 200,
                  width: 200,
                  color: Color(0xff5050D5),
                  child: FadeInImage.assetNetwork(
                      placeholder: MainAppImages.place_holder,
                      image: MainAppImages.widget_three,fit: BoxFit.cover),
                ),
              ),

              SizedBox(height: 10,),
              Text('ClipRReact Apply On bottomLeft and bottomRight of Container'),
              SizedBox(height: 10,),
              ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight:Radius.circular(20) ),
                child: Container(
                  height: 200,
                  width: 200,
                  color: Color(0xff5050D5),
                  child: FadeInImage.assetNetwork(
                      placeholder: MainAppImages.place_holder,
                      image: MainAppImages.widget_five,fit: BoxFit.cover),
                ),
              ),
            ],),
        ),
      ),
    );
  }
}
