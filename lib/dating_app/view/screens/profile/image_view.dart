import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/dating_app/provider/profile_provider.dart';
import 'package:flutter_ui_kit/dating_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/dating_app/utility/dating_image.dart';
import 'package:flutter_ui_kit/dating_app/utility/dimensions.dart';
import 'package:provider/provider.dart';

class ImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 17, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Consumer<DatingAppProfileProvider>(
        builder: (context, profileProvider, child) => Column(
          children: [
            SizedBox(height: 26),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(right: 20,left: 20),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: FadeInImage.assetNetwork(
                            placeholder: DatingImages.place_holder_dating,
                            image: profileProvider.getAllUserImages[profileProvider.selectIndex],
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,)
                      ),
                      Positioned(
                        left: 10,
                        bottom: 0,
                        right: 10,
                        top: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            profileProvider.selectIndex==0?SizedBox.shrink():
                            InkWell(
                              onTap:(){
                                profileProvider.decrementSelectIndex();
                              },
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Colors.white54,
                                  shape: BoxShape.circle
                                ),
                                child: Icon(Icons.keyboard_arrow_left,color: Colors.black12,),
                              ),
                            ),
                            profileProvider.selectIndex==3?SizedBox.shrink():
                            InkWell(
                              onTap:(){
                                profileProvider.incrementSelectIndex();
                              },
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Colors.white54,
                                  shape: BoxShape.circle
                                ),
                                child: Icon(Icons.keyboard_arrow_right,color: Colors.black12,),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 26),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_LARGE),
                physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: profileProvider.getAllUserImages.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      profileProvider.changeSelectIndex(index);
                    },
                    child: Container(
                        margin: EdgeInsets.only(right: 15),
                        decoration:
                            BoxDecoration(border: Border.all(color: profileProvider.selectIndex==index?
                            ColorResources.COLOR_PRIMARY:Colors.transparent, width: 3), borderRadius: BorderRadius.circular(15)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage.assetNetwork(
                            placeholder: DatingImages.place_holder_dating,
                            image: profileProvider.getAllUserImages[index],
                            width: 140,
                            height: 128,
                            fit: BoxFit.cover,)
                        )),
                  )),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
