import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/app.dart';
import 'package:flutter_ui_kit/main/main_provider.dart';
import 'package:flutter_ui_kit/main/utils/custom_theme.dart';
import 'package:provider/provider.dart';

class AppButton extends StatelessWidget {
  final String title;
  final String description;
  final int screens;
  final Color color;
  final Widget widget;
  final App app;
  final String icons;
  final String version;
  final bool isHome;

  AppButton({
    @required this.title,
    @required this.description,
    @required this.screens,
    @required this.color,
    @required this.widget,
    @required this.app,
    @required this.icons,
    @required this.version,
    this.isHome=true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<MainProvider>(context, listen: false).setThemeAndLocale(app, context);
        Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
      },
      child: Stack(clipBehavior: Clip.none,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              boxShadow: [BoxShadow(color: Colors.grey[300], spreadRadius: .5, blurRadius: 5)],
              borderRadius: BorderRadius.circular(6),
            ),
            child:  Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Image.asset(icons,height: 50,width: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:12.0),
                  child: Text(title,textAlign: TextAlign.center, style: poppinsMedium.copyWith(color: color,fontSize: 14)),
                ),
                SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                  child: Text(description, style: robotoRegular.copyWith(color: Color(0xff000345),fontSize: 12), textAlign: TextAlign.center),
                ),
                SizedBox(height: 15),
                Container(
                  //padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                  ),
                  child: Text('$screens screens', style: robotoMedium.copyWith(color: Color(0xff5050D5),fontSize: 14)),
                ),
              ]),
            ),
          ),
         isHome ? Positioned(top: 0,right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomLeft: Radius.circular(8))),
                  child: Text('new',style: poppinsMedium.copyWith(color: Color(0xffFFFFFF),fontSize: 12),),
                )): SizedBox(),
        ],
      ),
    );
  }
}