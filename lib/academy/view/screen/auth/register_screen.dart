import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/academy/utility/images.dart';
import 'package:flutter_ui_kit/academy/utility/strings.dart';
import 'package:flutter_ui_kit/academy/utility/dimensions.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';
import 'package:flutter_ui_kit/academy/view/basewidget/custom_text_field.dart';
import 'package:flutter_ui_kit/academy/view/screen/auth/widget/social_media_button.dart';
import 'package:flutter_ui_kit/academy/view/basewidget/custom_button.dart';
import 'package:flutter_ui_kit/academy/view/screen/dashboard/dashboard_screen.dart';

class AcademyRegisterScreen extends StatefulWidget {
  @override
  _AcademyRegisterScreenState createState() => _AcademyRegisterScreenState();
}

class _AcademyRegisterScreenState extends State<AcademyRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController = TextEditingController();
    final FocusNode _nameNode = FocusNode();
    final FocusNode _emailNode = FocusNode();
    final FocusNode _passwordNode = FocusNode();
    final FocusNode _confirmPasswordNode = FocusNode();

    return Scaffold(
      backgroundColor: AcademyColorResources.COLOR_PRIMARY,
      body: SafeArea(
        child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(AcademyDimensions.PADDING_SIZE_LARGE), children: [
          Image.asset(Images.library, fit: BoxFit.scaleDown,height: 200),
          Text(AcademyStrings.register,
              style: robotoBold.copyWith(fontSize: 30, color: AcademyColorResources.COLOR_WHITE, fontStyle: FontStyle.italic)),
          SizedBox(height: 40),
          CustomTextField(
            controller: _nameController,
            focusNode: _nameNode,
            nextNode: _emailNode,
            hintText: AcademyStrings.full_name,
            suffixIcon: Icons.person_outline,
            textCapitalization: TextCapitalization.words,
          ),
          SizedBox(height: 20),
          CustomTextField(
            controller: _emailController,
            focusNode: _emailNode,
            nextNode: _passwordNode,
            hintText: AcademyStrings.email,
            suffixIcon: Icons.email_outlined,
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20),
          CustomTextField(
            controller: _passwordController,
            focusNode: _passwordNode,
            nextNode: _confirmPasswordNode,
            hintText: AcademyStrings.password,
            suffixIcon: Icons.vpn_key_outlined,
            isPassword: true,
          ),
          SizedBox(height: 20),
          CustomTextField(
            controller: _confirmPasswordController,
            focusNode: _confirmPasswordNode,
            hintText: AcademyStrings.confirm_password,
            suffixIcon: Icons.vpn_key_outlined,
            textInputAction: TextInputAction.done,
            isPassword: true,
          ),
          SizedBox(height: 20),
          CustomButton(
              text: AcademyStrings.register,
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => AcademyDashboardScreen()), (route) => false);
              }),
          SizedBox(height: 50),
          Align(
            alignment: Alignment.center,
            child: Text(AcademyStrings.register_with_social, style: robotoMedium.copyWith(color: AcademyColorResources.COLOR_WHITE)),
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
