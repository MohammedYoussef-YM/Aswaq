import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_kit/all_app_screen.dart';
import 'package:flutter_ui_kit/main/utils/custom_theme.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';
import 'package:flutter_ui_kit/main/view/screen/about/about_us_screen.dart';
import 'package:url_launcher/url_launcher.dart';



class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _url='https://codecanyon.net/user/sixamtech/portfolio';
    return Container(
      width: 317,
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
                    borderRadius: BorderRadius.circular(40.0),
                    child: Image.asset(MainAppImages.logo,fit: BoxFit.cover)
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
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AllAppScreen()));
            },
            child: Row(children: [
              SvgPicture.asset(
              'assets/main_app/drawer/home_icon.svg',
              allowDrawingOutsideViewBox: true,
            ),
              SizedBox(width: 10,),
              Text('Home', style: poppinsMedium.copyWith(color: Color(0xff000345),fontSize: 14),),
            ],),
          ),
        ),
        SizedBox(height: 25,),
        Padding(
          padding: const EdgeInsets.only(left:12.0),
          child: InkWell(
            onTap: () async {
              await canLaunch(_url)
                  ? await launch(_url)
                  : throw 'Could not launch $_url';
            },
            child: Row(children: [
              SvgPicture.asset(
              'assets/main_app/drawer/our_service.svg',
              allowDrawingOutsideViewBox: true,
            ),
              SizedBox(width: 10,),
              Text('Our Products', style: poppinsMedium.copyWith(color: Color(0xff000345),fontSize: 14),),
            ],),
          ),
        ),
        SizedBox(height: 25,),
        Padding(
          padding: const EdgeInsets.only(left:12.0),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => MainAboutScreen()));
            },
            child: Row(children: [
              SvgPicture.asset(
                'assets/main_app/drawer/about.svg',
                allowDrawingOutsideViewBox: true,
              ),
              SizedBox(width: 10,),
              Text('About Us', style: poppinsMedium.copyWith(color: Color(0xff000345),fontSize: 14),),
            ],),
          ),
        ),
      ],)
    );
  }
}
