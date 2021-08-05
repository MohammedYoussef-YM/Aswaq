import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/sixvalley/data/model/body/register_model.dart';
import 'package:flutter_ui_kit/sixvalley/localization/language_constrants.dart';
import 'package:flutter_ui_kit/sixvalley/provider/auth_provider.dart';
import 'package:flutter_ui_kit/sixvalley/provider/profile_provider.dart';
import 'package:flutter_ui_kit/sixvalley/utill/color_resources.dart';
import 'package:flutter_ui_kit/sixvalley/utill/custom_themes.dart';
import 'package:flutter_ui_kit/sixvalley/utill/dimensions.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/button/custom_button.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/textfield/custom_password_textfield.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/textfield/custom_textfield.dart';
import 'package:flutter_ui_kit/sixvalley/view/basewidget/show_custom_snakbar.dart';
import 'package:flutter_ui_kit/sixvalley/view/screen/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

class SixSignUpWidget extends StatefulWidget {
  @override
  _SixSignUpWidgetState createState() => _SixSignUpWidgetState();
}

class _SixSignUpWidgetState extends State<SixSignUpWidget> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  GlobalKey<FormState> _formKey;

  FocusNode _fNameFocus = FocusNode();
  FocusNode _lNameFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _phoneFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  FocusNode _confirmPasswordFocus = FocusNode();

  RegisterModel register = RegisterModel();
  bool isEmailVerified = false;


  addUser() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      isEmailVerified = true;

      if (_firstNameController.text.isEmpty) {
        showCustomSnackBar(getTranslated('NAME_FIELD_MUST_BE_REQUIRED', context), context);
      } else if (_emailController.text.isEmpty) {
        showCustomSnackBar(getTranslated('EMAIL_MUST_BE_REQUIRED', context), context);
      } else if (_phoneController.text.isEmpty) {
        showCustomSnackBar(getTranslated('PHONE_MUST_BE_REQUIRED', context), context);
      } else if (_passwordController.text.isEmpty) {
        showCustomSnackBar(getTranslated('PASSWORD_MUST_BE_REQUIRED', context), context);
      } else if (_confirmPasswordController.text.isEmpty) {
        showCustomSnackBar(getTranslated('CONFIRM_PASSWORD_MUST_BE_REQUIRED', context), context);
      } else if (_passwordController.text != _confirmPasswordController.text) {
        showCustomSnackBar(getTranslated('PASSWORD_DID_NOT_MATCH', context), context);
      } else {
        register.fName = '${_firstNameController.text}';
        register.lName = _lastNameController.text ?? " ";
        register.email = _emailController.text;
        register.phone = _phoneController.text;
        register.password = _passwordController.text;
        await Provider.of<SixAuthProvider>(context, listen: false).registration(register);
        Provider.of<SixProfileProvider>(context, listen: false).getUserInfo();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SixDashBoardScreen()));

        _emailController.clear();
        _passwordController.clear();
        _firstNameController.clear();
        _lastNameController.clear();
        _phoneController.clear();
        _confirmPasswordController.clear();
      }
    } else {
      isEmailVerified = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {

    return ListView(
      padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              // for first and last name
              Container(
                margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT),
                child: Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                      hintText: getTranslated('FIRST_NAME', context),
                      textInputType: TextInputType.name,
                      focusNode: _fNameFocus,
                      nextNode: _lNameFocus,
                      isPhoneNumber: false,
                      controller: _firstNameController,
                    )),
                    SizedBox(width: 15),
                    Expanded(
                        child: CustomTextField(
                      hintText: getTranslated('LAST_NAME', context),
                      focusNode: _lNameFocus,
                      nextNode: _emailFocus,
                      controller: _lastNameController,
                    )),
                  ],
                ),
              ),

              // for email
              Container(
                margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT, top: Dimensions.MARGIN_SIZE_SMALL),
                child: CustomTextField(
                  hintText: getTranslated('ENTER_YOUR_EMAIL', context),
                  focusNode: _emailFocus,
                  nextNode: _phoneFocus,
                  textInputType: TextInputType.emailAddress,
                  controller: _emailController,
                ),
              ),

              // for phone

              Container(
                margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT, top: Dimensions.MARGIN_SIZE_SMALL),
                child: CustomTextField(
                  textInputType: TextInputType.number,
                  hintText: getTranslated('ENTER_MOBILE_NUMBER', context),
                  focusNode: _phoneFocus,
                  nextNode: _passwordFocus,
                  controller: _phoneController,
                  isPhoneNumber: true,
                ),
              ),

              // for password
              Container(
                margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT, top: Dimensions.MARGIN_SIZE_SMALL),
                child: CustomPasswordTextField(
                  hintTxt: getTranslated('PASSWORD', context),
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  nextNode: _confirmPasswordFocus,
                  textInputAction: TextInputAction.next,
                ),
              ),

              // for re-enter password
              Container(
                margin: EdgeInsets.only(left: Dimensions.MARGIN_SIZE_DEFAULT, right: Dimensions.MARGIN_SIZE_DEFAULT, top: Dimensions.MARGIN_SIZE_SMALL),
                child: CustomPasswordTextField(
                  hintTxt: getTranslated('RE_ENTER_PASSWORD', context),
                  controller: _confirmPasswordController,
                  focusNode: _confirmPasswordFocus,
                  textInputAction: TextInputAction.done,
                ),
              ),
            ],
          ),
        ),

        // for register button
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
          child: CustomButton(onTap: addUser, buttonText: getTranslated('SIGN_UP', context)),
        ),

        // for skip for now
        Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SixDashBoardScreen()));
                },
              child: Text(getTranslated('SKIP_FOR_NOW', context),
                  style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.getColombiaBlue(context))),
            )),
      ],
    );
  }
}
