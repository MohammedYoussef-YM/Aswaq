import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/view/screens/cart/widget/address_widget.dart';
import 'package:flutter_ui_kit/household_app/view/screens/cart/widget/confirmation_widget.dart';
import 'package:flutter_ui_kit/household_app/view/screens/cart/widget/payment_widget.dart';
import 'package:flutter_ui_kit/household_app/view/screens/cart/order_placed_screen.dart';
import 'package:flutter_ui_kit/household_app/view/widget/custom_button.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _cartIndex = 0;
  final List<Widget> _children = [
    AddressWidget(),
    ConfirmationWidget(),
    PaymentWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HouseHoldColorResources.COLOR_SOLITUDE,

      appBar: AppBar(
        title: Text(Strings.checkout, style: manropeMedium.copyWith(
          color: HouseHoldColorResources.COLOR_WHITE,
          fontSize: HouseHoldDimensions.FONT_SIZE_LARGE,
        )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: HouseHoldColorResources.COLOR_WHITE, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: HouseHoldColorResources.COLOR_PRIMARY,
      ),

      body: Padding(
        padding: EdgeInsets.all(HouseHoldDimensions.PADDING_SIZE_LARGE),
        child: Column(children: [
          Row(children: [
            Expanded(child: Opacity(opacity: _cartIndex>=0 ? 1 : 0.5, child: CheckWidget(icon: Icons.location_on))),
            Expanded(child: Divider(thickness: 2, color: HouseHoldColorResources.COLOR_CRANBERRY.withOpacity(_cartIndex>=1 ? 1 : 0.5))),
            Expanded(child: Opacity(opacity: _cartIndex>=1 ? 1 : 0.5, child: CheckWidget(icon: Icons.check_circle_outline))),
            Expanded(child: Divider(thickness: 2, color: HouseHoldColorResources.COLOR_CRANBERRY.withOpacity(_cartIndex>=2 ? 1 : 0.5))),
            Expanded(child: Opacity(opacity: _cartIndex>=2 ? 1 : 0.5, child: CheckWidget(icon: Icons.payment_outlined))),
          ]),
          Row(children: [
            Text(Strings.address),
            Expanded(child: SizedBox()),
            Text(Strings.confirmation),
            Expanded(child: SizedBox()),
            Text(Strings.payment),
          ]),
          Expanded(child: PageView.builder(
            itemCount: _children.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _children[_cartIndex];
            },
          )),
          CustomButton(btnTxt: Strings.continue_, onTap: () => {
            if(_cartIndex != _children.length-1) {
              setState(() {
                _cartIndex = _cartIndex + 1;
              })
            }else {
              Navigator.push(context, MaterialPageRoute(builder: (_) => OrderPlacedScreen()))
            }
          }),
        ]),
      ),

    );
  }
}

class CheckWidget extends StatelessWidget {
  final IconData icon;
  CheckWidget({@required this.icon});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white, 
        border: Border.all(width: 2, color: HouseHoldColorResources.COLOR_CRANBERRY),
        shape: BoxShape.circle,
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: HouseHoldColorResources.COLOR_CRANBERRY,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}

