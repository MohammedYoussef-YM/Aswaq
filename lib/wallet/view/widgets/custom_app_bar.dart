import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/wallet/utility/colorResources.dart';
import 'package:flutter_ui_kit/wallet/utility/style.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Color color;
  final bool existBackButton;
  CustomAppBar({@required this.title, this.color = ColorResources.COLOR_GRAY, this.existBackButton = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        existBackButton ? IconButton(
          icon: Icon(Icons.chevron_left, size: 25, color: color),
          onPressed: () => Navigator.of(context).pop(),
        ) : SizedBox(),
        Center(child: Text(title, style: montserratSemiBold.copyWith(color: color))),
      ]),
    );
  }
}
