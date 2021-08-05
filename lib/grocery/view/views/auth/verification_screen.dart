import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/colorResources.dart';
import 'package:flutter_ui_kit/grocery/utility/dimensions.dart';
import 'package:flutter_ui_kit/grocery/utility/strings.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/grocery/view/views/auth/widget/auth_header_widget.dart';
import 'package:flutter_ui_kit/grocery/view/views/dashboard/dashboard_screen.dart';
import 'package:flutter_ui_kit/grocery/view/widgets/custom_button.dart';

class VerificationScreen extends StatelessWidget {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final FocusNode _focus1 = FocusNode();
  final FocusNode _focus2 = FocusNode();
  final FocusNode _focus3 = FocusNode();
  final FocusNode _focus4 = FocusNode();

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
                authHeaderWidget(context: context, title: Strings.verification, subTitle: Strings.we_have_just_sent_your_email_an_otp),
                SizedBox(height: 100),
                SizedBox(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CodeBox(
                        controller: _controller1,
                        focusNode: _focus1,
                        nextFocus: _focus2,
                        previousFocus: null,
                      ),
                      CodeBox(controller: _controller2, focusNode: _focus2, nextFocus: _focus3, previousFocus: _focus1),
                      CodeBox(
                        controller: _controller3,
                        focusNode: _focus3,
                        nextFocus: _focus4,
                        previousFocus: _focus2,
                      ),
                      CodeBox(
                        controller: _controller4,
                        focusNode: _focus4,
                        previousFocus: _focus3,
                      ),
                    ],
                  ),
                ),
                Center(child: Text(Strings.resend_on_00,style: poppinsRegular.copyWith(color: ColorResources.COLOR_PRIMARY),)),
              ],
            )),
            Container(
                margin: EdgeInsets.only(left: Dimensions.PADDING_SIZE_DEFAULT, right: Dimensions.PADDING_SIZE_DEFAULT),
                child: CustomButton(
                  btnTxt: Strings.complete,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DashboardScreen()));
                  },
                )),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CodeBox extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode nextFocus;
  final FocusNode previousFocus;

  CodeBox({@required this.controller, @required this.focusNode, this.nextFocus, @required this.previousFocus});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      margin: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT, fontWeight: FontWeight.bold, color: ColorResources.COLOR_PRIMARY),
        maxLength: 1,
        maxLines: 1,
        keyboardType: TextInputType.number,
        // ignore: deprecated_member_use
        maxLengthEnforced: true,
        cursorColor: ColorResources.COLOR_PRIMARY,
        textInputAction: nextFocus == null ? TextInputAction.done : TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          counterText: '',
          contentPadding: EdgeInsets.all(10),
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorResources.COLOR_LIGHT_GRAY, width: 1.0)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorResources.COLOR_PRIMARY, width: 1.0)),
        ),
        onSubmitted: (text) => nextFocus != null ? FocusScope.of(context).requestFocus(nextFocus) : null,
        onChanged: (text) {
          if (text.length == 1) {
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            } else {
              if (!FocusScope.of(context).hasPrimaryFocus) {
                FocusScope.of(context).unfocus();
              }
            }
          } else if (text.isEmpty) {
            if (previousFocus != null) {
              FocusScope.of(context).requestFocus(previousFocus);
            } else {
              if (!FocusScope.of(context).hasPrimaryFocus) {
                FocusScope.of(context).unfocus();
              }
            }
            return;
          }
        },
      ),
    );
  }
}
