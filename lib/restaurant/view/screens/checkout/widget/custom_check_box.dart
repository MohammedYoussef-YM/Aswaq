import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/restaurant/provider/order_provider.dart';
import 'package:flutter_ui_kit/restaurant/utill/color_resources.dart';
import 'package:flutter_ui_kit/restaurant/utill/styles.dart';
import 'package:provider/provider.dart';

class CustomCheckBox extends StatelessWidget {
  final String title;
  final int index;
  CustomCheckBox({@required this.title, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<RestOrderProvider>(
      builder: (context, order, child) {
        return InkWell(
          onTap: () => order.setPaymentMethod(index),
          child: Row(children: [
            Checkbox(
              value: order.paymentMethodIndex == index,
              activeColor: ColorResources.getPrimaryColor(context),
              onChanged: (bool isChecked) => order.setPaymentMethod(index),
            ),
            Expanded(
              child: Text(title, style: rubikRegular.copyWith(
                color: order.paymentMethodIndex == index ? Theme.of(context).textTheme.bodyText1.color : ColorResources.getGreyColor(context),
              )),
            ),
          ]),
        );
      },
    );
  }
}
