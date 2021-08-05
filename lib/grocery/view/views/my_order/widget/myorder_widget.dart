import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/provider/checkout_provider.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/view/views/my_order/order_details_screen.dart';
import 'package:provider/provider.dart';

class MyOrderWidget extends StatelessWidget {
  final String orderId;
  final String totalBill;
  final String status;
  final String items;
  final Color statusColor;
  final bool fromComplete;

  MyOrderWidget({this.orderId, this.totalBill, this.status, this.statusColor,this.items, this.fromComplete = false});

  @override
  Widget build(BuildContext context) {
    Provider.of<CheckoutProvider>(context, listen: false).initializeOrderList();

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OrderDetailsScreen(fromComplete: fromComplete)));
      },
      child: Container(
        decoration: BoxDecoration(color: ColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.order_id,
                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY.withOpacity(.8)),
                  ),
                  Text(
                    orderId,
                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY),
                  ),
                ],
              ),
            ),
            Container(height: 1, color: ColorResources.COLOR_DIM_GRAY.withOpacity(.2), margin: EdgeInsets.symmetric(vertical: 5)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.order_list,
                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY.withOpacity(.8)),
                  ),
                  Text(
                    items??"",
                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK.withOpacity(.7)),
                  ),
                ],
              ),
            ),
            Container(height: 1, color: ColorResources.COLOR_DIM_GRAY.withOpacity(.2), margin: EdgeInsets.symmetric(vertical: 5)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.total_bill,
                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY.withOpacity(.8)),
                  ),
                  Text(
                    totalBill,
                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY),
                  ),
                ],
              ),
            ),
            Container(height: 1, color: ColorResources.COLOR_DIM_GRAY.withOpacity(.2), margin: EdgeInsets.symmetric(vertical: 5)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.status,
                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY.withOpacity(.8)),
                  ),
                  Container(
                    width: 102,
                    height: 34,
                    decoration: BoxDecoration(color: statusColor, borderRadius: BorderRadius.circular(8.0)),
                    child: Center(child: Text(status, style: poppinsRegular.copyWith(color: ColorResources.COLOR_WHITE))),
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
          ],
        ),
      ),
    );
  }
}
