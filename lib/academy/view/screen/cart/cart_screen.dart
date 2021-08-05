import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/academy/view/screen/cart/widget/cart_widget.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:flutter_ui_kit/academy/utility/style.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui_kit/academy/provider/wish_list_provider.dart';
import 'package:flutter_ui_kit/academy/view/screen/wishlist/widget/wish_list_widget.dart';
import 'package:flutter_ui_kit/academy/view/screen/payment/payment_screen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AcademyColorResources.COLOR_WHITE,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: AcademyColorResources.COLOR_GREY), onPressed: () => Navigator.pop(context)),
        title: Text(AcademyStrings.cart, style: avenirHeavy.copyWith(fontSize: 18, color: AcademyColorResources.COLOR_GREY)),
      ),
      body: Consumer<AcademyWishListProvider>(
        builder: (context, wishlist, child) {
          return ListView(padding: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_SMALL), physics: BouncingScrollPhysics(), children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(AcademyStrings.my_cart, style: robotoBold.copyWith(fontSize: 20)),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete),
              ),
            ]),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: wishlist.allCardList.length,
              itemBuilder: (context, index) {
                return CartWidget(
                    course: wishlist.allCardList[index],
                    fromCart: true,
                    onTap: () {
                      wishlist.changeSelectCard(index);
                    });
              },
            ),
            Container(
              padding: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_DEFAULT),
              margin: EdgeInsets.symmetric(vertical: AcademyDimensions.PADDING_SIZE_SMALL),
              decoration: BoxDecoration(
                border: Border.all(color: AcademyColorResources.BORDER_COLOR, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(children: [
                Expanded(child: Text('BDT 6000.0', style: robotoMedium.copyWith(fontSize: 24))),
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PaymentScreen())),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: AcademyDimensions.PADDING_SIZE_SMALL, horizontal: AcademyDimensions.PADDING_SIZE_LARGE),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AcademyColorResources.COLOR_ORANGE),
                    child: Text(AcademyStrings.pay_now, style: robotoBold.copyWith(fontSize: 20, color: AcademyColorResources.COLOR_WHITE)),
                  ),
                ),
              ]),
            ),
            Text(AcademyStrings.wishlist, style: robotoBold.copyWith(fontSize: 20)),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: wishlist.wishLists.length,
              itemBuilder: (context, index) {
                return WishListWidget(wishListModel: wishlist.wishLists[index]);
              },
            ),
          ]);
        },
      ),
    );
  }
}
