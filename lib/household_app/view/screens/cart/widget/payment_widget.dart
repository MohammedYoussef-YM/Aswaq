import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/utility/strings.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui_kit/household_app/provider/cart_provider.dart';

class PaymentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.symmetric(vertical: HouseHoldDimensions.PADDING_SIZE_LARGE), children: [

      Text(Strings.payment_method, style: manropeMedium.copyWith(fontSize: HouseHoldDimensions.FONT_SIZE_LARGE)),
      SizedBox(height: 10),

      InkWell(
        onTap: () => Provider.of<HouseCartProvider>(context, listen: false).setPaymentIndex(0),
        child: Row(children: [
          Expanded(child: Text(Strings.cash_on_payment, style: manropeRegular)),
          Radio(
            value: 0,
            groupValue: Provider.of<HouseCartProvider>(context).paymentIndex,
            onChanged: (int value) => Provider.of<HouseCartProvider>(context, listen: false).setPaymentIndex(value),
          ),
        ]),
      ),
      InkWell(
        onTap: () => Provider.of<HouseCartProvider>(context, listen: false).setPaymentIndex(1),
        child: Row(children: [
          Expanded(child: Text(Strings.mobile_payment, style: manropeRegular)),
          Radio(
            value: 1,
            groupValue: Provider.of<HouseCartProvider>(context).paymentIndex,
            onChanged: (int value) => Provider.of<HouseCartProvider>(context, listen: false).setPaymentIndex(value),
          ),
        ]),
      ),

    ]);
  }
}
