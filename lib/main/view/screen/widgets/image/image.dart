import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';


class ImageViewWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Image Widget'),
        backgroundColor: Color(0xff5050D5),
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
                Text('Standart Image',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                SizedBox(height: 10,),
                FadeInImage.assetNetwork(
                  placeholder: MainAppImages.place_holder,
                  image: MainAppImages.widget_seven,fit: BoxFit.cover,height: 180,width: 180,),

                SizedBox(height: 20,),
                Text('Image Asset',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                SizedBox(height: 10,),
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FadeInImage.assetNetwork(
                      placeholder: MainAppImages.place_holder,
                      image: MainAppImages.widget_eight,fit: BoxFit.cover,height: 220,width: 250,)
                ),

                SizedBox(height: 20,),
                Text('Asset Image',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                SizedBox(height: 10,),
                Container(
                  width: 200.0,
                  height: 200.0,
                  padding: EdgeInsets.all(10),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: FadeInImage.assetNetwork(
                          placeholder: MainAppImages.place_holder,
                          image: MainAppImages.widget_nine,fit: BoxFit.cover)
                  ),
                ),
                SizedBox(height: 20,),
                Text('Image Network',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                SizedBox(height: 10,),
                Image.network(MainAppImages.widget_ten)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
