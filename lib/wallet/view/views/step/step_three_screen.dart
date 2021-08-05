import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/wallet/utility/colorResources.dart';
import 'package:flutter_ui_kit/wallet/utility/dimensions.dart';
import 'package:flutter_ui_kit/wallet/utility/strings.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';
import 'package:flutter_ui_kit/wallet/view/views/step/step_four_screen.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/button/custom_button.dart';
import 'package:flutter_ui_kit/wallet/view/widgets/custom_app_bar.dart';

class StepThreeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_REGISTRATION_BACKGROUND,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: Strings.STEP3,
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Hero(
                    tag: 4,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3.0,
                      margin: EdgeInsets.only(
                          left: 25, right: 25, top: 15, bottom: 10),
                      padding: EdgeInsets.all(25),
                      child: Image.asset(
                        'assets/wallet/Illustration/fingerprint page.png',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      Strings.FINGERPRINT,
                      style: poppinsRegular.copyWith(fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    padding: EdgeInsets.only(left: 30, right: 20),
                    child: Text(
                      Strings.FINGERPRINT_CONTENT,
                      textAlign: TextAlign.center,
                      style: montserratRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 120,
                    height: 140,
                    margin: EdgeInsets.only(left: 80, right: 80),
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                        color: ColorResources.COLOR_DIM_GRAY.withOpacity(.06),
                        borderRadius: BorderRadius.circular(8)),
                    child: Image.asset(
                      'assets/wallet/Illustration/fingerprint.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              margin: EdgeInsets.only(
                bottom: Dimensions.MARGIN_SIZE_DEFAULT,
                left: Dimensions.MARGIN_SIZE_DEFAULT,
                right: Dimensions.MARGIN_SIZE_DEFAULT,
              ),
              child: CustomButton(
                btnTxt: Strings.CONTINUE,
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => StepFourScreen()));
                },
              ),
            ),

            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.SKIP,
                    style: montserratSemiBold.copyWith(fontSize: 12),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 17,
                      color: ColorResources.COLOR_ROYAL_BLUE,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
