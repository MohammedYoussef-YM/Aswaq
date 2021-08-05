import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/grocery/utility/style.dart';
import 'package:flutter_ui_kit/driver_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/driver_app/utility/dimensions.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final int maxLines;
  final bool isPassword;
  final bool isCountryPicker;
  final bool isDateOfBirth;
  final bool isBorder;

  CustomTextField(
      {this.hintText = 'Write something...',
      this.controller,
      this.focusNode,
      this.nextFocus,
      this.inputType = TextInputType.text,
      this.inputAction = TextInputAction.next,
      this.maxLines = 1,
      this.isDateOfBirth = false,
      this.isCountryPicker = false,
      this.isBorder = true,
      this.isPassword = false});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: widget.maxLines,
      controller: widget.controller,
      focusNode: widget.focusNode,
      style: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY_DEEP, fontSize: Dimensions.FONT_SIZE_LARGE),
      textInputAction: widget.inputAction,
      keyboardType: widget.inputType,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL, top: Dimensions.PADDING_SIZE_SMALL),
        isDense: true,
        hintText: widget.hintText,
        fillColor: Colors.transparent,
        hintStyle: poppinsRegular.copyWith(color: ColorResources.COLOR_GRAY.withOpacity(0.7), fontSize: Dimensions.FONT_SIZE_DEFAULT),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        filled: true,
        suffixIcon: widget.isPassword || widget.isDateOfBirth
            ? widget.isPassword
                ? IconButton(
                    icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off, color: Theme.of(context).hintColor.withOpacity(.3)),
                    onPressed: _toggle)
                : IconButton(icon: Icon(Icons.calendar_today, color: Theme.of(context).hintColor.withOpacity(.3)), onPressed: _toggle)
            : null,
      ),
      onSubmitted: (text) => FocusScope.of(context).requestFocus(widget.nextFocus),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
