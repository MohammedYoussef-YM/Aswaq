import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/main_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class MainAboutScreen extends StatelessWidget {
  final  _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    String _web = 'https://6amtech.com/';
    String _facebook = 'https://www.facebook.com/';
    String _mail = 'mailto:support@6amtech.com?subject=test%20subject&body=test%20body';
    String _linkedin = 'https://www.linkedin.com/company/6amtech/';

    return Scaffold(
      backgroundColor: Colors.white,
      key: _globalKey,
      appBar: AppBar(
        title: Text('About Us', style: poppinsSemiBold.copyWith(color: Color(0xff000345),fontSize: 16)),
        centerTitle: true, backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.menu),color: Colors.black,
        onPressed: () {
          _globalKey.currentState.openDrawer();
        },),),
      drawer: MainDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
              SvgPicture.asset(
              'assets/main_app/drawer/logosix.svg',
              allowDrawingOutsideViewBox: true,
            ),
                SizedBox(height: 10,),

                Text('6AM Tech', style: poppinsSemiBold.copyWith(color: Color(0xff000345),fontSize: 18),),

                SizedBox(height: 30,),

                Text('Our Services \n - Software Development: We at 6amTech conceptualize, design, develop, test, and deploy software as your demand.\n -UI/UX Design: We believe that everything we do should start with the User, and end with the User.',
                  style: poppinsRegular.copyWith(color: Color(0xff000345),fontSize: 14),),

                SizedBox(height: 50,),
                Container(
                  padding: const EdgeInsets.all(30),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          await canLaunch(_web)
                              ? await launch(_web)
                              : throw 'Could not launch $_web';
                        },
                        child: SvgPicture.asset(
                          'assets/main_app/drawer/websix.svg',
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await canLaunch(_facebook)
                              ? await launch(_facebook)
                              : throw 'Could not launch $_facebook';
                        },
                        child: SvgPicture.asset(
                          'assets/main_app/drawer/facebook.svg',
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await canLaunch(_mail)
                              ? await launch(_mail)
                              : throw 'Could not launch $_mail';
                        },
                        child: SvgPicture.asset(
                          'assets/main_app/drawer/email.svg',
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await canLaunch(_linkedin)
                              ? await launch(_linkedin)
                              : throw 'Could not launch $_linkedin';
                        },
                        child: SvgPicture.asset(
                          'assets/main_app/drawer/linkedinsix.svg',
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
