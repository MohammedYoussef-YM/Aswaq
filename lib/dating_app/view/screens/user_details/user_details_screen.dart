import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/dating_app/data/models/user_model.dart';
import 'package:flutter_ui_kit/dating_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/dating_app/utility/dating_image.dart';
import 'package:flutter_ui_kit/dating_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/strings.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/chat/chat_details_screen.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/user_details/full_screen_image_widget.dart';

// ignore: must_be_immutable
class UserDetailsScreen extends StatelessWidget {
  final UserModel userModel;

  UserDetailsScreen({this.userModel});

  double _crossAxisSpacing = 15, _mainAxisSpacing = 15, _aspectRatio = 0.8;
  int _crossAxisCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Dimensions.PADDING_SIZE_DEFAULT),
                bottomRight: Radius.circular(Dimensions.PADDING_SIZE_DEFAULT),
              ),
              child: FadeInImage.assetNetwork(
                  placeholder: DatingImages.place_holder_dating, image:  userModel.imageUrl,
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,),
            ),
            Positioned(
                top: 30,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(Icons.keyboard_arrow_left, color: ColorResources.COLOR_WHITE),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    IconButton(icon: Icon(Icons.more_vert, color: ColorResources.COLOR_WHITE), onPressed: () {}),
                  ],
                )),
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
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                              top: -35,
                              right: MediaQuery.of(context).size.width / 4,
                              child: Container(
                                width: 128,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: ColorResources.COLOR_DARK_ORANGE, borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/dating_app/icon/heart.png',
                                      color: ColorResources.COLOR_WHITE,
                                      width: 18,
                                      height: 18,
                                    ),
                                    SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                    Text(
                                      userModel.match,
                                      style: robotoMedium.copyWith(color: ColorResources.COLOR_WHITE),
                                    ),
                                  ],
                                ),
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('${userModel.firstName} ${userModel.lastName}, ${userModel.age} ', style: robotoMedium),
                                  Text(Strings.yr, style: robotoRegular.copyWith(fontSize: 9))
                                ],
                              ),
                              SizedBox(
                                height: 04,
                              ),
                              Center(
                                child: Text(
                                  userModel.address,
                                  style: robotoLight.copyWith(fontSize: Dimensions.PADDING_SIZE_SMALL),
                                ),
                              ),
                              SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                              _userInfoWidget('assets/dating_app/icon/bulb.png', userModel.condition),
                              _userInfoWidget('assets/dating_app/icon/bookmark.png', userModel.interested),
                              _userInfoWidget('assets/dating_app/icon/map.png', userModel.hobby),
                              _userInfoWidget('assets/dating_app/icon/food.png', userModel.favouriteFoods),
                              _userInfoWidget('assets/dating_app/icon/status.png', '${Strings.last_seen} ${userModel.lastSeen}'),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: ColorResources.COLOR_WHITE,
                      child: Column(
                        children: [
                          SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/dating_app/icon/chat_option.png', width: 54, height: 54, fit: BoxFit.fill),
                              SizedBox(width: Dimensions.PADDING_SIZE_LARGE),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (_) => ChatDetailsScreens(
                                              userModel: userModel,
                                            )));
                                  },
                                  child: Image.asset('assets/dating_app/icon/start_chat.png', width: 133, height: 54, fit: BoxFit.fill)),
                            ],
                          ),
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
                                      onTap: (){
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20.0)),
                                                child: FullScreenImageWidget(imageUrl: userModel.imageUrl,),
                                              );
                                            });
                                      },
                                      child: Container(
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: FadeInImage.assetNetwork(
                                                  placeholder: DatingImages.place_holder_dating,
                                                  image: userModel.imageUrl,fit: BoxFit.fill,),
                                            ),
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
      ),
    );
  }

  Widget _userInfoWidget(String imageUrl, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        children: [
          Image.asset(imageUrl, width: 13, height: 13, fit: BoxFit.fill),
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
