import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/views/checkout/add_new_address_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/checkout/widgets/delivery_address_widget.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_button.dart';

class ChangeDeliveryAddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 20),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        centerTitle: true,
        elevation: 0,
        title: Text(
          Strings.choose_delivery_address,
          style: poppinsRegular,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        color: ColorResources.COLOR_CART_BACKGROUND,
        child: ListView(
          children: [
            DeliveryAddressWidget(
              positionType: Strings.home,
              condition: Strings.default_address,
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
            DeliveryAddressWidget(positionType: Strings.work),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
            DeliveryAddressWidget(positionType: Strings.company),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
            CustomButton(isWhiteBackground: true, btnTxt: Strings.add_new_address,onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddNewAddressScreen()));
            },)
          ],
        ),
      ),
    );
  }
}
