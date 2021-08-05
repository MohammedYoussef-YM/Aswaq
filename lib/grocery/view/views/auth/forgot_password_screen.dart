import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/view/views/auth/reset_password_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/auth/widget/auth_header_widget.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_button.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_WHITE,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })),
                SizedBox(height: 50),
                authHeaderWidget(
                    context: context, title: Strings.forgot_password, subTitle: Strings.please_type_your_email_or_phone_number_below_and),
                SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextField(
                    hintText: Strings.email_or_phone_number,
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.done,
                  ),
                ),
              ],
            )),
            Container(
                margin: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT),
                child: CustomButton(
                  btnTxt: Strings.send,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResetPasswordScreen()));
                  },
                )),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
