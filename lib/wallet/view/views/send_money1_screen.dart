import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/wallet/utility/colorResources.dart';
import 'package:flutter_ui_kit/wallet/utility/dimensions.dart';
import 'package:flutter_ui_kit/wallet/utility/strings.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';
import 'package:flutter_ui_kit/wallet/view/views/send_money2_Screen.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/edittext/custom_text_field.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/send_money_widget.dart';

class SendMoneyScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SendMoneyWidget(title: 'Send Money', child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
          margin: EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(color: ColorResources.COLOR_GHOST_WHITE, shape: BoxShape.circle),
          child: Image.asset('assets/wallet/Icon/send.png', fit: BoxFit.scaleDown),
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
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: ColorResources.COLOR_PRIMARY_DARK),
                  child: Text(Strings.RECEIPT, style: poppinsRegular.copyWith(color: ColorResources.COLOR_WHITE)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: FittedBox(
                    child: Text(
                      Strings.COUNTRY_CODE,
                      textAlign: TextAlign.justify,
                      style: poppinsRegular.copyWith(color: ColorResources.COLOR_CHARCOAL),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: CustomTextField(
                  hintTxt: Strings.MOBILE_NUMBER,
                  isPhoneNumber: true,
                  textInputType: TextInputType.phone,
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
                  child: CustomTextField(
                    hintTxt: Strings.DOLLER_49,
                    isPhoneNumber: true,
                    textInputType: TextInputType.number,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Text(
            Strings.AVAIBLE_BALANCE,
            style: montserratSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_DIM_GRAY),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
          child: CustomButton(btnTxt: Strings.CONTINUE, onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SendMoneyScreen2()));
          }),
        ),
      ],
    ));
  }
}
