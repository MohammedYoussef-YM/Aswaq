import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/main_provider.dart';
import 'package:flutter_ui_kit/main/utils/custom_theme.dart';
import 'package:flutter_ui_kit/grocery/provider/choose_category_provider.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';
import 'package:flutter_ui_kit/main/widget/all_screen.dart';
import 'package:flutter_ui_kit/main/widget/all_widgets.dart';
import 'package:flutter_ui_kit/main/widget/full_app.dart';
import 'package:flutter_ui_kit/main/widget/home_screen.dart';
import 'package:flutter_ui_kit/main_drawer.dart';
import 'package:flutter_ui_kit/sixvalley/provider/splash_provider.dart';
import 'package:provider/provider.dart';
import 'grocery/provider/home_provider.dart';

class AllAppScreen extends StatelessWidget {

  final  _globalKey = GlobalKey<ScaffoldState>();
  final List<Widget> _screen=[MainHomeScreen(),FullAppScreen(),AllScreen(),AllWidgets()];
  @override
  Widget build(BuildContext context) {
    Provider.of<GroceryHomeProvider>(context, listen: false).initializeBannerList();
    Provider.of<GroceryHomeProvider>(context, listen: false).initializeCategoryList();
    Provider.of<GroceryHomeProvider>(context, listen: false).initializeLikeProducts();
    Provider.of<GroceryHomeProvider>(context, listen: false).initializePopularProducts();
    Provider.of<ChooseCategoryProvider>(context, listen: false).initializeChooseCateoryList();
    Provider.of<SixSplashProvider>(context, listen: false).initConfig();

    return Scaffold(
      backgroundColor: Colors.white,
      key: _globalKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text('6am UI kit',style: poppinsMedium.copyWith(color: Color(0xff5050D5),fontSize: 16),),
        leading: IconButton(icon: Icon(Icons.menu),color: Colors.black,
          onPressed: () {
            _globalKey.currentState.openDrawer();
          },
        ),
      ),
      drawer: MainDrawer(),
      body: CustomScrollView(
        slivers: [

          //for card
          SliverToBoxAdapter(
            child:  Stack( clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 130,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xff5050D5),
                        boxShadow: [ BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 1)),
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: Image.asset( MainAppImages.logo,fit: BoxFit.cover),
                      ),
                    ),
                        SizedBox(width: 15),
                        Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("6am UI Kit", style: poppinsBold.copyWith(color: Color(0xffFCFCFC),fontSize: 18)),
                            SizedBox(height: 8),
                            Text("The Biggest Flutter UI Kit", style: poppinsBold.copyWith(color: Color(0xffFCFCFC),fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(top: 12,right: 12,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomLeft: Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(0, 1),),
                        ],
                      ),
                    child: Text('v 6.0', style: poppinsMedium.copyWith(color: Color(0xffFCFCFC),fontSize: 14),),
                  ),
                ),
              ],
            ),
          ),

          //for button
          SliverPersistentHeader(pinned: true, delegate: SliverDelegate(
            child:  Container(
              height: 60,
              padding: EdgeInsets.all(8),
              color: Color(0xffFFFFFF),
              alignment: Alignment.center,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: (){
                        Provider.of<MainProvider>(context,listen: false).setIndex(0);
                        },
                      child: Container(
                        margin: EdgeInsets.only(left: 12,right: 10),
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Provider.of<MainProvider>(context).appIndex==0 ? Color(0xff5050D5):Color(0xffECECEC),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                            color: Color(0xffECECEC),
                            spreadRadius: .2,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Text(
                            'Home', style: poppinsMedium.copyWith(color: Provider.of<MainProvider>(context).appIndex==0 ? Color(0xffFCFCFC):Color(0xff566265),fontSize: 12)),
                      ),
                    ),

                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        Provider.of<MainProvider>(context,listen: false).setIndex(1);
                        },
                      child: Stack(clipBehavior: Clip.none,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Provider.of<MainProvider>(context).appIndex==1 ? Color(0xff5050D5):Color(0xffECECEC),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffECECEC),
                                  spreadRadius: .2,
                                  blurRadius: 1,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Text(
                                'Full App', style: poppinsMedium.copyWith( color: Provider.of<MainProvider>(context).appIndex==1 ? Color(0xffFCFCFC):Color(0xff566265),fontSize: 12)),
                          ),
                          Positioned( top: -2, right: 5,
                            child: CircleAvatar(radius: 7,
                              backgroundColor: Provider.of<MainProvider>(context).appIndex==1 ? Color(0xffE74459):Color(0xff566265),
                              child: Text('12',style: TextStyle(color: Color(0xffFCFCFC,),fontSize: 8),),),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        Provider.of<MainProvider>(context,listen: false).setIndex(2);
                      },
                      child: Stack(clipBehavior: Clip.none,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Provider.of<MainProvider>(context).appIndex==2 ? Color(0xff5050D5):Color(0xffECECEC),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffECECEC),
                                  spreadRadius: .2,
                                  blurRadius: 1,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Text(
                                'Screens', style: poppinsMedium.copyWith( color: Provider.of<MainProvider>(context).appIndex==2 ? Color(0xffFCFCFC):Color(0xff566265),fontSize: 12)),
                          ),
                          Positioned( top: -2, right: 5,
                            child: CircleAvatar(radius: 8,
                              backgroundColor: Provider.of<MainProvider>(context).appIndex==2 ? Color(0xffE74459):Color(0xff566265),
                              child: Text('99+',style: TextStyle(color: Color(0xffFCFCFC,),fontSize: 8),),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        Provider.of<MainProvider>(context,listen: false).setIndex(3);
                      },
                      child: Stack(clipBehavior: Clip.none,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Provider.of<MainProvider>(context).appIndex==3 ? Color(0xff5050D5):Color(0xffECECEC),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffECECEC),
                                  spreadRadius: .2,
                                  blurRadius: 1,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Text(
                                'Widgets', style: poppinsMedium.copyWith( color: Provider.of<MainProvider>(context).appIndex==3 ? Color(0xffFCFCFC):Color(0xff566265),fontSize: 12)),
                          ),
                          Positioned( top: -2, right: 5,
                            child: CircleAvatar(radius: 7,
                              backgroundColor: Provider.of<MainProvider>(context).appIndex==3 ? Color(0xffE74459):Color(0xff566265),
                              child: Text('48',style: TextStyle(color: Color(0xffFCFCFC,),fontSize: 8),),),
                          ),
                        ],
                      ),
                    ),
                  ]
              ),
            ),
          ),),

          //for padding
          SliverPadding(padding: EdgeInsets.symmetric(vertical: 5)),

          //for home page
          SliverToBoxAdapter(
            child: _screen[Provider.of<MainProvider>(context).appIndex],
          )
        ],
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {

  Widget child;
  SliverDelegate({@required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 50 || oldDelegate.minExtent != 50 || child != oldDelegate.child;
  }

}
