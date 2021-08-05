import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/rideshare/utility/colorResources.dart';
import 'package:flutter_ui_kit/rideshare/utility/dimensions.dart';
import 'package:flutter_ui_kit/rideshare/utility/strings.dart';
import 'package:flutter_ui_kit/rideshare/view/view/history/widget/distance_time_cash_widget.dart';
import 'package:flutter_ui_kit/rideshare/view/widget/destination_location_widget.dart';

class HistoryDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.56,
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.clear)),
            ),
            DestinationLocationWidget(),
            SizedBox(height: 40),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(child: DistanceTimeCashWidget(title: Strings.km4_8, subtitle: Strings.distance)),
                    Container(height: 70, width: 1, color: ColorResources.COLOR_GRAY.withOpacity(.2)),
                    Expanded(child: DistanceTimeCashWidget(title: Strings.min_30, subtitle: Strings.time)),
                    Container(height: 70, width: 1, color: ColorResources.COLOR_GRAY.withOpacity(.2)),
                    Expanded(child: DistanceTimeCashWidget(title: Strings.tk_120, subtitle: Strings.cash_trip)),
                  ],
                ),
                Container(height: 1, color: ColorResources.COLOR_GRAY.withOpacity(.2)),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.date_and_time,
                  style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_DEEP, fontSize: 15),
                ),
                Text(
                  Strings.date_and_time_valid,
                  style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY, fontSize: 13),
                )
              ],
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Strings.trip_type,
                  style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_DEEP, fontSize: 15),
                ),
                Text(
                  Strings.normal,
                  style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY, fontSize: 13),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
