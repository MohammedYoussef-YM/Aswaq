import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';

class AccountInformationScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

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
          Strings.account_information,
          style: poppinsRegular,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        color: ColorResources.COLOR_CART_BACKGROUND,
        child: CustomScrollView(controller: _scrollController, physics: BouncingScrollPhysics(), slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _informationContainer(title: Strings.name, data: Strings.todd_benson),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                _informationContainer(title: Strings.email, data: Strings.email_frees),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                _informationContainer(title: Strings.password, data: Strings.password_row),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                _informationContainer(title: Strings.phone, data: Strings.phone_number_two),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                _informationContainer(title: Strings.date_of_birth, data: Strings.date_of_birth_oct_15),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget _informationContainer({String title, String data}) {
    return Container(
      height: 56,
      padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
      decoration: BoxDecoration(color: ColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(8.0)),
      child: Row(
        children: [
          Expanded(child: Text(title, style: poppinsRegular.copyWith(color: ColorResources.COLOR_DIM_GRAY.withOpacity(.8)))),
          Expanded(flex: 2, child: Text(data)),
        ],
      ),
    );
  }
}
