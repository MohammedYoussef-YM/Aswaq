import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/dating_app/provider/dating_app_user_provider.dart';
import 'package:flutter_ui_kit/dating_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/dating_app/utility/dating_image.dart';
import 'package:flutter_ui_kit/dating_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/strings.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/chat/chat_details_screen.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/matches/matches_screens.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/user_details/user_details_screen.dart';
import 'package:flutter_ui_kit/dating_app/view/widget/custom_text_field.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<DatingAppUserProvider>(context, listen: false).initializeAllUsers();
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL, top: Dimensions.PADDING_SIZE_SMALL),
              sliver: SliverAppBar(
                floating: true,
                elevation: 0,
                centerTitle: false,
                automaticallyImplyLeading: false,
                //leadingWidth: 150,
                //leading: SizedBox(width: 10,),
                backgroundColor: ColorResources.COLOR_WHITE,
                //toolbarHeight: 30,
                title: Text(Strings.message, style: robotoBold.copyWith(color: ColorResources.COLOR_GREY_GONDOLA, fontSize: 22)),
              ),
            ),

            // Search Button
            SliverPersistentHeader(
                pinned: true,
                delegate: SliverDelegate(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
                      color: ColorResources.COLOR_WHITE,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          CustomTextField(
                            hintText: Strings.search_here,
                            inputAction: TextInputAction.search,
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL)
                    ],
                  ),
                ))),

            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_LARGE, top: Dimensions.PADDING_SIZE_LARGE),
                child: Consumer<DatingAppUserProvider>(
                  builder: (context, userProvider, child) => Column(
                    children: [
                      Container(
                        height: 100,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: userProvider.getAllUsersReversed.length,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => ChatDetailsScreens(userModel: userProvider.getAllUsersReversed[index])));
                              },
                              child: Container(
                                    width: 72,
                                    height: 104,
                                    margin: EdgeInsets.only(right: Dimensions.PADDING_SIZE_SMALL),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 72,
                                          height: 72,
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(50.0),
                                                    child: FadeInImage.assetNetwork(
                                                      placeholder: DatingImages.place_holder_dating,
                                                      image: userProvider.getAllUsersReversed[index].imageUrl,fit: BoxFit.cover,)
                                                ),
                                              ),
                                              Positioned(
                                                  bottom: 15,
                                                  right: 10,
                                                  child: Container(
                                                    width: Dimensions.PADDING_SIZE_DEFAULT,
                                                    height: Dimensions.PADDING_SIZE_DEFAULT,
                                                    decoration: BoxDecoration(
                                                        color: userProvider.getAllUsersReversed[index].lastSeen == Strings.active_now
                                                            ? Colors.transparent
                                                            : ColorResources.COLOR_PRIMARY,
                                                        shape: BoxShape.circle,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey.withOpacity(0.2),
                                                            spreadRadius: 1,
                                                            blurRadius: 7,
                                                            offset: Offset(0, 1), // changes position of shadow
                                                          ),
                                                        ],
                                                        border: Border.all(color: userProvider.getAllUsersReversed[index].lastSeen == Strings.active_now
                                                            ? Colors.transparent
                                                            :ColorResources.COLOR_WHITE, width: 3)),
                                                  ))
                                            ],
                                          ),
                                        ),
                                        Text(
                                          userProvider.getAllUsersReversed[index].firstName,
                                          style: robotoMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),
                                        )
                                      ],
                                    ),
                                  ),
                            )),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      ListView.builder(
                          shrinkWrap: true,
                          reverse: true,
                          scrollDirection: Axis.vertical,
                          physics: ClampingScrollPhysics(),
                          itemCount: userProvider.getAllUsers.length,
                          itemBuilder: (context, index) => Container(
                                margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 72,
                                      height: 72,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (_) => UserDetailsScreen(
                                                    userModel: userProvider.getAllUsers[index],
                                                  )));
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: 50.0,
                                              height: 50.0,
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(50.0),
                                                  child: FadeInImage.assetNetwork(
                                                    placeholder: DatingImages.place_holder_dating,
                                                    image: userProvider.getAllUsers[index].imageUrl,fit: BoxFit.cover,)
                                              ),
                                            ),

                                            Positioned(
                                                bottom: 15,
                                                right: 10,
                                                child: Container(
                                                  width: Dimensions.PADDING_SIZE_DEFAULT,
                                                  height: Dimensions.PADDING_SIZE_DEFAULT,
                                                  decoration: BoxDecoration(
                                                      color: userProvider.getAllUsers[index].lastSeen == Strings.active_now
                                                          ? Colors.transparent
                                                          :ColorResources.COLOR_PRIMARY,
                                                      shape: BoxShape.circle,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.withOpacity(0.2),
                                                          spreadRadius: 1,
                                                          blurRadius: 7,
                                                          offset: Offset(0, 1), // changes position of shadow
                                                        ),
                                                      ],
                                                      border: Border.all(color: userProvider.getAllUsers[index].lastSeen == Strings.active_now
                                                          ? Colors.transparent
                                                          :ColorResources.COLOR_WHITE, width: 3)),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (_) => ChatDetailsScreens(userModel: userProvider.getAllUsers[index],)));
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${userProvider.getAllUsers[index].firstName} ${userProvider.getAllUsers[index].lastName}',
                                            style: robotoMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),
                                          ),
                                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                          Text(
                                            '${userProvider.getAllUsers[index].sortMessage}',
                                            style: robotoRegular,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ))
                    ],
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
