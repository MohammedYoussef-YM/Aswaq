import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_kit/main/utils/custom_theme.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';

class CustomHeaderDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Custom Header Drawer'),
        backgroundColor: Color(0xff5050D5),
      ),
      drawer: SingleChildScrollView(
        child: Container(
            width: 317,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child:Column(children: [
              Container(
                height: 267,
                color: Color(0xff5050D5),
                child: Center(child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 80.0,
                      height: 80.0,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: FadeInImage.assetNetwork(
                              placeholder: MainAppImages.place_holder,
                              image: MainAppImages.logo_six,fit: BoxFit.cover)
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("6am UI Kit", style: poppinsBold.copyWith(color: Color(0xffFCFCFC),fontSize: 18)),
                    SizedBox(height: 6),
                    Text("The Biggest Flutter UI Kit", style: poppinsMedium.copyWith(color: Color(0xffFCFCFC),fontSize: 12)),
                  ],
                ),),
              ),
              SizedBox(height: 70,),

              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Row(children: [
                  SvgPicture.asset(
                    'assets/home_icon.svg',
                    allowDrawingOutsideViewBox: true,
                  ),
                  SizedBox(width: 10,),
                  Text('Home', style: poppinsMedium.copyWith(color: Color(0xff000345),fontSize: 14),),
                ],),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Row(children: [
                  SvgPicture.asset(
                    'assets/our_service.svg',
                    allowDrawingOutsideViewBox: true,
                  ),
                  SizedBox(width: 10,),
                  Text('Our Products', style: poppinsMedium.copyWith(color: Color(0xff000345),fontSize: 14),),
                ],),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Row(children: [
                  SvgPicture.asset(
                    'assets/about.svg',
                    allowDrawingOutsideViewBox: true,
                  ),
                  SizedBox(width: 10,),
                  Text('About Us', style: poppinsMedium.copyWith(color: Color(0xff000345),fontSize: 14),),
                ],),
              ),
            ],)
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Custom Header Drawer'),
        ),
      ),
    );
  }
}
