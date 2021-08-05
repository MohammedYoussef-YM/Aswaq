import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/provider/auth_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/seller_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/theme_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';
import 'package:flutter_ui_kit/sixvalley/utill/string_resources.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/no_internet_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/not_loggedin_widget.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/chat/chat_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class InboxScreen extends StatelessWidget {
  final bool isBackButtonExist;
  InboxScreen({this.isBackButtonExist = true});

  bool isFirstTime = true;

  @override
  Widget build(BuildContext context) {
    if(isFirstTime) {
      Provider.of<SixSellerProvider>(context, listen: false).initSeller('4');
      isFirstTime = false;
    }
    bool isGuestMode = !Provider.of<SixAuthProvider>(context, listen: false).isLoggedIn();

    return Scaffold(
      backgroundColor: ColorResources.getIconBg(context),
      body: Column(children: [

        // AppBar
        Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
            child: Image.asset(
              Images.toolbar_background, fit: BoxFit.fill, height: 50+MediaQuery.of(context).padding.top, width: double.infinity,
              color: Provider.of<SixThemeProvider>(context).darkTheme ? Colors.black : null,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            height: 50,
            alignment: Alignment.center,
            child: Row(children: [
              isBackButtonExist
                  ? IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              )
                  : SizedBox.shrink(),
              SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
              Expanded(
                child: Provider.of<SixSellerProvider>(context).isSearching
                    ?TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    hintStyle: titilliumRegular.copyWith(color: ColorResources.getGainsBoro(context)),
                  ),
                  style: titilliumSemiBold.copyWith(color: Colors.white, fontSize: Dimensions.FONT_SIZE_LARGE),
                  onChanged: (String query) {
                    Provider.of<SixSellerProvider>(context, listen: false).filterList(query);
                  },
                )
                    :Text(
                  Strings.inbox,
                  style: titilliumRegular.copyWith(fontSize: 20, color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: Icon(
                  Provider.of<SixSellerProvider>(context).isSearching ? Icons.close : Icons.search,
                  size: Dimensions.ICON_SIZE_LARGE,
                  color: Colors.white,
                ),
                onPressed: () => Provider.of<SixSellerProvider>(context, listen: false).toggleSearch(),
              ),
            ]),
          ),
        ]),

        isGuestMode ? NotLoggedInWidget() : Expanded(
          child: Provider.of<SixSellerProvider>(context).sellerList != null ? Provider.of<SixSellerProvider>(context).sellerList.length != 0 ? ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: Provider.of<SixSellerProvider>(context).sellerList.length,
            padding: EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(child: Icon(Icons.person), radius: 30),
                    title: Text(Provider.of<SixSellerProvider>(context).sellerList[index].fName+' '+Provider.of<SixSellerProvider>(context).sellerList[index].lName, style: titilliumSemiBold),
                    subtitle: Text('When will you start?', style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL)),
                    trailing: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text('16:12:18', style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL)),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Container(
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorResources.getPrimary(context),
                        ),
                        child: Text('3', style: titilliumSemiBold.copyWith(
                          fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL, color: Theme.of(context).accentColor,
                        )),
                      ),
                    ]),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(
                      seller: Provider.of<SixSellerProvider>(context).sellerList[index],
                    ))),
                  ),
                  Divider(height: 2, color: ColorResources.getChatIcon(context)),
                ],
              );
            },
          ) : NoInternetOrDataScreen(isNoInternet: false) : InboxShimmer(),
        ),
      ]),
    );
  }

}

class InboxShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          enabled: Provider.of<SixSellerProvider>(context).sellerList == null,
          child: Padding(
            padding: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
            child: Row(children: [
              CircleAvatar(child: Icon(Icons.person), radius: 30),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
                  child: Column(children: [
                    Container(height: 15, color: ColorResources.WHITE),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    Container(height: 15, color: ColorResources.WHITE),
                  ]),
                ),
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(height: 10, width: 30, color: ColorResources.WHITE),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: ColorResources.COLOR_PRIMARY),
                ),
              ])
            ]),
          ),
        );
      },
    );
  }
}

