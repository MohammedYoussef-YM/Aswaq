import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/view/views/auth/verification_screen.dart';
import 'package:flutter_ui_kit/grocery/view/views/auth/widget/auth_header_widget.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_button.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class ResetPasswordScreen extends StatelessWidget {
  FocusNode _passwordFocus = FocusNode();
  FocusNode _confirmPasswordFocus = FocusNode();

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
                authHeaderWidget(context: context, title: Strings.reset_password, subTitle: Strings.and_now_you_can_type_your_new_password),
                SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextField(
                    hintText: Strings.new_password,
                    inputType: TextInputType.emailAddress,
                    isPassword: true,
                    focusNode: _passwordFocus,
                    nextFocus: _confirmPasswordFocus,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextField(
                    hintText: Strings.confirm_new_password,
                    inputType: TextInputType.emailAddress,
                    isPassword: true,
                    focusNode: _confirmPasswordFocus,
                    inputAction: TextInputAction.done,
                  ),
                ),

                SizedBox(height: 100),
              ],
            )),
            Container(
                margin: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT),
                child: CustomButton(
                  btnTxt: Strings.reset_password,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VerificationScreen()));
                  },
                )),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
