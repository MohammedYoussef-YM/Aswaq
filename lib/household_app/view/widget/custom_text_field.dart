import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/household_app/utility/colorResources.dart';
import 'package:flutter_ui_kit/household_app/utility/dimensions.dart';
import 'package:flutter_ui_kit/household_app/utility/style.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final int maxLines;
  final Widget prefixIcon;
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
      this.prefixIcon,
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
      style: manropeRegular,
      textInputAction: widget.inputAction,
      keyboardType: widget.inputType,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        isDense: true,
        hintText: widget.hintText,
        fillColor: HouseHoldColorResources.COLOR_WHITE,
        hintStyle: manropeRegular.copyWith(color: HouseHoldColorResources.COLOR_CHARCOAL_HINT.withOpacity(.6)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(HouseHoldDimensions.PADDING_SIZE_SMALL),
                borderSide: widget.isBorder ? BorderSide(color: HouseHoldColorResources.COLOR_CHARCOAL_HINT, width: 1.0) : BorderSide.none,
              ),
        focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(HouseHoldDimensions.PADDING_SIZE_SMALL),
                borderSide: widget.isBorder ? BorderSide(color: HouseHoldColorResources.COLOR_PRIMARY, width: 1.0) : BorderSide.none,
              ),

        filled: true,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword || widget.isDateOfBirth
            ? widget.isPassword
                ? IconButton(
                    icon: Icon(!_obscureText ? Icons.visibility : Icons.visibility_off, color: Theme.of(context).hintColor.withOpacity(.3),size: 18,),
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
