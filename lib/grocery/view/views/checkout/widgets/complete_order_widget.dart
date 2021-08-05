import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/views/dashboard/dashboard_screen.dart';

class CompleteOrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  icon: Icon(Icons.close, size: 20),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          ),
          Text(
            Strings.order_success,
            style: poppinsRegular.copyWith(fontSize: 22, color: ColorResources.COLOR_LIGHT_BLACK),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Strings.your_have_is_being_processed,
              textAlign: TextAlign.center,
              style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => DashboardScreen()), (route) => false);
            },
            child: Text(
              Strings.back_to_home,
              textAlign: TextAlign.center,
              style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY, decoration: TextDecoration.underline),
            ),
          ),
          SizedBox(
            height: Dimensions.PADDING_SIZE_DEFAULT,
          ),
          Image.asset('assets/grocery/images/order.png')
        ],
      ),
    );
  }
}
