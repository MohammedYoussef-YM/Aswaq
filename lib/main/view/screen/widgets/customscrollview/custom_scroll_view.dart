import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';

import '../../../../../all_app_screen.dart';
class CustomScrollViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [

            // for AppBar
            SliverAppBar(
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                title:  Text('Custom Sliver AppBar',style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
              floating: true,
              elevation: 0,
              centerTitle: false,
              automaticallyImplyLeading: false,
              backgroundColor: Color(0xff5050D5),
              title:  Container(
                width: 50.0,
                height: 50.0,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: FadeInImage.assetNetwork(
                        placeholder: MainAppImages.place_holder,
                        image: MainAppImages.widget_three,fit: BoxFit.cover)
                ),
              ),
              actions: [IconButton(
                onPressed: (){},
                icon: Stack(clipBehavior: Clip.none, children: [
                  Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                  Positioned(
                    top: -4,
                    right: -4,
                    child: CircleAvatar(
                      radius: 7,
                      backgroundColor: Colors.red,
                      child: Text('1'
                      )),
                  ),
                ]),
              )],
            ),

            //for Container
            SliverToBoxAdapter(
              child:  Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 130,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xff5050D5),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [ BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 1)),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: FadeInImage.assetNetwork(
                                placeholder: MainAppImages.place_holder,
                                image: MainAppImages.widget_three,fit: BoxFit.cover)
                        ),
                      ),

                      SizedBox(width: 15),
                      Text("Sliver BoxTo Adapter with Image", style: TextStyle(color: Colors.white,fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ),

            //for  fixed Header
            SliverPersistentHeader(pinned: true, delegate: SliverDelegate(
              child:  Container(
                height: 60,
                padding: EdgeInsets.all(8),
                color: Color(0xffFFFFFF),
                alignment: Alignment.center,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 12,right: 10),
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
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
                            'SliverPersistentHeader' )),
                      Container(
                        margin: EdgeInsets.only(left: 12,right: 10),
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
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
                            'SliverPersistentHeader' )),
                      Container(
                        margin: EdgeInsets.only(left: 12,right: 10),
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
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
                            'SliverPersistentHeader' )),
                    ]
                ),
              ),
            ),),

            //for GridView
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4/4,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Color(0xff5050D5),
                    child: Text('Sliver GridView $index',style: TextStyle(color: Colors.white)),
                  );
                },
                childCount: 10,
              ),
            ),

            //for Padding
            SliverPadding(padding: EdgeInsets.symmetric(vertical: 5)),

            //for ListView
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100*(index % 10)],
                    child: Text('Sliver ListView $index',style: TextStyle( color: Colors.black)));
                },
                childCount: 10,
              ),
            ),

            //for animation Box
            SliverFillRemaining(
              child:   Container(
                width: 100.0,
                height: 100.0,
                child: FadeInImage.assetNetwork(
                    placeholder: MainAppImages.place_holder,
                    image: MainAppImages.widget_two,fit: BoxFit.cover),
              ),
            ),
            // for Sticky Header
            SliverStickyHeader.builder(
              builder: (context, state) => Container(
                height: 60.0,
                color: (state.isPinned ? Colors.pink :  Color(0xff5050D5)).withOpacity(1.0 - state.scrollPercentage),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Text('SliverStickyHeader', style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                ),
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, i) => ListTile(
                        leading: CircleAvatar(
                          child: Text('0'),
                        ),
                        title: Text('List tile #$i'),
                      ),
                  childCount: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
