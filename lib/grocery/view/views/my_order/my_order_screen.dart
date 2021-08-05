import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/views/my_order/widget/ongoing_widget.dart';
import 'package:flutter_ui_kit/grocery/view/views/my_order/widget/complete_widget.dart';
import 'package:flutter_ui_kit/wallet/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_button.dart';
import 'package:flutter_ui_kit/grocery/view/views/dashboard/dashboard_screen.dart';


class MyOrderScreen extends StatefulWidget {
  @override
  _MyOrderScreen createState() => _MyOrderScreen();
}

class _MyOrderScreen extends State<MyOrderScreen> with SingleTickerProviderStateMixin {
  TabController _controller;

  List<Widget> list = [
    Tab(text: Strings.ongoing),
    Tab(text: Strings.complete),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        bottom: TabBar(
          onTap: (index) {
            // Should not used it as it only called when tab options are clicked,
            // not when user swapped
          },
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: ColorResources.COLOR_PRIMARY,
          controller: _controller,
          labelColor: ColorResources.COLOR_PRIMARY,
          unselectedLabelColor: ColorResources.COLOR_GRAY,
          tabs: list,
        ),
        //leading: SizedBox.shrink(),
        title: Text(
          Strings.my_order,
          style: poppinsRegular.copyWith(color: ColorResources.COLOR_BLACK, fontSize: Dimensions.FONT_SIZE_LARGE),
        ),
      ),
      body: Container(
        color: ColorResources.COLOR_CART_BACKGROUND,
        padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT,right: Dimensions.PADDING_SIZE_DEFAULT,top: Dimensions.PADDING_SIZE_DEFAULT),
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  OnGoingWidget(),
                  CompleteWidget(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_DEFAULT),
              child: CustomButton(
                btnTxt: Strings.go_to_shopping,
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => DashboardScreen()), (route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}
