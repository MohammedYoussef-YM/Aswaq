import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/helper/network_info.dart';
import 'package:flutter_ui_kit/sixvalley/localization/language_constrants.dart';
import 'package:flutter_ui_kit/sixvalley/provider/auth_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/profile_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/theme_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';
import 'package:flutter_ui_kit/sixvalley/utill/images.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/animated_custom_dialog.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/guest_dialog.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/cart/cart_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/category/all_category_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/chat/inbox_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/more/web_view_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/more/widget/app_info_dialog.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/more/widget/sign_out_confirmation_dialog.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/notification/notification_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/offer/offers_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/order/order_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/profile/profile_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/setting/settings_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/support/support_ticket_screen.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/wishlist/wishlist_screen.dart';
import 'package:provider/provider.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isGuestMode = !Provider.of<SixAuthProvider>(context, listen: false).isLoggedIn();
    Provider.of<SixProfileProvider>(context, listen: false).getUserInfo();
    NetworkInfo.checkConnectivity(context);

    return Scaffold(
      body: Stack(children: [
        // Background
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            Images.more_page_header,
            height: 150,
            fit: BoxFit.fill,
            color: Provider.of<SixThemeProvider>(context).darkTheme ? Colors.black : null,
          ),
        ),

        // AppBar
        Positioned(
          top: 40,
          left: Dimensions.PADDING_SIZE_SMALL,
          right: Dimensions.PADDING_SIZE_SMALL,
          child: Consumer<SixProfileProvider>(
            builder: (context, profile, child) {
              return Row(children: [
                Image.asset(Images.logo_with_name_image, height: 35, color: ColorResources.WHITE),
                Expanded(child: SizedBox.shrink()),
                Text(!isGuestMode ? profile.userInfoModel != null ? '${profile.userInfoModel.fName} ${profile.userInfoModel.lName}' : 'Full Name' : 'Guest',
                    style: titilliumRegular.copyWith(color: ColorResources.WHITE)),
                SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                InkWell(
                  onTap: () {
                    if(isGuestMode) {
                      showAnimatedDialog(context, GuestDialog(), isFlip: true);
                    }else {
                      if(Provider.of<SixProfileProvider>(context, listen: false).userInfoModel != null) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SixProfileScreen()));
                      }
                    }
                  },
                  child: isGuestMode ? CircleAvatar(child: Icon(Icons.person, size: 35)) :
                  profile.userInfoModel == null ? CircleAvatar(child: Icon(Icons.person, size: 35)) : ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child:FadeInImage.assetNetwork(
                      placeholder: Images.placeholder_image,
                      image: profile.userInfoModel.image,
                      width: 35,
                      height: 35,
                      fit: BoxFit.cover,),
                  ),
                ),
              ]);
            },
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 120),
          decoration: BoxDecoration(
            color: ColorResources.getIconBg(context),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(children: [
              SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

              // Top Row Items
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SquareButton(image: Images.shopping_image, title: getTranslated('orders', context), navigateTo: OrderScreen()),
                SquareButton(image: Images.cart_image, title: getTranslated('CART', context), navigateTo: CartScreen()),
                SquareButton(image: Images.offers, title: getTranslated('offers', context), navigateTo: OffersScreen()),
                SquareButton(image: Images.wishlist, title: getTranslated('wishlist', context), navigateTo: WishListScreen()),
              ]),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

              // Buttons
              TitleButton(image: Images.more_filled_image, title: getTranslated('all_category', context), navigateTo: AllCategoryScreen()),
              TitleButton(image: Images.notification_filled, title: getTranslated('notification', context), navigateTo: NotificationScreen()),
              TitleButton(image: Images.chats, title: getTranslated('chats', context), navigateTo: InboxScreen()),
              TitleButton(image: Images.settings, title: getTranslated('settings', context), navigateTo: SettingsScreen()),
              TitleButton(image: Images.preference, title: getTranslated('support_ticket', context), navigateTo: SupportTicketScreen()),
              TitleButton(image: Images.privacy_policy, title: getTranslated('terms_condition', context), navigateTo: WebViewScreen(
                title: getTranslated('terms_condition', context),
                url: 'https://www.google.com',
              )),
              TitleButton(image: Images.help_center, title: getTranslated('faq', context), navigateTo: WebViewScreen(
                title: getTranslated('faq', context),
                url: 'https://www.google.com',
              )),
              TitleButton(image: Images.about_us, title: getTranslated('about_us', context), navigateTo: WebViewScreen(
                title: getTranslated('about_us', context),
                url: 'https://www.google.com',
              )),
              TitleButton(image: Images.contact_us, title: getTranslated('contact_us', context), navigateTo: WebViewScreen(
                title: getTranslated('contact_us', context),
                url: 'https://www.google.com',
              )),

              ListTile(
                leading: Image.asset(Images.logo_image, width: 25, height: 25, fit: BoxFit.fill, color: ColorResources.getPrimary(context)),
                title: Text(getTranslated('app_info', context), style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
                onTap: () => showAnimatedDialog(context, SixAppInfoDialog(), isFlip: true),
              ),

              isGuestMode
                  ? SizedBox()
                  : ListTile(
                      leading: Icon(Icons.exit_to_app, color: ColorResources.getPrimary(context), size: 25),
                      title: Text(getTranslated('sign_out', context), style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
                      onTap: () => showAnimatedDialog(context, SixSignOutConfirmationDialog(), isFlip: true),
                    ),
            ]),
          ),
        ),
      ]),
    );
  }

}

class SquareButton extends StatelessWidget {
  final String image;
  final String title;
  final Widget navigateTo;

  SquareButton({@required this.image, @required this.title, @required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 100;
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => navigateTo)),
      child: Column(children: [
        Container(
          width: width / 4,
          height: width / 4,
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorResources.getPrimary(context),
          ),
          child: Image.asset(image, color: Theme.of(context).accentColor),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(title, style: titilliumRegular),
        ),
      ]),
    );
  }
}

class TitleButton extends StatelessWidget {
  final String image;
  final String title;
  final Widget navigateTo;
  TitleButton({@required this.image, @required this.title, @required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(image, width: 25, height: 25, fit: BoxFit.fill, color: ColorResources.getPrimary(context)),
      title: Text(title, style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
      onTap: () => Navigator.push(
        context,
          /*PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (context, animation, secondaryAnimation) => navigateTo,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              animation = CurvedAnimation(parent: animation, curve: Curves.bounceInOut);
              return ScaleTransition(scale: animation, child: child, alignment: Alignment.center);
            },
          ),*/
        MaterialPageRoute(builder: (_) => navigateTo),
      ),
    );
  }
}

