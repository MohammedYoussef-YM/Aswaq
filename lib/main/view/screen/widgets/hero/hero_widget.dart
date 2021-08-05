import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';
import 'package:flutter_ui_kit/main/view/screen/widgets/hero/widget/details_page.dart';


class HeroWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Hero Widget'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20,top: 30,right: 10,bottom: 20),
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Text('Hero Widget',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(height: 10,),
              Row(
                children: [

                  Expanded(child: Text('Hero Widget used to create animation when you move to another page')),
                  SizedBox(width: 5,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child:  Hero(
                      tag: 'Add',
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: FadeInImage.assetNetwork(
                                placeholder: MainAppImages.place_holder,
                                image: MainAppImages.widget_two,fit: BoxFit.cover)
                        ),
                      ),
                    ),
                  ),

                ],
              ),



              //for Button
              SizedBox(height: 30,),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  boxShadow: [BoxShadow(color: Colors.grey[300], spreadRadius: .5, blurRadius: 5)],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: InkWell( onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>HeroDetails())),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Click  here'),
                        Icon(Icons.arrow_forward)
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
