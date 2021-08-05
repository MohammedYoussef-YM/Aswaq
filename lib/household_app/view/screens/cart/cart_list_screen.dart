import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/provider/cart_provider.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/images.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';
import 'package:flutter_ui_kit/household_app/view/screens/cart/cart_screen.dart';
import 'package:flutter_ui_kit/household_app/view/widget/custom_button.dart';
import 'package:provider/provider.dart';

class CartListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HouseHoldColorResources.COLOR_PRIMARY,
        automaticallyImplyLeading: false,
        title: Text(Strings.cart),
      ),
      body: ListView(physics: BouncingScrollPhysics(), children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              margin: EdgeInsets.only(top: HouseHoldDimensions.PADDING_SIZE_SMALL),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: HouseHoldColorResources.COLOR_CARD_BG),
              child: Row(children: [
                Expanded(flex: 2, child: FadeInImage.assetNetwork(placeholder: Images.place_holder, image: index%2==0 ? Images.clean : Images.window_cleaning,fit: BoxFit.fill,)),
                Expanded(flex: 3, child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: HouseHoldDimensions.PADDING_SIZE_EXTRA_SMALL, vertical: HouseHoldDimensions.PADDING_SIZE_SMALL),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(index%2==0 ? Strings.floor_cleaning : Strings.service_in_town, style: manropeMedium.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),
                    Expanded(child: SizedBox()),
                    Row(children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => Provider.of<HouseCartProvider>(context, listen: false).setCartQty(index, false),
                      ),
                      Text(Provider.of<HouseCartProvider>(context).cartQtyList[index].toString()),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => Provider.of<HouseCartProvider>(context, listen: false).setCartQty(index, true),
                      ),
                      Expanded(child: SizedBox()),
                      Text('\$${index%2==0 ? 50 : 30}', style: manropeBold.copyWith(fontSize: 24, color: HouseHoldColorResources.COLOR_PRIMARY)),
                    ]),
                  ]),
                )),
              ]),
            );
          },
        ),

        SizedBox(height: 50),
        Padding(
          padding: EdgeInsets.all(HouseHoldDimensions.PADDING_SIZE_LARGE),
          child: CustomButton(btnTxt: Strings.checkout, onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen()));
          }),
        ),
      ]),
    );
  }
}
