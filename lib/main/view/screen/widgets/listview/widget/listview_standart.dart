import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/main/utils/images.dart';


class StandartListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(' Standart ListView'),
        backgroundColor: Color(0xff5050D5),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(12),
          children: [
            Row(
              children: [
                Expanded( flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height*0.14,
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: FadeInImage.assetNetwork(
                          placeholder: MainAppImages.place_holder,
                          image: MainAppImages.widget_five,height: 200,width: 200,),
                    )
                  ),
                ),
                Expanded( flex:2,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.14,
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('6am Tech Day Meeting', style: TextStyle(fontSize: 16,color: Color(0xff660FC2)),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('2:00pm - 2:15pm', style: TextStyle(fontSize: 12,color: Color(0xff660FC2)),),
                            Text('10:30pm - 11:00pm', style: TextStyle(fontSize: 12,color: Color(0xff660FC2)),),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded( flex: 1,
                  child: Container(
                      margin: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height*0.14,
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FadeInImage.assetNetwork(
                          placeholder: MainAppImages.place_holder,
                          image: MainAppImages.widget_five,height: 200,width: 200,),
                      )
                  ),
                ),
                Expanded( flex:2,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.14,
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('6am Tech Day Meeting', style: TextStyle(fontSize: 16,color: Color(0xff660FC2)),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('2:00pm - 2:15pm', style: TextStyle(fontSize: 12,color: Color(0xff660FC2)),),
                            Text('10:30pm - 11:00pm', style: TextStyle(fontSize: 12,color: Color(0xff660FC2)),),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded( flex: 1,
                  child: Container(
                      margin: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height*0.14,
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FadeInImage.assetNetwork(
                          placeholder: MainAppImages.place_holder,
                          image: MainAppImages.widget_five,height: 200,width: 200,),
                      )
                  ),
                ),
                Expanded( flex:2,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.14,
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('6am Tech Day Meeting', style: TextStyle(fontSize: 16,color: Color(0xff660FC2)),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('2:00pm - 2:15pm', style: TextStyle(fontSize: 12,color: Color(0xff660FC2)),),
                            Text('10:30pm - 11:00pm', style: TextStyle(fontSize: 12,color: Color(0xff660FC2)),),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded( flex: 1,
                  child: Container(
                      margin: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height*0.14,
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FadeInImage.assetNetwork(
                          placeholder: MainAppImages.place_holder,
                          image: MainAppImages.widget_five,height: 200,width: 200,),
                      )
                  ),
                ),
                Expanded( flex:2,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.14,
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('6am Tech Day Meeting', style: TextStyle(fontSize: 16,color: Color(0xff660FC2)),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('2:00pm - 2:15pm', style: TextStyle(fontSize: 12,color: Color(0xff660FC2)),),
                            Text('10:30pm - 11:00pm', style: TextStyle(fontSize: 12,color: Color(0xff660FC2)),),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded( flex: 1,
                  child: Container(
                      margin: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height*0.14,
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FadeInImage.assetNetwork(
                          placeholder: MainAppImages.place_holder,
                          image: MainAppImages.widget_five,height: 200,width: 200,),
                      )
                  ),
                ),
                Expanded( flex:2,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.14,
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('6am Tech Day Meeting', style: TextStyle(fontSize: 16,color: Color(0xff660FC2)),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('2:00pm - 2:15pm', style: TextStyle(fontSize: 12,color: Color(0xff660FC2)),),
                            Text('10:30pm - 11:00pm', style: TextStyle(fontSize: 12,color: Color(0xff660FC2)),),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded( flex: 1,
                  child: Container(
                      margin: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height*0.14,
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FadeInImage.assetNetwork(
                          placeholder: MainAppImages.place_holder,
                          image: MainAppImages.widget_five,height: 200,width: 200,),
                      )
                  ),
                ),
                Expanded( flex:2,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.14,
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('6am Tech Day Meeting', style: TextStyle(fontSize: 16,color: Color(0xff660FC2)),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('2:00pm - 2:15pm', style: TextStyle(fontSize: 12,color: Color(0xff660FC2)),),
                            Text('10:30pm - 11:00pm', style: TextStyle(fontSize: 12,color: Color(0xff660FC2)),),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded( flex: 1,
                  child: Container(
                      margin: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height*0.14,
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FadeInImage.assetNetwork(
                          placeholder: MainAppImages.place_holder,
                          image: MainAppImages.widget_five,height: 200,width: 200,),
                      )
                  ),
                ),
                Expanded( flex:2,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.14,
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('6am Tech Day Meeting', style: TextStyle(fontSize: 16,color: Color(0xff660FC2)),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('2:00pm - 2:15pm', style: TextStyle(fontSize: 12,color: Color(0xff660FC2)),),
                            Text('10:30pm - 11:00pm', style: TextStyle(fontSize: 12,color: Color(0xff660FC2)),),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded( flex: 1,
                  child: Container(
                      margin: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height*0.14,
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FadeInImage.assetNetwork(
                          placeholder: MainAppImages.place_holder,
                          image: MainAppImages.widget_five,height: 200,width: 200,),
                      )
                  ),
                ),
                Expanded( flex:2,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.14,
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('6am Tech Day Meeting', style: TextStyle(fontSize: 16,color: Color(0xff660FC2)),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('2:00pm - 2:15pm', style: TextStyle(fontSize: 12,color: Color(0xff660FC2)),),
                            Text('10:30pm - 11:00pm', style: TextStyle(fontSize: 12,color: Color(0xff660FC2)),),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded( flex: 1,
                  child: Container(
                      margin: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height*0.14,
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FadeInImage.assetNetwork(
                          placeholder: MainAppImages.place_holder,
                          image: MainAppImages.widget_five,height: 200,width: 200,),
                      )
                  ),
                ),
                Expanded( flex:2,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.14,
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('6am Tech Day Meeting', style: TextStyle(fontSize: 16,color: Color(0xff660FC2)),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('2:00pm - 2:15pm', style: TextStyle(fontSize: 12,color: Color(0xff660FC2)),),
                            Text('10:30pm - 11:00pm', style: TextStyle(fontSize: 12,color: Color(0xff660FC2)),),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded( flex: 1,
                  child: Container(
                      margin: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height*0.14,
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FadeInImage.assetNetwork(
                          placeholder: MainAppImages.place_holder,
                          image: MainAppImages.widget_five,height: 200,width: 200,),
                      )
                  ),
                ),
                Expanded( flex:2,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.14,
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('6am Tech Day Meeting', style: TextStyle(fontSize: 16,color: Color(0xff660FC2)),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('2:00pm - 2:15pm', style: TextStyle(fontSize: 12,color: Color(0xff660FC2)),),
                            Text('10:30pm - 11:00pm', style: TextStyle(fontSize: 12,color: Color(0xff660FC2)),),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
