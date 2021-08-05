import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/wallet/utility/colorResources.dart';
import 'package:flutter_ui_kit/wallet/utility/strings.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/custom_app_bar.dart';

class CashBackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_REGISTRATION_BACKGROUND,
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                CustomAppBar(title: Strings.CASHBACK),

                Expanded(child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                  Container(
                      padding: EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
                      child: Image.asset('assets/wallet/Illustration/congratulation.png')),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: Strings.You_HAVE_GOT,
                          style: poppinsRegular.copyWith(
                            color: ColorResources.COLOR_BLACK,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: Strings.Doller478,
                          style: poppinsRegular.copyWith(color: ColorResources.COLOR_DARK_ORCHID,fontSize: 18,),
                        ),
                        TextSpan(
                          text: Strings.AS_CASHBACK,
                          style: poppinsRegular.copyWith(
                            color: ColorResources.COLOR_BLACK,
                            fontSize: 18,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 100, left: 100, bottom: 50),
                    child: CustomButton(
                      btnTxt: Strings.CLAIM,
                      onTap: (){},
                      btnHeight: 30,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    width: double.infinity,
                    height: 90,
                    padding: EdgeInsets.only(left: 15, top: 20),
                    decoration: BoxDecoration(
                        color: ColorResources.COLOR_DARK_ORCHID.withOpacity(.1), borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.LAST_MONTH_CASH,
                          style: poppinsRegular,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          Strings.DOLLER347,
                          style: poppinsRegular.copyWith(color: ColorResources.COLOR_DARK_ORCHID,),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                    width: double.infinity,
                    height: 100,
                    padding: EdgeInsets.only(left: 15, top: 20, right: 20),
                    decoration: BoxDecoration(
                        color: ColorResources.COLOR_DARK_ORCHID.withOpacity(.1), borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.NEXT_MONTH_REVOLUTION,
                          style: poppinsRegular,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          Strings.YOU_NEED_TO_USE_AT___,
                          style: poppinsRegular.copyWith(color: ColorResources.COLOR_ROYAL_BLUE,),
                        ),
                      ],
                    ),
                  ),
                ])),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 5,
              right: 5,
              child: Container(
                width: double.infinity,
                child: Image.asset('assets/wallet/Illustration/congratulation-bottom.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
