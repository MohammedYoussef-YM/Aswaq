import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/wallet/utility/colorResources.dart';
import 'package:flutter_ui_kit/wallet/utility/dimensions.dart';
import 'package:flutter_ui_kit/wallet/utility/strings.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';
import 'package:flutter_ui_kit/wallet/view/views/send_money2_Screen.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/send_money_widget.dart';

class RequestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SendMoneyWidget(title: Strings.REQUEST, child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
          margin: EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(color: ColorResources.COLOR_GHOST_WHITE, shape: BoxShape.circle),
          child: Image.asset('assets/wallet/Illustration/request.png', fit: BoxFit.scaleDown),
        ),

        Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 40,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorResources.COLOR_WHITE_SMOKE),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(23), color: ColorResources.COLOR_PRIMARY_DARK),
                  child: Text(Strings.REQUEST_TO, style: poppinsRegular.copyWith(color: ColorResources.COLOR_WHITE)),
                ),
              ),
              Expanded(
                child: FittedBox(
                  child: Text(
                    Strings.COUNTRY_CODE,
                    textAlign: TextAlign.justify,
                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_CHARCOAL),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.center,
                  child: FittedBox(child: Text(Strings.MOBILE_NUMBER, style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_ROYAL_BLUE))),
                ),
              ),
              Expanded(child: Image.asset('assets/wallet/Icon/contacts.png', width: 12, height: 16, fit: BoxFit.scaleDown)),
            ],
          ),
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorResources.COLOR_WHITE_SMOKE),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(23), color: ColorResources.COLOR_PRIMARY_DARK),
                  child: Text(Strings.AMOUNT, style: poppinsRegular.copyWith(color: ColorResources.COLOR_WHITE)),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  alignment: Alignment.center,
                  child: Text(
                    Strings.DOLLER6500,
                    textAlign: TextAlign.center,
                    style: poppinsSemiBold.copyWith(fontSize: 20, color: ColorResources.COLOR_DARK_ORCHID),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 40,
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorResources.COLOR_WHITE_SMOKE),
          child: TextFormField(
            style: poppinsRegular.copyWith(color: ColorResources.COLOR_CHARCOAL),
            decoration: InputDecoration(hintText: Strings.ENTER_YOUR_REMARKS, border: InputBorder.none),
          ),
        ),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
          child: CustomButton(btnTxt: Strings.CONTINUE, onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SendMoneyScreen2()));
          }),
        ),
      ],
    ));
  }
}
