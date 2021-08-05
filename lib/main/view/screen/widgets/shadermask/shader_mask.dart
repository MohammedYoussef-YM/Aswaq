import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';

class ShaderMaskWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ShaderMask"),
      backgroundColor: Color(0xff5050D5),
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                child: Text("Image ShaderMask",style: TextStyle(fontSize: 20),)),
            Container(
              padding: EdgeInsets.all(20),
              child: ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (Rect bound){
                  return LinearGradient(
                      colors: <Color>[Colors.orange,Colors.black87]
                  ).createShader(bound);
                },
                child: Image.asset("assets/logoo.png"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.center,
                child: Text("Text ShaderMask",style: TextStyle(fontSize: 20),)),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (Rect bound){
                  return LinearGradient(
                      colors: <Color>[Colors.orange,Colors.black87]
                  ).createShader(bound);
                },
                child: Text("A widget that applies a mask generated by a Shader to its child."
                    "This is the Example of ShaderMask. You can apply Gradient or Color on a text",style: TextStyle(fontSize: 20),),
              ),
            ),

            SizedBox(height: 50,),
            Text('ShaderMask Image',style: TextStyle(fontSize: 20),),
            SizedBox(height: 20),
            ShaderMask(
                blendMode: BlendMode.color,
                shaderCallback: (rect) => LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.redAccent,
                  Colors.green
                ]

              ).createShader(rect),
              child: FadeInImage.assetNetwork(
                placeholder: MainAppImages.place_holder,
                image: MainAppImages.widget_six,
              )
            )
          ],
        ),
      ),
    );
  }
}