import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/wallet/utility/dimensions.dart';
import 'package:flutter_ui_kit/wallet/utility/strings.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/button/custom_button.dart';

class LastStepConfirmWidget extends StatelessWidget {
  final Function onTap;

  LastStepConfirmWidget({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Hero(
              tag: 6,
              child: Container(
                padding: EdgeInsets.all(25),
                child: Image.asset(
                  'assets/wallet/Illustration/Id confirmation.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Center(
              child: Text(
                Strings.NOW_YOU_ARE,
                style: poppinsRegular.copyWith(fontSize: 17),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              Strings.GET_READY,
              textAlign: TextAlign.center,
              style: montserratRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: Dimensions.MARGIN_SIZE_DEFAULT,
                left: Dimensions.MARGIN_SIZE_DEFAULT,
                right: Dimensions.MARGIN_SIZE_DEFAULT,
                top: Dimensions.MARGIN_SIZE_DEFAULT,
              ),
              child: CustomButton(
                btnTxt: Strings.CONTINUE,
                onTap: () {
                  Navigator.pop(context);
                  onTap();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
