import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/wallet/utility/dimensions.dart';
import 'package:flutter_ui_kit/wallet/utility/colorResources.dart';
import 'package:flutter_ui_kit/wallet/utility/images.dart';
import 'package:flutter_ui_kit/wallet/utility/strings.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';
import 'package:flutter_ui_kit/wallet/view/views/startup_Screen.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/send_money_widget.dart';

class SendMoneyScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SendMoneyWidget(title: Strings.SEND_MONEY_SUCCESS, child: Column(
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
        Text(
          Strings.YOU_SUCESSFULLY,
          textAlign: TextAlign.center,
          style: montserratSemiBold.copyWith(color: ColorResources.COLOR_DIM_GRAY),
        ),
        Text(
          Strings.SENT_MONEY_TO_MARTINA,
          textAlign: TextAlign.center,
          style: poppinsSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: ColorResources.COLOR_CHARCOAL),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
          child: Text(Strings.DOLLER300, style: poppinsSemiBold.copyWith(fontSize: 30, color: ColorResources.COLOR_DARK_ORCHID)),
        ),
        Container(
          margin: EdgeInsets.only(left: 58, right: 35),
          height: 46,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorResources.COLOR_WHITE_SMOKE),
          child: Row(
            children: [
              ClipRRect(child: FadeInImage.assetNetwork(placeholder: Images.place_holder, image: Images.person_one, width: 40, height: 40,fit: BoxFit.fill,)),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  alignment: Alignment.center,
                  child: Text(
                    Strings.MARTINA_NATALIE,
                    style: poppinsRegular.copyWith(color: ColorResources.COLOR_CHARCOAL),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            Strings.TRANSACTION_DONE,
            textAlign: TextAlign.center,
            style: montserratSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_DIM_GRAY),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
          child: CustomButton(btnTxt: Strings.DONE, onTap: () {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => WalletStartupScreen()), (route) => false);
          }),
        ),
      ],
    ));
  }
}
