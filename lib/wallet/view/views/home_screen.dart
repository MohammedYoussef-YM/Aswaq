import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/wallet/provider/promo_provider.dart';
import 'package:flutter_ui_kit/wallet/utility/colorResources.dart';
import 'package:flutter_ui_kit/wallet/utility/dimensions.dart';
import 'package:flutter_ui_kit/wallet/utility/images.dart';
import 'package:flutter_ui_kit/wallet/utility/strings.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';
import 'package:flutter_ui_kit/wallet/view/views/pay_screen.dart';
import 'package:flutter_ui_kit/wallet/view/views/saving_account_screen.dart';
import 'package:flutter_ui_kit/wallet/view/views/cashback_screen.dart';
import 'package:flutter_ui_kit/wallet/view/views/charity_screen.dart';
import 'package:flutter_ui_kit/wallet/view/views/e_shopping_screen.dart';
import 'package:flutter_ui_kit/wallet/view/views/gift_screen.dart';
import 'package:flutter_ui_kit/wallet/view/views/request_screen.dart';
import 'package:flutter_ui_kit/wallet/view/views/send_money1_screen.dart';
import 'package:flutter_ui_kit/wallet/view/views/topup_screen.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/promo_widget.dart';
import 'package:provider/provider.dart';

class PixalletHomeScreen extends StatefulWidget {
  @override
  _PixalletHomeScreenState createState() => _PixalletHomeScreenState();
}

class _PixalletHomeScreenState extends State<PixalletHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: 7,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/wallet/Illustration/Untitled-1.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(Strings.PIXALLET, style: poppinsBold.copyWith(fontSize: 25, color: ColorResources.COLOR_WHITE)),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Icon(Icons.notifications, size: 30, color: ColorResources.COLOR_WHITE),
                          Positioned(
                            right: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorResources.COLOR_DARK_ORCHID.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: Offset(0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: ColorResources.COLOR_WHITE,
                                child: Text(Strings.TWO, style: TextStyle(fontSize: 8)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: FadeInImage.assetNetwork(
                                  placeholder: Images.place_holder,
                                  image: Images.person_three,
                                  width: Dimensions.PROFILE_WIDTH,
                                  height: Dimensions.PROFILE_HEIGHT,
                                  fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Strings.NAME, style: poppinsRegular.copyWith(color: ColorResources.COLOR_WHITE)),
                                  Text(Strings.USERNAME, style: poppinsRegular.copyWith(color: ColorResources.COLOR_VERY_LIGHT_GRAY)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 180,
                        margin: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: ColorResources.COLOR_WHITE,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 20,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20, top: 19, right: 22, bottom: 11),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(Strings.MY_BALANCE, style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY)),
                                  Text(Strings.BALANCE_DOLLER, style: poppinsRegular.copyWith(color: ColorResources.COLOR_DARK_ORCHID)),
                                ],
                              ),
                            ),
                            Container(height: 2, width: double.infinity, color: ColorResources.COLOR_WHITE_GRAY),
                            SizedBox(height: 10),
                            Container(
                                padding: EdgeInsets.only(left: 20, top: 19, right: 22),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SendMoneyScreen1()));
                                      },
                                      child: IconTitleColumnButton(iconUrl: 'assets/wallet/Icon/send.png', title: Strings.SEND),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SavingAccountScreen()));
                                      },
                                      child: IconTitleColumnButton(iconUrl: 'assets/wallet/Icon/my saving.png', title: Strings.MY_SAVING),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TopUpScreen()));
                                      },
                                      child: IconTitleColumnButton(iconUrl: 'assets/wallet/Icon/topup.png', title: Strings.TOP_UP),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => RequestScreen()));
                                      },
                                      child: IconTitleColumnButton(iconUrl: 'assets/wallet/Icon/request.png', title: Strings.REQUEST),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
                          children: [
                            IconTitleRowButton(
                              widget: EShoppingScreen(),
                              iconUrl: 'assets/wallet/Icon/shopping.png',
                              title: Strings.E_SHOPPING,
                            ),
                            IconTitleRowButton(
                              widget: GiftScreen(),
                              iconUrl: 'assets/wallet/Icon/gift.png',
                              title: Strings.GIFTS,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Row(
                          children: [
                            IconTitleRowButton(
                              widget: PayScreen(),
                              iconUrl: 'assets/wallet/Icon/bill payments.png',
                              title: Strings.BILL_PAYMENT,
                            ),
                            IconTitleRowButton(
                              widget: PayScreen(),
                              iconUrl: 'assets/wallet/Icon/split bill.png',
                              title: Strings.SPLIT_BILLS,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Row(
                          children: [
                            IconTitleRowButton(
                              widget: CharityScreen(),
                              iconUrl: 'assets/wallet/Icon/charity.png',
                              title: Strings.CHARITY,
                            ),
                            IconTitleRowButton(
                              widget: CashBackScreen(),
                              iconUrl: 'assets/wallet/Icon/cashback.png',
                              title: Strings.CASHBACK,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                        child: Text(Strings.PROMO, style: poppinsSemiBold),
                      ),
                      Container(
                        height: 100,
                        padding: EdgeInsets.only(left: 20),
                        child: ListView.builder(
                            itemCount: Provider.of<PromoProvider>(context).getPromoList().length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return PromoWidget(Provider.of<PromoProvider>(context).getPromoList()[index]);
                            },
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class IconTitleColumnButton extends StatelessWidget {
  final String iconUrl;
  final String title;
  IconTitleColumnButton({@required this.iconUrl, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 51,
          height: 51,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: ColorResources.COLOR_GHOST_WHITE, borderRadius: BorderRadius.circular(44)),
          child: Image.asset(iconUrl, fit: BoxFit.scaleDown),
        ),
        Text(title, style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_CHARCOAL)),
      ],
    );
  }
}

class IconTitleRowButton extends StatelessWidget {
  final Widget widget;
  final String iconUrl;
  final String title;
  IconTitleRowButton({this.widget, @required this.iconUrl, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if(widget != null) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
          }
        },
        child: Row(
          children: [
            Container(
              width: 36,
              height: 35,
              child: Image.asset(iconUrl),
            ),
            SizedBox(width: 10),
            Text(title, style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_DIM_GRAY)),
          ],
        ),
      ),
    );
  }
}

