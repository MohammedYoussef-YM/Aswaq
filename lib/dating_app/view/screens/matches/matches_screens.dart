import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/dating_app/data/models/user_model.dart';
import 'package:flutter_ui_kit/dating_app/provider/dating_app_user_provider.dart';
import 'package:flutter_ui_kit/dating_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/dating_app/utility/dating_image.dart';
import 'package:flutter_ui_kit/dating_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/strings.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:flutter_ui_kit/dating_app/view/screens/user_details/user_details_screen.dart';
import 'package:flutter_ui_kit/dating_app/view/widget/custom_text_field.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MatchesScreens extends StatelessWidget {
  double _crossAxisSpacing = 15, _mainAxisSpacing = 15, _aspectRatio = 0.6;
  int _crossAxisCount = 2;

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
              padding: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL,top: Dimensions.PADDING_SIZE_SMALL),
              sliver: SliverAppBar(
                floating: true,
                elevation: 0,
                centerTitle: false,
                automaticallyImplyLeading: false,
                //leadingWidth: 150,
                //leading: SizedBox(width: 10,),
                backgroundColor: ColorResources.COLOR_WHITE,
                //toolbarHeight: 30,
                title: Text(Strings.matches_camel_case, style: robotoBold.copyWith(color: ColorResources.COLOR_GREY_GONDOLA, fontSize: 22)),
              ),
            ),

            // Search Button
            SliverPersistentHeader(pinned: true, delegate: SliverDelegate(child: Container(
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
                padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
                child: Column(
                  children: [
                    Consumer<DatingAppUserProvider>(
                      builder: (context, userProvider, child) => GridView.builder(
                          shrinkWrap: true,
                          // 1st add
                          physics: BouncingScrollPhysics(),
                          // 2nd add
                          itemCount: userProvider.getAllUsers.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: _crossAxisCount,
                            crossAxisSpacing: _crossAxisSpacing,
                            mainAxisSpacing: _mainAxisSpacing,
                            childAspectRatio: _aspectRatio,
                          ),
                          itemBuilder: (context, index) => _matchProfile(context, userProvider.getAllUsers[index])),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _matchProfile(BuildContext context, UserModel userModel) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>UserDetailsScreen(userModel: userModel,)));
      },
      child: Container(
        height: 260,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT), color: ColorResources.COLOR_PRIMARY),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT),
              child: FadeInImage.assetNetwork(
                placeholder: DatingImages.place_holder_dating,
                image: userModel.imageUrl,
                height: 190,
                fit: BoxFit.fill,
                width: double.infinity,),

              /*child: Image.asset(
                userModel.imageUrl,
                height: 190,
                fit: BoxFit.fill,
                width: double.infinity,
              ),*/
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
            Text('${userModel.firstName} ${userModel.lastName}', style: robotoMedium.copyWith(color: ColorResources.COLOR_WHITE)),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                userModel.lastSeen == Strings.active_now
                    ? CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.green,
                      )
                    : SizedBox.shrink(),
                Text(
                  userModel.lastSeen == Strings.active_now ? '  ${userModel.lastSeen}' : '${Strings.last_seen} ${userModel.lastSeen}',
                  style: robotoLight.copyWith(color: ColorResources.COLOR_WHITE, fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL),
                )
              ],
            ),
          ],
        ),
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
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 50 || oldDelegate.minExtent != 50 || child != oldDelegate.child;
  }
}