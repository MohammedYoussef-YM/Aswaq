import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/view/views/my_order/widget/myorder_widget.dart';

class OnGoingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true, // 1st add
      physics: ClampingScrollPhysics(), // 2nd add
      children: [
        MyOrderWidget(
          orderId: Strings.order_id_number,
          totalBill: Strings.doller_580,
          status: Strings.shipping,
          statusColor: ColorResources.COLOR_DODGER_BLUE,
          items: Strings.items_12,
        ),
        SizedBox(
          height: Dimensions.PADDING_SIZE_DEFAULT,
        ),
        MyOrderWidget(
          orderId: Strings.order_id_number,
          totalBill: Strings.doller_9,
          status: Strings.pending,
          statusColor: ColorResources.COLOR_CARROT_ORANGE,
          items: Strings.items_12,
        ),
      ],
    );
  }
}
