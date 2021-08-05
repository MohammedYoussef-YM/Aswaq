import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';

class CardWidget extends StatelessWidget {
  final String cartTitle;
  CardWidget({this.cartTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Container(
        height: 192,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        decoration:
        BoxDecoration(color: ColorResources.COLOR_CONFLOWER_BLUE,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cartTitle,
              style: khulaSemiBold.copyWith(
                  color: ColorResources.COLOR_WHITE,
                  fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 42,
              decoration:
              BoxDecoration(color: ColorResources.COLOR_PRIMARY, borderRadius: BorderRadius.circular(8)),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 42,
                    decoration:
                    BoxDecoration(color: ColorResources.COLOR_PRIMARY, borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    height: 42,
                    decoration:
                    BoxDecoration(color: ColorResources.COLOR_PRIMARY, borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
