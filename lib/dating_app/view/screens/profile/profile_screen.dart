import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/dating_app/provider/profile_provider.dart';
import 'package:flutter_ui_kit/dating_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/dating_app/utility/dating_image.dart';
import 'package:flutter_ui_kit/dating_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/strings.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/notification/notification_screen.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/profile/image_view.dart';
import 'package:provider/provider.dart';

class DatingProfileScreen extends StatelessWidget {
  final double _crossAxisSpacing = 15, _mainAxisSpacing = 15, _aspectRatio = 0.8;
  final int _crossAxisCount = 2;
  final List<String> _images = [
    DatingImages.person_one,  DatingImages.person_two,
    DatingImages.person_three,  DatingImages.person_four, ''
  ];

  @override
  Widget build(BuildContext context) {
    Provider.of<DatingAppProfileProvider>(context,listen: false).initializeAllProfileImage();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 70,
              color: ColorResources.COLOR_WHITE,
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.my_profile,
                    style: robotoBold.copyWith(fontSize: 22),
                  ),
                  IconButton(
                      icon: Icon(Icons.notifications),
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => NotificationScreen()));
                      }),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Dimensions.PADDING_SIZE_DEFAULT),
                      bottomRight: Radius.circular(Dimensions.PADDING_SIZE_DEFAULT),
                    ),
                    child: FadeInImage.assetNetwork(
                      placeholder: DatingImages.place_holder_dating,
                      image: DatingImages.person_five,
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,)
                  ),
                  ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 2.5),
                      Column(
                        children: [
                          Container(
                            height: 255,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
                            margin: EdgeInsets.only(
                              left: Dimensions.PADDING_SIZE_LARGE,
                              right: Dimensions.PADDING_SIZE_LARGE,
                              bottom: Dimensions.PADDING_SIZE_LARGE,
                            ),
                            decoration: BoxDecoration(
                              color: ColorResources.COLOR_WHITE,
                              borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: Offset(0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('${Strings.mehedi_hasan}', style: robotoMedium),
                                    Text(Strings.yr, style: robotoRegular.copyWith(fontSize: 9))
                                  ],
                                ),
                                SizedBox(
                                  height: 04,
                                ),
                                Center(
                                  child: Text(
                                    Strings.dhaka_bangladesh,
                                    style: robotoLight.copyWith(fontSize: Dimensions.PADDING_SIZE_SMALL),
                                  ),
                                ),
                                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                                _userInfoWidget('assets/dating_app/icon/bulb.png', Strings.open_minded),
                                _userInfoWidget('assets/dating_app/icon/bookmark.png', Strings.travel_lover),
                                _userInfoWidget('assets/dating_app/icon/map.png', Strings.beaches_mountains_cafe),
                                _userInfoWidget('assets/dating_app/icon/food.png', Strings.steaks_bbq_hotdogs),
                              ],
                            ),
                          ),
                          Container(
                            color: ColorResources.COLOR_WHITE,
                            child: Column(
                              children: [
                                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                                Container(
                                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
                                  margin: EdgeInsets.only(
                                    left: Dimensions.PADDING_SIZE_LARGE,
                                    right: Dimensions.PADDING_SIZE_LARGE,
                                    bottom: Dimensions.PADDING_SIZE_LARGE,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorResources.COLOR_WHITE,
                                    borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 7,
                                        offset: Offset(0, 1), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Text(Strings.photos, style: robotoMedium),
                                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                                      GridView.builder(
                                          shrinkWrap: true,
                                          // 1st add
                                          physics: BouncingScrollPhysics(),
                                          // 2nd add
                                          itemCount: 4,
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: _crossAxisCount,
                                            crossAxisSpacing: _crossAxisSpacing,
                                            mainAxisSpacing: _mainAxisSpacing,
                                            childAspectRatio: _aspectRatio,
                                          ),
                                          itemBuilder: (context, index) => InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ImageView()));
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child:  FadeInImage.assetNetwork(
                                                placeholder: DatingImages.place_holder_dating,
                                                image: _images[index], fit: BoxFit.cover)
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _userInfoWidget(String imageUrl, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        children: [
         Image.asset(imageUrl, width: 13, height: 13, fit: BoxFit.cover),
          SizedBox(width: Dimensions.PADDING_SIZE_DEFAULT),
          Text(
            title,
            style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
          ),
        ],
      ),
    );
  }
}
