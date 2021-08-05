import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/academy/utility/colorResources.dart';
import 'package:flutter_ui_kit/dating_app/utility/style.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final FocusNode focusNode;
  final FocusNode nextNode;
  final TextInputAction textInputAction;
  final IconData suffixIcon;
  final IconData prefixIcon;
  final bool isPassword;
  final Color borderColor;
  final bool isGreyColor;
  final TextCapitalization textCapitalization;

  CustomTextField(
      {this.controller,
      this.hintText,
      this.textInputType,
      this.focusNode,
      this.nextNode,
      this.textInputAction,
      this.suffixIcon,
      this.isPassword = false,
      this.textCapitalization,
      this.prefixIcon,
      this.isGreyColor = false,
      this.borderColor = AcademyColorResources.COLOR_WHITE});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      obscureText: isPassword,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      keyboardType: textInputType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.next,
      style: robotoBold.copyWith(color: isGreyColor ? AcademyColorResources.COLOR_GREY : AcademyColorResources.COLOR_WHITE),
      onSubmitted: (v) => FocusScope.of(context).requestFocus(nextNode),
      decoration: InputDecoration(
        hintText: hintText ?? '',
        prefixIcon: Icon(prefixIcon, color: AcademyColorResources.COLOR_GREY, size: 30),
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
        hintStyle: robotoMedium.copyWith(color: isGreyColor ? AcademyColorResources.COLOR_GREY : AcademyColorResources.BORDER_COLOR.withOpacity(.5)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AcademyColorResources.COLOR_ORANGE, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: Icon(suffixIcon, color: AcademyColorResources.COLOR_WHITE, size: 30),
      ),
    );
  }
}
