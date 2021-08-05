import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_kit/doctor/utility/colorResources.dart';
import 'package:flutter_ui_kit/doctor/utility/dimensions.dart';
import 'package:flutter_ui_kit/doctor/utility/strings.dart';
import 'package:flutter_ui_kit/doctor/utility/style.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintTxt;
  final TextInputType textInputType;
  final int maxLine;
  final FocusNode focusNode;
  final FocusNode nextNode;
  final TextInputAction textInputAction;
  final bool isPhoneNumber;
  final bool isEmail;

  CustomTextField(
      {this.controller,
      this.hintTxt,
      this.textInputType,
      this.maxLine,
      this.focusNode,
      this.nextNode,
      this.textInputAction,
      this.isEmail=false,
      this.isPhoneNumber = false});


  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          TextFormField(
            controller: controller,
            maxLines: maxLine ?? 1,
            focusNode: focusNode,
            keyboardType: textInputType ?? TextInputType.text,
            initialValue: null,
            textInputAction: textInputAction ?? TextInputAction.next,
            onFieldSubmitted: (v) {
              FocusScope.of(context).requestFocus(nextNode);
            },
            inputFormatters: [
              isPhoneNumber?FilteringTextInputFormatter.digitsOnly:
              FilteringTextInputFormatter.singleLineFormatter],
            validator: (input) => isEmail?input.isValidEmail()?null:Strings.PLEASE_PROVIDE_A_VALID_EMAIL:null,
            decoration: InputDecoration(
              hintText: hintTxt ?? '',
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
              isDense: true,
              hintStyle: khulaRegular.copyWith(color: ColorResources.COLOR_GREY,fontSize: Dimensions.FONT_SIZE_SMALL),
              errorStyle: TextStyle(height: 1.5),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
          Positioned(
            bottom: 5,
            left: 0,
            right: 0,
            child: Container(
              height: 1,
              color: ColorResources.COLOR_GAINSBORO,
            ),
          ),
        ],
      ),
    );
  }
}
