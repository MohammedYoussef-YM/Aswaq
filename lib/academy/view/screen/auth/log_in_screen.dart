import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/images.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:flutter_ui_kit/academy/view/basewidget/custom_text_field.dart';
import 'package:flutter_ui_kit/academy/view/screen/auth/widget/social_media_button.dart';
import 'package:flutter_ui_kit/academy/view/screen/auth/register_screen.dart';
import 'package:flutter_ui_kit/academy/view/basewidget/custom_button.dart';
import 'package:flutter_ui_kit/academy/view/screen/dashboard/dashboard_screen.dart';

class AcademyLogInScreen extends StatefulWidget {
  @override
  _AcademyLogInScreenState createState() => _AcademyLogInScreenState();
}

class _AcademyLogInScreenState extends State<AcademyLogInScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final FocusNode _emailNode = FocusNode();
    final FocusNode _passwordNode = FocusNode();

    return Scaffold(
      backgroundColor: AcademyColorResources.COLOR_PRIMARY,
      body: SafeArea(
        child: ListView(physics: BouncingScrollPhysics(), padding: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_LARGE), children: [
         Image.asset(Images.library, fit: BoxFit.scaleDown,height: 200),
          //
          SizedBox(height: 20),
          Text(AcademyStrings.log_in,
              style: robotoBold.copyWith(fontSize: 30, color: AcademyColorResources.COLOR_WHITE, fontStyle: FontStyle.italic)),
          SizedBox(height: 40),
          CustomTextField(
            controller: _emailController,
            focusNode: _emailNode,
            nextNode: _passwordNode,
            hintText: AcademyStrings.email,
            suffixIcon: Icons.email_outlined,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20),
          CustomTextField(
            controller: _passwordController,
            focusNode: _passwordNode,
            hintText: AcademyStrings.password,
            suffixIcon: Icons.vpn_key_outlined,
            textInputAction: TextInputAction.done,
            isPassword: true,
          ),
          SizedBox(height: 20),
          CustomButton(
              text: AcademyStrings.log_in,
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => AcademyDashboardScreen()), (route) => false);
              }),
          SizedBox(height: 50),
          Align(
            alignment: Alignment.center,
            child: Text(AcademyStrings.forgot_password,
                style: robotoMedium.copyWith(
                  color: AcademyColorResources.COLOR_WHITE,
                  fontSize: AcademyDimensions.FONT_SIZE_LARGE,
                  decoration: TextDecoration.underline,
                )),
          ),
          SizedBox(height: 50),
          Align(
            alignment: Alignment.center,
            child: Text(AcademyStrings.dont_have_an_account,
                textAlign: TextAlign.center,
                style: robotoMedium.copyWith(
                  color: AcademyColorResources.COLOR_WHITE,
                )),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AcademyRegisterScreen())),
            style: TextButton.styleFrom(
              side: BorderSide(color: AcademyColorResources.COLOR_WHITE, width: 2),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(AcademyStrings.register_now, style: robotoBold.copyWith(fontSize: 16, color: AcademyColorResources.COLOR_WHITE)),
          ),
          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SocialMediaButton(icon: Icons.language),
            SocialMediaButton(icon: Icons.biotech_rounded),
            SocialMediaButton(icon: Icons.wifi_tethering),
            SocialMediaButton(icon: Icons.wifi_protected_setup_outlined),
          ]),
        ]),
      ),
    );
  }
}
