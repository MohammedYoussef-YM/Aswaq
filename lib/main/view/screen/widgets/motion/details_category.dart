import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/custom_theme.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';
import 'package:flutter_ui_kit/main/utils/strings.dart';

class DetailsCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Details Page'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  color: Color(0xff5050D5),
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                ),
                Column(
                  children: [
                    Container(
                      width: 80.0,
                      height: 80.0,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(45.0),
                          child: FadeInImage.assetNetwork(
                              placeholder: MainAppImages.place_holder,
                              image: MainAppImages.motion_three,fit: BoxFit.cover)
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      '6am UI Kit',
                      style: TextStyle( color: Colors.white, fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Positioned(
                  bottom: -70,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(3, 3))
                        ]),
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'POSTS',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff0916A0)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '225K',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff2D63C2)),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'FOLLOWERS',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff0916A0)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '54.25K',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff2D63C2)),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'FOLLOWING',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff0916A0)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '78.75K',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff2D63C2)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.all(20),
              height: 230,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'bio : ',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text( Strings.CLIPRREACT,overflow: TextOverflow.ellipsis,maxLines: 6,
                        style: poppinsRegular.copyWith(fontSize: 16,fontStyle: FontStyle.italic),
                      ),
                    ],
                  )),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                height: 45,
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Color(0xff5050D5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "contact-me",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
